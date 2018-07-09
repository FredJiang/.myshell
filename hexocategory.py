#!/usr/bin/python
#coding:utf-8

import logging
# logging.basicConfig(level=logging.DEBUG,  
#                     format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',  
#                     datefmt='%Y-%m-%d %H:%M:%S')

# kms
# hexocategory.py 微信支付宝储值.md "id-微信支付宝储值-" | grep -v "    "


import sys
import re

markdownFileName = sys.argv[1]

headPrefix = ""
if len(sys.argv) >= 3:
    headPrefix = sys.argv[2]

for line in open(markdownFileName):
    matchSharp = re.search(r"^#+", line)
    matchLine = re.search(r"^#([\s\S]*)", line)
    if matchLine:
        logging.debug(matchLine.group(0))
        title = re.sub("^#* +", "", matchLine.group(0))
        logging.debug(title)
        title = re.sub("\n", "", title)
        logging.debug(title)
        result = "* [" + title + "]" + "(#" + headPrefix + re.sub(" |\.", "-", title) + ")"
        logging.debug(result)
        for x in range(0, len(matchSharp.group(0))):
            result = " " + result
        print(result)
