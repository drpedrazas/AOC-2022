#!/bin/bash
filename='input'
re='^[0-9]+$'
arrVar=()
curr=0
maxim=0
while read line; do
# reading each line
if [[ $line =~ $re ]]; then
	curr=$(expr $curr + $line)
else
	if [[ curr -gt maxim ]]; then
		maxim=$curr
	fi
	curr=0
fi
done < $filename
echo "$maxim"
