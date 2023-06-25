#!/bin/bash
filename='input'
re='^[0-9]+$'
arrVar=()
curr=0
maxim=0
n=1
while read line; do
# reading each line
if [[ $line =~ $re ]]; then
	curr=$(expr $curr + $line)
	echo "$line"
	n=$((n+1))
else
	echo "$line"
	echo "curr $curr en $n"
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
final=$(expr ${sorted[-1]} + ${sorted[-2]} + ${sorted[-3]})
echo "$final"
