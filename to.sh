#!/bin/bash
asd=`awk -F " " '{print $8}' $1`
#echo $asd
i=1
b=""
rm -rf aaa.txt
for a in $asd; do
b="$a,$b"
echo "$i $a";
if [ $(( i % 32 )) -eq 0 ]; then echo "$b" >> aaa.txt ; if [ $(( i % 32 )) -gt 0 ]; then i=$((i-1)); fi; b=""; fi
i=$((i+1));
done

