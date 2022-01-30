#!/usr/bin/python

#
# change master playlist to have only base res entry
#

import os.path
import sys


def rewriteFile(path):
    if (os.path.exists(path)) :
        f = open(path)
        lines = []
        prev = ''
        ils = f.readlines()
        for line in ils:
            if line.startswith('#EXTM3U'):
                lines.append(line)
            elif line.startswith('hls/'):
                lines.append(prev)
                lines.append(line)
            
            if line.startswith('#EXT-X') or line.startswith('hls'):
                prev = line

        f.close()
        
        f = open(path, 'w');
        for line in lines:
            if line.startswith('#EXTM3U'): 
                f.write(line)
                f.write('\n')
            else :
                f.write(line)
        f.write('\n')
        f.close()
            
def main():
    path = sys.argv[1]
    rewriteFile(path)

   
if __name__ == '__main__':
    main()
