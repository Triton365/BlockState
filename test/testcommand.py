import json, heapq, urllib.request, subprocess, os, zipfile, sys, itertools


VERSION = '1.21.11'
NAMESPACE = 'blockstate'
TEMP_DIRECTORY_NAME = 'BLOCKSTATE_TEMP_872be9e0a76f4da1'

if len(sys.argv) >= 2:
    VERSION = sys.argv[1]


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


# with open('testdata.json','r') as f:
#     data = json.load(f)

def remove_minecraft_namespace(text):
    if text.startswith('minecraft:'):
        return text[10:]
    return text


def mcstr(x):
    if x in ('true','false') or x.isdigit():
        return '"'+x+'"'
    return x



with open('testcommand.mcfunction','w') as f:
    fwrite = f.write
    linenum = 5
    fwrite('gamerule max_command_sequence_length 2147483647\n')
    fwrite('say test start\n')
    for block,states in data.items():
        block = remove_minecraft_namespace(block)
        keys = states.keys()
        if keys:
            for values in itertools.product(*states.values()):
                keysvalues = zip(keys,values)
                fwrite('setblock ~ ~ ~ '+block+'[')
                fwrite(','.join(map(lambda x: x[0]+'='+x[1], keysvalues)))
                fwrite('] strict\n')

                fwrite('loot replace block 0 0 0 contents loot blockstate:get\n')

                keysvalues = zip(keys,values)
                fwrite('execute unless items block 0 0 0 contents cod[custom_data={Name:"minecraft:'+block+'",Properties:{')
                fwrite(','.join(map(lambda x: x[0]+':'+mcstr(x[1]), keysvalues)))
                fwrite('}}] run say ERR'+str(linenum)+'\n')
                linenum += 3
        else:
            fwrite('setblock ~ ~ ~ '+block+' strict\n')
            fwrite('loot replace block 0 0 0 contents loot blockstate:get\n')
            fwrite('execute unless items block 0 0 0 contents cod[custom_data={Name:"minecraft:'+block+'"}] run say ERR'+str(linenum)+'\n')
            linenum += 3
    fwrite('say test end\n')

