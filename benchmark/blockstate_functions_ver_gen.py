import json, heapq, urllib.request, subprocess, os, zipfile


VERSION = '1.19.2'
PACK_FORMAT = 10
NAMESPACE = 'blockstate_f'
TEMP_DIRECTORY_NAME = 'BLOCKSTATE_F_TEMP_872be9e0a76f4da1'


DATAMODIFY_LAG = 77
BLOCKCHECK_LAG = 23
PREDICATE_LAG = 40
FUNCTION_LAG = 14


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


print('Running the data generator...')
subprocess.call(['java','-DbundlerMainClass=net.minecraft.data.Main','-jar','server.jar','--reports'],cwd=TEMP_DIRECTORY_NAME)


print('Copying the data...')
state_dict = dict()
block_list = list()
with open(f'{TEMP_DIRECTORY_NAME}/generated/reports/blocks.json','r') as f:
    for key,value in json.load(f).items():
        if key.startswith('minecraft:'):
            key = key[10:]
        block_list.append(key)
        if len(value) != 1:
            state_dict[key] = value['properties']

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
        l.extend(sorted(str_list))
        return 'str'
    l.extend(sorted(map(int,int_list)))
    if len(str_list) == 0:
        return 'int'
    l.extend(sorted(str_list))
    return 'mixed'


SPLIT_TABLE = [[],[1],[1,1],[1,1,1],[1,1,1,1],[1,1,1,1,1],[1,1,1,1,1,1],[1,3,3],[2,3,3],[3,3,3],[3,3,4],[3,4,4],[4,4,4],[3,3,3,4],[3,3,4,4],[3,4,4,4],[4,4,4,4],[4,4,4,5],[4,4,5,5],[4,5,5,5],[5,5,5,5],[4,4,4,4,5],[4,4,4,5,5],[4,4,5,5,5],[4,5,5,5,5],[5,5,5,5,5],[8,9,9],[9,9,9],[9,9,10],[9,10,10],[10,10,10],[10,10,11],[10,11,11],[11,11,11],[11,11,12],[11,12,12],[12,12,12],[12,12,13],[12,12,14],[12,12,15],[12,12,16],[12,14,15],[12,15,15],[12,15,16],[12,16,16],[15,15,15],[15,15,16],[15,16,16],[16,16,16],[12,12,12,13],[12,12,12,14],[12,12,12,15],[12,12,12,16],[12,12,14,15],[12,12,15,15],[12,12,15,16],[12,12,16,16],[12,15,15,15],[12,15,15,16],[12,15,16,16],[12,16,16,16],[15,15,15,16],[15,15,16,16],[15,16,16,16],[16,16,16,16]]
def divide_function_tree(maxy):
    miny = 0
    maxy -= 1
    length = (maxy-miny)+1
    if length < len(SPLIT_TABLE):
        split = SPLIT_TABLE[length]
    else:
        div,mod = divmod(length,4)
        split = [div,div,div,div]
        for i in range(mod):
            split[i] += 1
    for step in split:
        maxy = miny + step
        yield (miny,maxy-1)
        miny = maxy






class Command:
    pass

class LiteralCommand(Command):
    def __init__(self,text):
        self.text = text
    def write_directly(self,fwrite):
        fwrite(self.text)

class ExecuteIfBlockCommand(Command):
    def __init__(self,block,run):
        self.block = block
        self.run = run
    def write_directly(self,fwrite):
        fwrite(f'execute if block ~ ~ ~ {self.block} run ')
        self.run.write_directly(fwrite)

class ExecuteIfBlockStateCommand(Command):
    def __init__(self,key,value,run):
        self.key = key
        self.value = value
        self.run = run
    def write_directly(self,fwrite):
        fwrite(f'execute if block ~ ~ ~ #{NAMESPACE}:all[{self.key}={self.value}] run ')
        self.run.write_directly(fwrite)
    def get_lag(self):
        return BLOCKCHECK_LAG

class ExecuteIfBlockTagCommand(Command):
    def __init__(self,block_tag,run):
        self.block_tag = block_tag
        self.run = run
    def write_directly(self,fwrite):
        fwrite(f'execute if block ~ ~ ~ #{NAMESPACE}:{self.block_tag.get_name()} run ')
        self.run.write_directly(fwrite)
        write_list.append(self.block_tag)

class ExecuteIfPredicateCommand(Command):
    def __init__(self,predicate,run):
        self.predicate = predicate
        self.run = run
    def write_directly(self,fwrite):
        fwrite(f'execute if predicate {NAMESPACE}:{self.predicate.get_name()} run ')
        self.run.write_directly(fwrite)
        write_list.append(self.predicate)
    def get_lag(self):
        return PREDICATE_LAG

