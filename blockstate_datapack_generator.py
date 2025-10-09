import json, heapq, urllib.request, subprocess, os, zipfile, sys


VERSION = '1.21.9'
NAMESPACE = 'blockstate'
TEMP_DIRECTORY_NAME = 'BLOCKSTATE_TEMP_872be9e0a76f4da1'

if len(sys.argv) >= 2:
    VERSION = sys.argv[1]


def version_compare(v1,c,v2):
    v1 = list(map(int,v1.split('.')))
    v2 = list(map(int,v2.split('.')))
    length = max(len(v1),len(v2))
    v1 += [0]*(length-len(v1))
    v2 += [0]*(length-len(v2))
    for x1,x2 in zip(v1,v2):
        if x1 != x2:
            if x1 > x2:
                return c == '>' or c == '>='
            return c == '<' or c == '<='
    return c == '==' or c == '>=' or c == '<='


STRINGFY_STATE_VALUES = False
if version_compare(VERSION,'>=','1.20.2'):
    STRINGFY_STATE_VALUES = True

INLINE_LOOT_TABLE_ALLOWED = False
LOOT_TABLE_ENTRY_NAME = 'name'
CUSTOM_DATA_ITEM_MODIFIER = "set_nbt"
PREDICATE_SINGLE_BLOCK_ALLOWED = False
if version_compare(VERSION,'>=','1.20.5'):
    INLINE_LOOT_TABLE_ALLOWED = True
    LOOT_TABLE_ENTRY_NAME = 'value'
    CUSTOM_DATA_ITEM_MODIFIER = "set_custom_data"
    PREDICATE_SINGLE_BLOCK_ALLOWED = True

DATAPACK_DIRECTORY_PATH_S = 's'
if version_compare(VERSION,'>=','1.21'):
    DATAPACK_DIRECTORY_PATH_S = ''

PACK_FORMAT_FUNC = lambda x: f'"pack_format": {x["data"]}'
if version_compare(VERSION,'>=','1.21.9'):
    PACK_FORMAT_FUNC = lambda x: f'"min_format": {x["data_major"]},\n"max_format": {x["data_major"]}'



print('Connecting...')
with urllib.request.urlopen('https://piston-meta.mojang.com/mc/game/version_manifest_v2.json') as f:
    data = json.load(f)


print('Searching '+VERSION+'...')
for x in data['versions']:
    if x['id'] == VERSION:
        url = x['url']
        break
else:
    print('Not found')
    exit()


print('Connecting...')
with urllib.request.urlopen(url) as f:
    url = json.load(f)['downloads']['server']['url']


print('Downloading server.jar...')
os.mkdir(TEMP_DIRECTORY_NAME)
urllib.request.urlretrieve(url,f'{TEMP_DIRECTORY_NAME}/server.jar')


print('Determining pack format...')
with zipfile.ZipFile(f'{TEMP_DIRECTORY_NAME}/server.jar','r') as zf:
    with zf.open('version.json') as f:
        pack_format_string = PACK_FORMAT_FUNC(json.load(f)['pack_version'])


print('Running the data generator...')
subprocess.call(['java','-DbundlerMainClass=net.minecraft.data.Main','-jar','server.jar','--reports'],cwd=TEMP_DIRECTORY_NAME)


print('Copying the data...')
with open(f'{TEMP_DIRECTORY_NAME}/generated/reports/blocks.json','r') as f:
    rdata = json.load(f)
data = dict()
for key in rdata:
    data[key] = rdata[key].get('properties',dict())
del rdata


print('Removing temporal files...')
temp = list(os.walk(TEMP_DIRECTORY_NAME, topdown=False))
assert len(temp) < 1000
for root, dirs, files in temp:
    for name in files:
        os.remove(os.path.join(root, name))
    for name in dirs:
        os.rmdir(os.path.join(root, name))
os.rmdir(TEMP_DIRECTORY_NAME)
del temp


def remove_minecraft_namespace(text):
    if text.startswith('minecraft:'):
        return text[10:]
    return text


def state_to_key(state):
    temp = state.copy()
    for key in state:
        temp[key] = tuple(sorted(temp[key]))
    return tuple(sorted(temp.items()))


# block_group_list = [['acacia_button','birch_button',...],     ['acacia_door','birch_door',...],                ...]
# state_group_list = [{'face':['floor','wall','ceiling'],...},  {'facing':['north','south','west','east'],...},  ...]
data_table = dict()
block_group_list = []
state_group_list = []
for block,state in data.items():
    key = state_to_key(state)
    if key in data_table:
        i = data_table[key]
    else:
        i = len(state_group_list)
        data_table[key] = i
        block_group_list.append([])
        state_group_list.append(state)
    block_group_list[i].append(remove_minecraft_namespace(block))
