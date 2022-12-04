import json, heapq, urllib.request, subprocess, os
VERSION = '1.19.2'
PACK_FORMAT = 10
NAMESPACE = 'blockstate'
GENERATE_FUNCTIONS = True


def download_block_data(version):
    print('Connecting...')
    with urllib.request.urlopen('https://piston-meta.mojang.com/mc/game/version_manifest_v2.json') as f:
        data = json.load(f)

    print('Searching '+version+'...')
    for x in data['versions']:
        if x['id'] == version:
            url = x['url']
            break
    else:
        print('Not found')
        return

    print('Connecting...')
    with urllib.request.urlopen(url) as f:
        url = json.load(f)['downloads']['server']['url']

    print('Downloading server.jar...')
    os.mkdir('BLOCKSTATE_TEMP')
    urllib.request.urlretrieve(url,'BLOCKSTATE_TEMP/server.jar')

    print('Running the data generator...')
    subprocess.call(['java','-DbundlerMainClass=net.minecraft.data.Main','-jar','server.jar','--reports'],cwd='BLOCKSTATE_TEMP')

    print('Copying the data...')
    with open('BLOCKSTATE_TEMP/generated/reports/blocks.json','r') as f:
        data = json.load(f)
    for key in data:
        del data[key]['states']
        if len(data[key]) != 0:
            data[key] = data[key]['properties']

    print('Removing temporal files...')
    temp = list(os.walk('BLOCKSTATE_TEMP', topdown=False))
    assert len(temp) < 1000
    for root, dirs, files in temp:
        for name in files:
            os.remove(os.path.join(root, name))
        for name in dirs:
            os.rmdir(os.path.join(root, name))
    os.rmdir('BLOCKSTATE_TEMP')
    del temp

    print('Done')
    return data


def remove_minecraft_namespace(text):
    if text.startswith('minecraft:'):
        return text[10:]
    return text


def state_to_key(state):
    temp = state.copy()
    for key in state:
        temp[key] = tuple(sorted(temp[key]))
    return tuple(sorted(temp.items()))


os.makedirs(f'data/{NAMESPACE}/loot_tables',exist_ok=True)
with open('pack.mcmeta','w') as f:
    f.write('''{
   "pack": {
      "pack_format": %s,
      "description": "https://github.com/Triton365/BlockState"
   }
}'''%PACK_FORMAT)
if GENERATE_FUNCTIONS == True:
    os.makedirs(f'data/{NAMESPACE}/functions/private',exist_ok=True)
    os.makedirs('data/minecraft/tags/functions',exist_ok=True)
    with open('data/minecraft/tags/functions/load.json','w') as f:
        f.write(f'''{{
  "values": [
    "{NAMESPACE}:private/load"
  ]
}}''')
    with open(f'data/{NAMESPACE}/functions/summon_falling_block.mcfunction','w',encoding='utf-8') as f:
        f.write(f'''execute unless entity 98d008a9-d6de-4068-b9a4-e4eebbe5bc4f run tellraw @s "Loading chunk... (29999999, 0)"

# https://bugs.mojang.com/browse/MC-72849
# MC-72849: /data 명령어로 폴링블록의 BlockState를 변경해도 제대로 반영되지 않는 버그
# 폴링블록을 먼 곳(29999999, 0, 0)에 소환한 뒤 그곳에서 BlockState를 변경,
# 그 다음에 폴링블록을 원하는 위치로 tp하는 식으로 우회할 수 있습니다.


# 데이터를 한꺼번에 적용하기 위한 임시 저장소
data modify storage {NAMESPACE}: temp set value {{Tags:[]}}

# {NAMESPACE}:get 루트테이블 호출, 결과를 임시 저장소로 복사 ··· (1)
loot replace entity 98d008a9-d6de-4068-b9a4-e4eebbe5bc4f container.0 loot {NAMESPACE}:get
execute store result storage {NAMESPACE}: success byte 1 run data modify storage {NAMESPACE}: temp.BlockState set from entity 98d008a9-d6de-4068-b9a4-e4eebbe5bc4f Item.tag

# 무빙 피스톤일 경우 이 블록의 blockState 값을 가져와 임시 저장소로 복사
execute if block ~ ~ ~ moving_piston run data modify storage {NAMESPACE}: temp.BlockState set from block ~ ~ ~ blockState

# 블록의 모든 NBT를 가져와 임시 저장소로 복사
execute unless block ~ ~ ~ moving_piston run data modify storage {NAMESPACE}: temp.TileEntityData set from block ~ ~ ~

# (1)이 성공한 경우 폴링블록 소환
execute if data storage {NAMESPACE}: {{success:1b}} in overworld run summon falling_block 29999999 19999999 0 {{Time:1,DropItem:0b,Tags:[{NAMESPACE}.init]}}

# 임시 저장소에 있던 모든 데이터를 폴링블록에 적용, 그리고 함수 호출 위치로 tp
execute as @e[type=falling_block,tag={NAMESPACE}.init] run function {NAMESPACE}:private/as_falling_block
#│  data modify entity @s {{}} merge from storage {NAMESPACE}: temp
#└─ tp @s ~ ~ ~''')
    with open(f'data/{NAMESPACE}/functions/private/as_falling_block.mcfunction','w') as f:
        f.write(f'''data modify entity @s {{}} merge from storage {NAMESPACE}: temp
tp @s ~ ~ ~''')
    with open(f'data/{NAMESPACE}/functions/private/load.mcfunction','w') as f:
        f.write(f'''data modify storage {NAMESPACE}: loaded set value 1b
forceload add 29999999 0
execute unless entity 98d008a9-d6de-4068-b9a4-e4eebbe5bc4f in overworld run summon item_frame 29999999 19999999 0 {{Fixed:1b,Invisible:1b,Invulnerable:1b,UUID:[I;-1731196759,-690077592,-1180375826,-1142571953]}}''')

