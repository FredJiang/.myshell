#!/usr/bin/python
#coding:utf-8


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
        title = re.sub("^#* +", "", matchLine.group(0))
        title = re.sub("\n", "", title)
        result = "* [" + title + "]" + "(#" + headPrefix + re.sub(" ", "-", title) + ")"
        for x in range(0, len(matchSharp.group(0))):
            result = " " + result
        print(result)