del data_table
del data


# 루트 테이블 엔트리
class Entry:
    def __init__(self):
        self.functions = []
        self.conditions = []
        self.number_of_case = None
        self.block_detection_count_sum = None
        self.average_lag = None
        self.exception = False
    def set_last(self,loot_type,name): # children 엔트리 중 type:loot_table 엔트리를 탐색하여 루트테이블 ID 설정
        if self.type == 'alternatives':
            for child in self.children:
                child.set_last(loot_type,name)
        else:
            self.type = loot_type
            self.name = name
    def get_loot_table(self):
        if isinstance(self.name,int):
            return entry_files[self.name]
        else:
            return self.name
    def get_number_of_case(self): # 이 엔트리가 담당하는 블록의 모든 경우의 수 계산
        if self.number_of_case == None:
            if self.type == 'alternatives':
                self.number_of_case = 0
                for child in self.children:
                    self.number_of_case += child.get_number_of_case()
            elif self.type == 'loot_table':
                self.number_of_case = self.get_loot_table().get_number_of_case()
            else:
                self.number_of_case = 1
        return self.number_of_case
    def get_block_detection_count(self): # 이 엔트리가 발생시키는 모든 블록 감지 횟수의 합 계산
        if self.block_detection_count_sum == None:
            self.block_detection_count_sum = 0
            if self.type == 'alternatives':
                conditionSum = 0
                for child in self.children:
                    conditionSum += len(child.conditions)
                    self.block_detection_count_sum += child.get_number_of_case()*conditionSum
                    self.block_detection_count_sum += child.get_block_detection_count()
            elif self.type == 'loot_table':
                self.block_detection_count_sum = self.get_loot_table().get_block_detection_count()
        return self.block_detection_count_sum
    def get_average_lag(self): # get_block_detection_count / get_number_of_case
        if self.average_lag == None:
            self.average_lag = self.get_block_detection_count() / self.get_number_of_case()
        return self.average_lag
    def __lt__(self,other): # 렉 비교, self < other
        return self.get_average_lag() < other.get_average_lag()
    def write_to_file(self,fwrite): # 파일 f에 작성
        fwrite('{"type":"%s"'%self.type)
        if self.type == 'item':
            fwrite(',"name":"%s"'%self.name)
        if self.type == 'loot_table':
            fwrite(f',"{LOOT_TABLE_ENTRY_NAME}":')
            if isinstance(self.name,int):
                fwrite(f'"{NAMESPACE}:{self.name:03}"')
            else:
                fwrite('{"type":"command","pools":[{"rolls":1,"entries":[')
                self.name.write_to_file(fwrite)
                fwrite(']}]}')
        if self.conditions:
            fwrite(',"conditions":[')
            fwrite(','.join(self.conditions))
            fwrite(']')
        if self.functions:
            fwrite(',"functions":[')
            fwrite(','.join(self.functions))
            fwrite(']')
        if self.type == 'alternatives':
            fwrite(',"children":[')
            self.children[0].write_to_file(fwrite)
            for child in self.children[1:]:
                fwrite(',')
                child.write_to_file(fwrite)
            fwrite(']')
        fwrite('}')


