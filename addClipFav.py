# encoding=utf-8
'''
本文件负责：
- 从 clips 下找到最新的 avc 文件
- 复制到 fav 并按传入的中文重命名
- 中文转拼音，往 ClipFav.ahk 里续代码
- 返回，ahk 触发 ClipJump 的重启操作

TODO:
查重功能
排序归档
'''



import os
from os import listdir
from os.path import isfile, join

def list_files_inpath(inpath, end='', sta='', ins=''):
    return [f for f in listdir(inpath) if (isfile(join(inpath, f)) and f.startswith(sta) and f.endswith(end) and ins in f)]

pathClipJump = os.path.realpath(__file__).replace(r'plugins\addClipFav.py','')

import re

def atoi(text):
    return int(text) if text.isdigit() else text

def natural_keys(text):
    '''
    alist.sort(key=natural_keys) sorts in human order
    http://nedbatchelder.com/blog/200712/human_sorting.html
    '''
    return [ atoi(c) for c in re.split(r'(\d+)', text) ]

def last_fav():
    li = list_files_inpath(pathClipJump+r'cache\clips', end='.avc')
    li.sort(key=natural_keys)
    return li[-1]

import shutil

def copy_rename(s='未命名'):
    src = pathClipJump+'cache\\clips\\'+last_fav()
    print(src)
    dst = pathClipJump+'cache\\fav\\'+s+'.avc'
    print(dst)

    shutil.copyfile(src, dst)

    # os.rename(r'C:\Users\Administrator.SHAREPOINTSKY\Desktop\Work\name.txt',r'C:\Users\Administrator.SHAREPOINTSKY\Desktop\Newfolder\details.txt' )



from pypinyin import pinyin, lazy_pinyin, Style

def cn2py(s):
    li = pinyin(s, style=Style.FIRST_LETTER)
    return ''.join([r[0] for r in li])


def update_ahk(s):
    with open(pathClipJump+"plugins\\ClipFav.ahk", "a+", encoding='utf-8') as file_object:
        file_object.write(f'\n:*:]{cn2py(s)}::\npface("{s}")\nreturn\n')




def copy_and_update(s):
    copy_rename(s)
    update_ahk(s)



import sys


if __name__ == '__main__':

    # print(update_ahk('黑猫中心'))

    # sys.argv = [sys.argv[0], '熊猫一棒']

    copy_and_update(sys.argv[1])

    # input("按任意键退出 \n ")

