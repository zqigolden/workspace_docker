#!/usr/bin/env python3
import pathlib
import sys
import os

if pathlib.Path(sys.argv[-1]).is_dir():
    os.chdir(sys.argv[-1])
else:
    assert 'globmv' in sys.argv[-1]
ans = input(f'move all subfolder images in {os.getcwd()} to one folder? Y/N\n')
if ans.upper() not in {'Y', 'YES'}:
    exit()
for p in pathlib.Path('.').rglob('*.jpg'):
    new_path = str(p).replace('/', '__')
    p.rename(new_path)
print('done')