# 엔트리, 그런데 정수 상태를 이진 탐색하는 children 엔트리를 자동 생성하는
class IntStateCheckEntry(Entry):
    def __init__(self,key,values):
        super().__init__()
        if len(values) == 1:
            self.type = 'item'
            self.functions.append('{"function":"%s","tag":"{Properties:{%s:\'%d\'}}"}'%(CUSTOM_DATA_ITEM_MODIFIER,key,values[0]))
        elif len(values) >= 2:
            self.type = 'alternatives' # alternatives 기반 2진 탐색
            mid = (len(values)+1)//2
            leftpart = IntStateCheckEntry(key,values[:mid])
            rightpart = IntStateCheckEntry(key,values[mid:])
            if rightpart.type == 'alternatives':
                self.children = [leftpart]+rightpart.children
            else:
                self.children = [leftpart,rightpart]
            if STRINGFY_STATE_VALUES:
                if len(values) == 2: self.children[0].conditions.append('{"condition":"location_check","predicate":{"block":{"state":{"%s":"%d"}}}}'%(key,values[mid-1]))
                else:                self.children[0].conditions.append('{"condition":"location_check","predicate":{"block":{"state":{"%s":{"max":"%d"}}}}}'%(key,values[mid-1]))
            else:
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
                if STRINGFY_STATE_VALUES: self.children[-1].conditions = ['{"condition":"location_check","predicate":{"block":{"state":{"%s":"%s"}}}}'%(key,value)]
                else:                     self.children[-1].conditions = ['{"condition":"location_check","predicate":{"block":{"state":{"%s":%s}}}}'%(key,value)]
                self.children[-1].functions  = ['{"function":"%s","tag":"{Properties:{%s:\'%s\'}}"}'%(CUSTOM_DATA_ITEM_MODIFIER,key,value)]
            else:
                self.children[-1].conditions = ['{"condition":"location_check","predicate":{"block":{"state":{"%s":"%s"}}}}'%(key,value)]
                self.children[-1].functions  = ['{"function":"%s","tag":"{Properties:{%s:%s}}"}'%(CUSTOM_DATA_ITEM_MODIFIER,key,value)]
        self.children[-1].conditions.clear()

# 블록 엔트리, 그런데 현 위치의 블록이 self.block 리스트에 있는 경우
class SimpleBlockEntry(Entry):
    def __init__(self,block,loot_type='item',name='cod'):
        super().__init__()
        self.type = loot_type
        self.name = name
        self.exception = False
        self.blocks = [block]
        self.functions.append('{"function":"%s","tag":"{Name:\'minecraft:%s\'}"}'%(CUSTOM_DATA_ITEM_MODIFIER,block))

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
    def __init__(self,block_entry_A,block_entry_B):
        super().__init__()
        self.type = 'alternatives'
        self.exception = block_entry_A.exception or block_entry_B.exception
        self.blocks = block_entry_A.blocks + block_entry_B.blocks
        assert (block_entry_A.exception and block_entry_B.exception) == False
        # 한 쪽이 예외 엔트리인 경우
        # 예외 엔트리가 첫번째 children이 아닌 두번째 children에 오도록 설계
        if block_entry_A.exception:
            block_entry_A,block_entry_B = block_entry_B,block_entry_A
        if block_entry_B.type == 'alternatives':
            self.children = [block_entry_A] + block_entry_B.children
        else:
            self.children = [block_entry_A,block_entry_B]
        if PREDICATE_SINGLE_BLOCK_ALLOWED and len(block_entry_A.blocks) == 1:
            block_entry_A.conditions.append('{"condition":"location_check","predicate":{"block":{"blocks":"%s"}}}'%block_entry_A.blocks[0])
        else:
            block_entry_A.conditions.append('{"condition":"location_check","predicate":{"block":{"blocks":["%s"]}}}'%('","'.join(block_entry_A.blocks)))


# ['1','2','3','4'] => 'int'
# ['a','b','c','d'] => 'str'
# ['1','2','a','b'] => 'mixed'
def get_list_type(l):
    assert len(l) >= 2
    int_list = []
    str_list = []
    for x in l:
        if x.isdigit():
            int_list.append(x)
        else:
            str_list.append(x)
    l.clear()
    if len(int_list) == 0:
        l.extend(str_list)
        return 'str'
    l.extend(sorted(map(int,int_list)))
    if len(str_list) == 0:
        return 'int'
    l.extend(str_list)
    return 'mixed'


