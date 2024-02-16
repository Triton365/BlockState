import sys

VERSION = sys.argv[1]

with open('test.txt','w') as f:
    f.write(VERSION)
