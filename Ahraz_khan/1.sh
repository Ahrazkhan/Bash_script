#!/bin/bash


# check arguments count
# $# is bash's built-in, that holds count of parameters
# -ne means if it's NOT EQUAL (not equal to 2 in this case)
if [ $# -ne 2 ]; then
	echo "Usage: $0 <folder path> <string pattern>"
	exit 2
fi

# empty array, will fill leter
arr=()

# loop in folder
while read file; do
	# if search pattern matched in this file (-i means case insensitive, -E means to use regex, -q means to not print anyting)
	if grep -i -E -q "$2" "$file"; then
		# -c means to return count of occurances
		count=$(grep -iEc "$2" "$file")
		echo "File name: $file"
		echo "File size in bytes: "$(du -b < "$file" | awk '{print $1}') 	# du -b <file> returns file size in bytes
		echo "Pattern matched: "$count
		echo
		# check if count is greater or equal to 2, and if yes then add to array
		if [[ $count -ge 2 ]]; then arr+=("$file");fi
	fi
done <<< $(find "$1" -type f)

# i is index of elements in array,
i=0
# count of ellements in array
count=${#arr[@]}

if [ $count -ge 1 ]; then
	echo -e "\n\nFiles that matched at least twice:\n\n"

	# until $i is greater that $count
	until [ $i -gt $count ]; do
		# echo i-th element from array
		echo ${arr[$i]}
		echo ${arr[$i]} >> report.txt # save to report.txt as well
		let i++	# increase i
	done
fi