entry_files = []  # 숫자 루트테이블 엔트리
main_entries = [] # get.json 루트테이블에 들어가는 엔트리
def mainf(block_group_list,state_group_list,name=None):
    # state가 없는 모든 블록을 각각 SimpleBlockEntry로 변환하여 main_entries에 대기
    i = 0
    while i < len(state_group_list):
        if len(state_group_list[i]) == 0:
            for block in block_group_list[i]:
                if name == None:
                    main_entries.append(SimpleBlockEntry(block))
                else:
                    main_entries.append(SimpleBlockEntry(block,'loot_table',name))
            del block_group_list[i]
            del state_group_list[i]
            i -= 1
        i += 1
    # 리스트가 비었다면 정지
    if len(state_group_list) == 0:
        return
    # state_group_list에서 빈도수가 가장 높은 state를 탐색
    state_counter = dict()
    max_state = ()
    max_list = []
    for i in range(len(state_group_list)):
        for state_key,state_value in state_group_list[i].items():
            counter_state = (state_key,tuple(sorted(state_value)))
            counter_list = state_counter.setdefault(counter_state,[])
            counter_list.append(i)
            if len(counter_list) > len(max_list):
                max_list = counter_list
                max_state = counter_state
    del state_counter
    # max_state = ("waterlogged",("true","false"))
    # max_list = [1,2,4,6,...]
    # 빈도수가 가장 높은 state를 처리하는 루트테이블을 작성
    max_key = max_state[0]
    max_value = list(max_state[1])
    max_type = get_list_type(max_value)
    if max_type == 'int':
        e = IntStateCheckEntry(max_key,max_value)
    elif max_type == 'str':
        e = StrStateCheckEntry(max_key,max_value)
    elif max_type == 'mixed':
        raise NotImplementedError('이런 게 나올리는 없겠지 : ' + str(max_key) + str(max_value))
    if name == None:
        e.set_last('item','cod')
    else:
        e.set_last('loot_table',name)
    # 루트테이블 인라인 가능 여부 테스트
    if INLINE_LOOT_TABLE_ALLOWED and len(max_list) == 1:
        index = max_list[0]
        if len(block_group_list[index]) == 1 and len(state_group_list[index]) == 1:
            print('inlined :', block_group_list[index], state_group_list[index])
            main_entries.append(SimpleBlockEntry(block_group_list[index][0],'loot_table',e))
            del block_group_list[index]
            del state_group_list[index]
            mainf(block_group_list,state_group_list,name)
            return
    entry_files.append(e)
    # 빈도수가 가장 높은 state가 포함된 리스트(A)와 포함되지 않은 리스트(B)로 나눔
    j = 0
    block_group_list_A = []
    state_group_list_A = []
    block_group_list_B = []
    state_group_list_B = []
    for i in range(len(state_group_list)):
        if max_list and i == max_list[0]:
            del max_list[0]
            del state_group_list[i][max_key] # 빈도수가 가장 높았던 state를 A에서 제거
            block_group_list_A.append(block_group_list[i])
            state_group_list_A.append(state_group_list[i])
        else:
            block_group_list_B.append(block_group_list[i])
            state_group_list_B.append(state_group_list[i])
    del max_list
    del block_group_list
    del state_group_list
    # A는 방금 만든 루트테이블(len(entry_files)-1)에 연결하여 재귀
    mainf(block_group_list_A,state_group_list_A,len(entry_files)-1)
    # B는 기존 루트테이블(name)에 연결하여 재귀
    mainf(block_group_list_B,state_group_list_B,name)
mainf(block_group_list,state_group_list)


# 블록이 감지되지 않는 경우의 엔트리 (공허 or 언로드된 청크)
main_entries.append(ExceptionBlockEntry())


# main_entries 리스트에 있는 모든 엔트리를
# 하나의 get.json 루트테이블로 통합
heapq.heapify(main_entries)
while len(main_entries) >= 2:
    # 연산량이 가장 적은 엔트리 두 개를 뽑아 alternatives로 병합
    # TODO: ReturnFunctionTree
    a = heapq.heappop(main_entries)
    b = heapq.heappop(main_entries)
    c = CombinedBlockEntry(a,b)
    print(f'{a.get_average_lag():.3f}+{b.get_average_lag():.3f}->{c.get_average_lag():.3f}',end=', ')
    heapq.heappush(main_entries,c)


with zipfile.ZipFile(f'BlockState_{VERSION}.zip','w') as main_zip:
    with main_zip.open('pack.mcmeta','w') as f:
        f.write(f'''{{
  "pack": {{
    {pack_format_string},
    "description": "https://github.com/Triton365/BlockState"
  }}
}}'''.encode())
    with main_zip.open('LICENSE','w') as f:
        f.write(f'''MIT License

Copyright (c) 2025 Triton365

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
'''.encode())
    with main_zip.open(f'data/{NAMESPACE}/loot_table{DATAPACK_DIRECTORY_PATH_S}/get.json','w') as f:
        fwrite = lambda x: f.write(x.encode())
        fwrite('{"type":"command","pools":[{"rolls":1,"entries":[')
        main_entries[0].write_to_file(fwrite)
        fwrite(']}]}')
    for filename,e in enumerate(entry_files):
        with main_zip.open(f'data/{NAMESPACE}/loot_table{DATAPACK_DIRECTORY_PATH_S}/{filename:03}.json','w') as f:
            fwrite = lambda x: f.write(x.encode())
            fwrite('{"type":"command","pools":[{"rolls":1,"entries":[')
            e.write_to_file(fwrite)
            fwrite(']}]}')
print('Done!')