class FunctionCommand(Command):
    def __init__(self,function):
        self.function = function
    def write_directly(self,fwrite):
        fwrite(f'function {NAMESPACE}:__/{self.function.get_name()}')
        write_list.append(self.function)

class DataModifyNameCommand(Command):
    def __init__(self,block):
        self.block = block
    def write_directly(self,fwrite):
        fwrite(f'data modify storage {NAMESPACE}: BlockState set value {{Name:"minecraft:{self.block}"}}')

class DataModifyPropertiesCommand(Command):
    def __init__(self,key,value):
        self.key = key
        self.value = value
    def write_directly(self,fwrite):
        fwrite(f'data modify storage {NAMESPACE}: BlockState.Properties.{self.key} set value "{self.value}"')

class DataModifyNamePropertiesCommand(Command):
    def __init__(self,block,state_dict):
        self.block = block
        self.state_dict = dict()
        for key,value_list in state_dict.items():
            self.state_dict[key] = value_list[0]
    def write_directly(self,fwrite):
        state = ','.join([f'{key}:"{value}"' for key,value in self.state_dict.items()])
        fwrite(f'data modify storage {NAMESPACE}: BlockState set value {{Name:"minecraft:{self.block}",Properties:{{{state}}}}}')





class IntStateCheckPredicate:
    duplicate_check = set()
    def __init__(self,key,value_list):
        self.key = key
        self.vmin = value_list[0]
        self.vmax = value_list[-1]
    def get_name(self):
        return f'state.{self.key}.{self.vmin}..{self.vmax}'
    def write(self,main_zip):
        name = self.get_name()
        if name not in IntStateCheckPredicate.duplicate_check:
            IntStateCheckPredicate.duplicate_check.add(name)
            with main_zip.open(f'data/{NAMESPACE}/predicates/{name}.json','w') as f:
                f.write(f'{{"condition":"location_check","predicate":{{"block":{{"state":{{"age":{{"min":{self.vmin},"max":{self.vmax}}}}}}}}}}}'.encode())

class BlockTag:
    count = 0
    duplicate_check = set()
    def __init__(self,block_list):
        self.block_list = block_list
        self.name = BlockTag.count
        BlockTag.count += 1
    def get_name(self):
        return f'group.{self.name:03}'
    def write(self,main_zip):
        name = self.get_name()
        if name not in BlockTag.duplicate_check:
            BlockTag.duplicate_check.add(name)
            with main_zip.open(f'data/{NAMESPACE}/tags/blocks/{name}.json','w') as f:
                f.write('{"values":["'.encode())
                f.write('","'.join(self.block_list).encode())
                f.write('"]}'.encode())





class Function:
    duplicate_check = set()
    def write(self,main_zip):
        name = self.get_name()
        if name not in Function.duplicate_check:
            Function.duplicate_check.add(name)
            with main_zip.open(f'data/{NAMESPACE}/functions/__/{name}.mcfunction','w') as f:
                fwrite = lambda x: f.write(x.encode())
                self.write_directly(fwrite)
    def write_directly(self,fwrite):
        linebreak = False
        for command in self.commands:
            if linebreak: fwrite('\n')
            else: linebreak = True
            command.write_directly(fwrite)
    def flatten_to(self,func):
        func.commands.extend(self.commands)
        self.commands.clear()
    def __lt__(self,other):
        return self.lag_avg < other.lag_avg

class StrStateSearchFunction(Function):
    def __init__(self,key,value_list):
        self.lag_sum = BLOCKCHECK_LAG*len(value_list)*len(value_list)
        self.lag_sum += DATAMODIFY_LAG*len(value_list)
        self.commands = []
        for value in value_list:
            self.commands.append(ExecuteIfBlockStateCommand(key,value,DataModifyPropertiesCommand(key,value)))
    def get_name(self):
        return f'state.{key}.' + '.'.join(value_list)


class IntStateSearchFunction(Function):
    def __init__(self,key,value_list):
        self.lag_sum = 0
        self.key = key
        self.value_list = value_list
        self.commands = []
        for start,end in divide_function_tree(len(value_list)):
            if start == end:
                self.commands.append(ExecuteIfBlockStateCommand(key,value_list[end],DataModifyPropertiesCommand(key,value_list[end])))
                self.lag_sum += DATAMODIFY_LAG
                self.lag_sum += BLOCKCHECK_LAG*len(value_list)
            else:
                sliced_list = value_list[start:end+1]
                func = IntStateSearchFunction(key,sliced_list)
                pred = IntStateCheckPredicate(key,sliced_list)
                self.commands.append(ExecuteIfPredicateCommand(pred,FunctionCommand(func)))
                self.lag_sum += func.lag_sum
                self.lag_sum += FUNCTION_LAG*len(sliced_list)
                self.lag_sum += PREDICATE_LAG*len(value_list)
    def get_name(self):
        return f'state.{self.key}.' + '.'.join(map(str,self.value_list))

