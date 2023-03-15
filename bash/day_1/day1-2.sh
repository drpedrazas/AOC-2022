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
	if [[ $curr -eq 9354 ]]; then
		echo "hace parte"
	fi
	temp=$((curr))
	arrVar+=($temp)
	curr=0
fi
done < $filename
IFS=$'\n' sorted=($(sort <<<"${arrVar[*]}"))
unset IFS
for value in "${sorted[@]}"
do
	echo $value
done
final=$(expr ${sorted[-2]} + ${sorted[-3]} + ${sorted[-4]})
echo "$final"
