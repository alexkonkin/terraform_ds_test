#!/bin/bash

#LINE="$1"
#lines=$(cat numbers.txt|head -$LINE|tail -1)
#jq -n --arg output "$lines" '{data:$output}'
#lines='Debian, Red, Hat, Suse, Fedora'
cnt=0
max=$(cat numbers.txt|wc -l)
while read rows;do
  let cnt++
  if [[ $cnt -lt $max ]]; then
    lines+=$rows','
  else
    lines+=$rows
  fi
done < numbers.txt
jq -n --arg output "$lines" '{data:$output}'