class SingleBlockFunction(Function):
    def __init__(self,block):
        self.block = block
        self.commands = []
        self.cases = 1
        for key,value_list in state_dict[block].items():
            self.cases *= len(value_list)
        self.lag_sum = DATAMODIFY_LAG*self.cases
        for key,value_list in state_dict[block].items():
            list_type = get_list_type(value_list)
            if list_type == 'str':
                func = StrStateSearchFunction(key,value_list[1:])
            elif list_type == 'int':
                func = IntStateSearchFunction(key,value_list[1:])
            elif list_type == 'mixed':
                raise NotImplementedError('이런 게 나올리는 없겠지 : ' + str(key) + str(values))
            l = 0
            for c in func.commands: l += c.get_lag()
            self.lag_sum += (func.lag_sum + l) * (self.cases//len(value_list))
            func.flatten_to(self)
        self.commands.insert(0,DataModifyNamePropertiesCommand(block,state_dict[block]))
        self.lag_avg = self.lag_sum / self.cases
    def get_name(self):
        return 'block.'+self.block
    def get_blocks(self):
        return [self.block]
    def get_command(self):
        return ExecuteIfBlockCommand(self.block,FunctionCommand(self))

class SingleBlockNoStateFunction(Function):
    def __init__(self,block):
        self.block = block
        self.lag_sum = BLOCKCHECK_LAG + DATAMODIFY_LAG
        self.cases = 1
        self.lag_avg = self.lag_sum
    def get_name(self):
        return 'block.'+self.block
    def get_blocks(self):
        return [self.block]
    def get_command(self):
        return ExecuteIfBlockCommand(self.block,DataModifyNameCommand(self.block))

class CombinedBlockFunction(Function):
    def __init__(self,func_list):
        block_list = []
        self.commands = []
        self.lag_sum = 0
        self.cases = 0
        for f in func_list:
            self.cases += f.cases
        for f in func_list:
            block_list.extend(f.get_blocks())
            self.commands.append(f.get_command())
            self.lag_sum += f.lag_sum
            self.lag_sum += FUNCTION_LAG*f.cases
            self.lag_sum += BLOCKCHECK_LAG*self.cases
        self.block_tag = BlockTag(block_list)
        self.lag_avg = self.lag_sum / self.cases
    def get_name(self):
        return self.block_tag.get_name()
    def get_blocks(self):
        return self.block_tag.block_list
    def get_command(self):
        return ExecuteIfBlockTagCommand(self.block_tag,FunctionCommand(self))



class AllBlockTag(BlockTag):
    def __init__(self,block_list):
        self.block_list = block_list
    def get_name(self):
        return 'all'

class MainFunction(CombinedBlockFunction):
    def __init__(self,func):
        self.commands = [LiteralCommand(f'execute unless block ~ ~ ~ #{NAMESPACE}:all run data modify storage {NAMESPACE}: BlockState set value {{}}')]
        func.flatten_to(self)
    def write(self,main_zip):
        with main_zip.open(f'data/{NAMESPACE}/functions/get.mcfunction','w') as f:
            fwrite = lambda x: f.write(x.encode())
            self.write_directly(fwrite)



func_list = []
for block in block_list:
    if block in state_dict:
        func_list.append(SingleBlockFunction(block))
    else:
        func_list.append(SingleBlockNoStateFunction(block))

heapq.heapify(func_list)
while len(func_list) >= 2:
    f = [heapq.heappop(func_list) for _ in func_list[:4]]
    c = CombinedBlockFunction(f)
    print(f[0].lag_avg,end='')
    for x in f[1:]: print(' + '+str(x.lag_avg),end='')
    print(' => '+str(c.lag_avg))
    heapq.heappush(func_list,c)

write_list = [AllBlockTag(block_list),MainFunction(func_list[0])]
with zipfile.ZipFile(f'BlockState_F_{VERSION}.zip','w') as main_zip:
    while write_list:
        write_list.pop().write(main_zip)
    with main_zip.open('pack.mcmeta','w') as f:
        f.write(f'''{{
  "pack": {{
    "pack_format": {PACK_FORMAT},
    "description": "https://github.com/Triton365/BlockState"
  }}
}}'''.encode())
    with main_zip.open('LICENSE','w') as f:
        f.write(f'''MIT License

Copyright (c) 2023 Triton365

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
