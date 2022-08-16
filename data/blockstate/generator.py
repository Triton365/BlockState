import json, heapq

stateDict = dict()
blockList = []
stateList = []
with open('data.min.json','r') as f:
    #https://github.com/Arcensoth/mcdata/blob/master/processed/reports/blocks/simplified/data.min.json
    data = json.loads(f.read())
for block in data.keys():
    states = data[block]["properties"]
    temp = states.copy()
    for key in states.keys():
        temp[key] = tuple(sorted(temp[key]))
    key = tuple(sorted(temp.items()))
    if key in stateDict:
        blockList[stateDict[key]].append(block[10:])
    else:
        stateDict[key] = len(stateList)
        blockList.append([block[10:]])
        stateList.append(states)
# blockList = [["air","stone","granite", ...],["grass","podzol","mycellium"], ...]
# stateList = [{},                            {"snowy":["true","false"]},     ...]


# 루트 테이블 엔트리
class Entry:
    def __init__(self):
        self.functions = []
        self.conditions = []
        self.numberOfCase = None
        self.blockDetectionCountSum = None
        self.averageLag = None
        self.exception = False
    def setLast(self,lootType,name): # children 엔트리 중 type:loot_table 엔트리를 탐색하여 루트테이블 ID 설정
        if self.type == 'alternatives':
            for child in self.children:
                child.setLast(lootType,name)
        else:
            self.type = lootType
            self.name = name
    def getNumberOfCase(self): # 이 엔트리가 담당하는 블록의 모든 경우의 수 계산
        if self.numberOfCase == None:
            if self.type == 'alternatives':
                self.numberOfCase = 0
                for child in self.children:
                    self.numberOfCase += child.getNumberOfCase()
            elif self.type == 'loot_table':
                self.numberOfCase = entryFiles[self.name].getNumberOfCase()
            else:
                self.numberOfCase = 1
        return self.numberOfCase
    def getBlockDetectionCountSum(self): # 이 엔트리가 발생시키는 모든 블록 감지 횟수의 합 계산
        if self.blockDetectionCountSum == None:
            self.blockDetectionCountSum = 0
            if self.type == 'alternatives':
                conditionSum = 0
                for child in self.children:
                    conditionSum += len(child.conditions)
                    self.blockDetectionCountSum += child.getNumberOfCase()*conditionSum
                    self.blockDetectionCountSum += child.getBlockDetectionCountSum()
            elif self.type == 'loot_table':
                self.blockDetectionCountSum = entryFiles[self.name].getBlockDetectionCountSum()
        return self.blockDetectionCountSum
    def getAverageLag(self): # getBlockDetectionCountSum / getNumberOfCase
        if self.averageLag == None:
            self.averageLag = self.getBlockDetectionCountSum() / self.getNumberOfCase()
        return self.averageLag
    def __lt__(self,other): # self < other
        return self.getAverageLag() < other.getAverageLag()
    def writeToFile(self,f): # 파일 f에 작성
        f.write('{"type":"%s"'%self.type)
        if self.type == 'item':
            f.write(',"name":"%s"'%self.name)
        if self.type == 'loot_table':
            f.write(',"name":"blockstate:%03d"'%self.name)
        if self.conditions:
            f.write(',"conditions":[')
            f.write(','.join(self.conditions))
            f.write(']')
        if self.functions:
            f.write(',"functions":[')
            f.write(','.join(self.functions))
            f.write(']')
        if self.type == 'alternatives':
            f.write(',"children":[')
            self.children[0].writeToFile(f)
            for child in self.children[1:]:
                f.write(',')
                child.writeToFile(f)
            f.write(']')
        f.write('}')


# 엔트리, 그런데 정수 상태를 이진 탐색하는 children 엔트리를 자동 생성하는
class IntStateCheckEntry(Entry):
    def __init__(self,key,values):
        super().__init__()
        if len(values) == 1:
            self.type = 'item'
            self.functions.append('{"function":"set_nbt","tag":"{Properties:{%s:\'%d\'}}"}'%(key,values[0]))
        elif len(values) >= 2:
            self.type = 'alternatives' # alternatives 기반 2진 탐색
            mid = (len(values)+1)//2
            self.children = [IntStateCheckEntry(key,values[:mid]),IntStateCheckEntry(key,values[mid:])]
            if len(values) == 2: self.children[0].conditions.append('{"condition":"location_check","predicate":{"block":{"state":{"%s":%d}}}}'%(key,values[mid-1]))
            else:                self.children[0].conditions.append('{"condition":"location_check","predicate":{"block":{"state":{"%s":{"max":%d}}}}}'%(key,values[mid-1]))

# 엔트리, 그런데 문자열 상태를 선형 탐색하는 children 엔트리를 자동 생성하는
class StrStateCheckEntry(Entry):
    def __init__(self,key,values):
        super().__init__()
        self.type = 'alternatives'
        self.children = []
        for value in values: # 그냥 선형 탐색
            self.children.append(Entry())
            self.children[-1].type = 'item'
            if value in ('true','false'):
                self.children[-1].conditions = ['{"condition":"location_check","predicate":{"block":{"state":{"%s":%s}}}}'%(key,value)]
                self.children[-1].functions  = ['{"function":"set_nbt","tag":"{Properties:{%s:\'%s\'}}"}'%(key,value)]
            else:
                self.children[-1].conditions = ['{"condition":"location_check","predicate":{"block":{"state":{"%s":"%s"}}}}'%(key,value)]
                self.children[-1].functions  = ['{"function":"set_nbt","tag":"{Properties:{%s:%s}}"}'%(key,value)]
        self.children[-1].conditions.clear()

