import sys, zipfile
VERSION = sys.argv[1]
with zipfile.ZipFile(f'BlockState_{VERSION}.zip') as myzip:
    myzip.extractall()
with open(f'VERSION.txt','w') as f:
    f.write(f'{VERSION}')
