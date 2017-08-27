#!/bin/sh

nocom="withcom"

if ! [ -z "$1" ]
then
    nocom=$1
fi

outputFileMerge="/tmp/autodoc_$(date +%Y%m%d%H%M%S)"
outputFileMergeDevide="/tmp/autodocDevide_$(date +%Y%m%d%H%M%S)"

echo outputFileMergeDevide $outputFileMergeDevide

touch $outputFileMerge
touch $outputFileMergeDevide

function parseInputFile() {
    inputfile=$1
    outputFileMerge=$2
    nocom=$3
    #echo inputfile $inputfile
    #echo outputFileMerge $outputFileMerge

    if [ $nocom == "nocom" ]
    then
        cat $inputfile | \
            awk -v inputfile=$inputfile '/\/\/ autodoc / {printf("%s\n", $0                                                                          );}' | \
            grep '\/\/ autodoc \S* [0-9]* ' | \
            sed 's/^\s*//' | \
            sort >> "$outputFileMerge"
    else
        cat $inputfile | \
            awk -v inputfile=$inputfile '/\/\/ autodoc / {printf("%s\n", $0    " "    "\x27"    ">>>>>>filepath:"    inputfile    " "    NR    "\x27");}' | \
            grep '\/\/ autodoc \S* [0-9]* ' | \
            sed 's/^\s*//' | \
            sort >> "$outputFileMerge"
    fi

}

export -f parseInputFile

find . -type f ! -path "*/\.git/*" ! -path "*/node_modules/*" ! -path "*/test/*" -name "*\.js" | \
    xargs -I param \
          bash -c "parseInputFile \"param\" \"$outputFileMerge\" \"$nocom\""


cat $outputFileMerge | sort |
    awk '
BEGIN {
  preKey="";
}

{
  currentKey=$3;
  if (preKey != currentKey) {
    if (preKey == "") {
       print "";
       print $3;
       print "";
       print "@startuml";
       print "start";
    } else {
      print "stop";
      print "@enduml";
      print "";
      print "";
      print "";
      print $3;
      print "";
      print "@startuml";
      print "start";
    }
  }
  preKey = currentKey;
  print $0;
}

END {
  print "stop";
  print "@enduml";
}
' > $outputFileMergeDevide


if [ $nocom == "nocom" ]
then
    cat $outputFileMergeDevide | sed 's/\/\/ autodoc \S* [0-9]* //'
else
    cat $outputFileMergeDevide
fi

#echo '@startuml' >> $outputFileMerge
#echo 'start' >> $outputFileMerge
#echo 'stop' >> $outputFileMerge
#echo '@enduml' >> $outputFileMerge