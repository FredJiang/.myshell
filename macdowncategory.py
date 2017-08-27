#!/usr/bin/python
#coding:utf-8

import sys
import re

markdownFileName = sys.argv[1]

titleCount = 0
intendLevelPre = 0

for line in open(markdownFileName):
    matchSharp = re.search(r"^#+", line)
    matchLine = re.search(r"^#([\s\S]*)", line)
    if matchLine:
        title = re.sub("^#* +", "", matchLine.group(0))
        title = re.sub("\n", "", title)
        idTitle = "toc_" + str(titleCount)
        result = "* [" + title + "]" + "(#" + re.sub(" ", "-", idTitle) + ")"
        titleCount += 1;
        intendLevel = len(matchSharp.group(0))
        for x in range(0, intendLevel):
            result = " " + result
        if (intendLevelPre != intendLevel):
            print('')
        intendLevelPre = intendLevel
        print(result)

