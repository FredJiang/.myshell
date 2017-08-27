#!/usr/bin/python
#coding:utf-8

import sys
import re

markdownFileName = sys.argv[1]

for line in open(markdownFileName):
    matchSharp = re.search(r"^#+", line)
    matchLine = re.search(r"^#([\s\S]*)", line)
    if matchLine:
        title = re.sub("^#* +", "", matchLine.group(0))
        title = re.sub("\n", "", title)
        result = "* [" + title + "]" + "(#" + re.sub(" ", "-", title) + ")"
        for x in range(0, len(matchSharp.group(0))):
            result = " " + result
        print(result)