# 블록 엔트리, 그런데 현 위치의 블록이 self.block 리스트에 있는 경우
class SimpleBlockEntry(Entry):
    def __init__(self,block):
        super().__init__()
        self.type = 'loot_table'
        self.exception = False
        self.blocks = [block]
        self.functions.append('{"function":"set_nbt","tag":"{Name:\'minecraft:%s\'}"}'%block)

# 블록 엔트리, 그런데 현 위치의 블록이 예외인 경우
class ExceptionBlockEntry(Entry):
    def __init__(self):
        super().__init__()
        self.type = 'item'
        self.name = 'cod'
        self.exception = True
        self.blocks = []

# 블록 엔트리, 그런데 두 블록 엔트리를 받아서 alternatives로 합쳐주는
class CombinedBlockEntry(Entry):
    def __init__(self,blockEntryA,blockEntryB):
        super().__init__()
        self.type = 'alternatives'
        self.exception = blockEntryA.exception or blockEntryB.exception
        self.blocks = blockEntryA.blocks + blockEntryB.blocks
        assert (blockEntryA.exception and blockEntryB.exception) == False
        # 한 쪽이 예외 엔트리인 경우
        # 예외 엔트리가 첫번째 children이 아닌 두번째 children에 오도록 설계
        if blockEntryA.exception:
            self.children = [blockEntryB,blockEntryA]
            blockEntryB.conditions.append('{"condition":"location_check","predicate":{"block":{"blocks":["%s"]}}}'%('","'.join(blockEntryB.blocks)))
        else:
            self.children = [blockEntryA,blockEntryB]
            blockEntryA.conditions.append('{"condition":"location_check","predicate":{"block":{"blocks":["%s"]}}}'%('","'.join(blockEntryA.blocks)))


# 리스트 항목의 타입 리턴
# ['1','2','3','4'] => 'int'
# ['a','b','c','d'] => 'str'
# ['1','2','a','b'] => 'mixed'
def listType(l):
    assert len(l) >= 2
    intList = []
    strList = []
    for x in l:
        if x.isdigit():
            intList.append(x)
        else:
            strList.append(x)
    l.clear()
    if len(intList) == 0:
        l.extend(strList)
        return 'str'
    l.extend(sorted(map(int,intList)))
    if len(strList) == 0:
        return 'int'
    l.extend(strList)
    return 'mixed'


entryFiles = []   # 숫자 루트테이블의 시작 엔트리
mainEntries = []  # get.json 루트테이블에 들어가는 마지막 엔트리
for i in range(len(blockList)):
    blocks = blockList[i]     # ex) blocks = ["grass","podzol","mycellium"]
    states = stateList[i]     # ex) states = {"snowy":["true","false"]}
    if len(states) >= 1:
        for block in blocks:
            e = SimpleBlockEntry(block)
            mainEntries.append(e)
            e.setLast('loot_table',len(entryFiles))
        for key in states:             # ex) key = "snowy"
            values = states[key]       # ex) values = ["true","false"]
            assert len(values) >= 2
            e.setLast('loot_table',len(entryFiles))
            valueType = listType(values)
            if valueType == 'int': # ex) values = ["1","2","3","4"]
                e = IntStateCheckEntry(key,values)
            elif valueType == 'str': # ex) values = ["a","b","c","d"]
                e = StrStateCheckEntry(key,values)
            elif valueType == 'mixed': # ex) values = ["1","2","a","b"]
                raise NotImplementedError('이런 게 나올리는 없겠지 : '+ str(values)) # 나오면 ㄹㅇ 큰일
            entryFiles.append(e)
        e.setLast('item','cod')
    elif len(states) == 0: # states = {}
        for block in blocks: # 그냥 get.json에 각각 넣음
            e = SimpleBlockEntry(block)
            mainEntries.append(e)
            e.setLast('item','cod')


# 블록이 감지되지 않는 경우의 엔트리 (공허 or 언로드된 청크)
mainEntries.append(ExceptionBlockEntry())


# mainEntries 리스트에 있는 모든 엔트리를
# 하나의 get.json 루트테이블로 통합
heapq.heapify(mainEntries)
while len(mainEntries) >= 2:
    # 연산량이 가장 적은 엔트리 두 개를 뽑아 alternatives로 병합
    a = heapq.heappop(mainEntries)
    b = heapq.heappop(mainEntries)
    c = CombinedBlockEntry(a,b)
    print(a.getAverageLag(),'+',b.getAverageLag(),'->',c.getAverageLag())
    heapq.heappush(mainEntries,c)


# 파일 출력
with open('loot_tables/get.json','w') as f:
    f.write('{"type":"command","pools":[{"rolls":1,"entries":[')
    mainEntries[0].writeToFile(f)
    f.write(']}]}')
for fileName,e in enumerate(entryFiles):
    with open('loot_tables/%03d.json'%fileName,'w') as f:
        f.write('{"type":"command","pools":[{"rolls":1,"entries":[')
        e.writeToFile(f)
        f.write(']}]}')
