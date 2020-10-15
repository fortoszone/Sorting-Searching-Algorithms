#!/bin/bash

declare -a arr
echo "Enter space separated ascendingly sorted integers:"
read -ra arr

declare -i search
echo -n "Enter the element to be searched for: "
read -r search

index=-1
beg=0
mid=0
last=${#arr[@]}
last=$((last - 1))

while [ $beg -le $last ]; do
	echo -e "\nbeg=$beg\nmid=$mid\nlast=$last\n"
	mid=$((beg + last))
	mid=$((mid/2))
	if [ "${arr[$mid]}" -eq "$search" ]; then
		index=$mid
		break
	elif [ "${arr[$mid]}" -gt "$search" ]; then
		last=$((mid - 1))
	elif [ "${arr[$mid]}" -lt "$search" ]; then
		beg=$((mid + 1))
	fi
done

if [ $index -ne -1 ]; then
	echo "Element found at $((index+1))"
else
	echo "Element not found"
fi