filename = 'block_list_'+VERSION+'.json'
if os.path.isfile(filename):
    with open(filename,'r') as f:
        data = json.load(f)
else:
    data = download_block_data(VERSION)
    with open(filename,'w') as f:
        json.dump(data,f,indent=2)


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
    def get_number_of_case(self): # 이 엔트리가 담당하는 블록의 모든 경우의 수 계산
        if self.number_of_case == None:
            if self.type == 'alternatives':
                self.number_of_case = 0
                for child in self.children:
                    self.number_of_case += child.get_number_of_case()
            elif self.type == 'loot_table':
                self.number_of_case = entry_files[self.name].get_number_of_case()
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
                self.block_detection_count_sum = entry_files[self.name].get_block_detection_count()
        return self.block_detection_count_sum
    def get_average_lag(self): # get_block_detection_count / get_number_of_case
        if self.average_lag == None:
            self.average_lag = self.get_block_detection_count() / self.get_number_of_case()
        return self.average_lag
    def __lt__(self,other): # 렉 비교, self < other
        return self.get_average_lag() < other.get_average_lag()
    def write_to_file(self,f): # 파일 f에 작성
        f.write('{"type":"%s"'%self.type)
        if self.type == 'item':
            f.write(',"name":"%s"'%self.name)
        if self.type == 'loot_table':
            f.write(f',"name":"{NAMESPACE}:{self.name:03}"')
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
            self.children[0].write_to_file(f)
            for child in self.children[1:]:
                f.write(',')
                child.write_to_file(f)
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
    def __init__(self,block,loot_type='item',name='cod'):
        super().__init__()
        self.type = loot_type
        self.name = name
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
    def __init__(self,block_entry_A,block_entry_B):
        super().__init__()
        self.type = 'alternatives'
        self.exception = block_entry_A.exception or block_entry_B.exception
        self.blocks = block_entry_A.blocks + block_entry_B.blocks
        assert (block_entry_A.exception and block_entry_B.exception) == False
        # 한 쪽이 예외 엔트리인 경우
        # 예외 엔트리가 첫번째 children이 아닌 두번째 children에 오도록 설계
        if block_entry_A.exception:
            self.children = [block_entry_B,block_entry_A]
            block_entry_B.conditions.append('{"condition":"location_check","predicate":{"block":{"blocks":["%s"]}}}'%('","'.join(block_entry_B.blocks)))
        else:
            self.children = [block_entry_A,block_entry_B]
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
def f(block_group_list,state_group_list,name=None):
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
    f(block_group_list_A,state_group_list_A,len(entry_files)-1)
    # B는 기존 루트테이블(name)에 연결하여 재귀
    f(block_group_list_B,state_group_list_B,name)
f(block_group_list,state_group_list)


# 블록이 감지되지 않는 경우의 엔트리 (공허 or 언로드된 청크)
main_entries.append(ExceptionBlockEntry())


# main_entries 리스트에 있는 모든 엔트리를
# 하나의 get.json 루트테이블로 통합
heapq.heapify(main_entries)
while len(main_entries) >= 2:
    # 연산량이 가장 적은 엔트리 두 개를 뽑아 alternatives로 병합
    a = heapq.heappop(main_entries)
    b = heapq.heappop(main_entries)
    c = CombinedBlockEntry(a,b)
    print(f'{a.get_average_lag():.3f}+{b.get_average_lag():.3f}->{c.get_average_lag():.3f}',end=', ')
    heapq.heappush(main_entries,c)


# 파일 출력
with open(f'data/{NAMESPACE}/loot_tables/get.json','w') as f:
    f.write('{"type":"command","pools":[{"rolls":1,"entries":[')
    main_entries[0].write_to_file(f)
    f.write(']}]}')
for filename,e in enumerate(entry_files):
    with open(f'data/{NAMESPACE}/loot_tables/{filename:03}.json','w') as f:
        f.write('{"type":"command","pools":[{"rolls":1,"entries":[')
        e.write_to_file(f)
        f.write(']}]}')
