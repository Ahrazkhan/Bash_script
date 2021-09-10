#!/bin/bash

# this will be displayed when menu appears
PS3="Select the operation: "

### FUNCTIONS ###

function write_to_file {
	# reset old values
	unset name content
	# print prompt and save input to "$name"
	read -p "enter file name: " name
	echo "enter content now, type 'end' to end"

	while true; do
		# read and save in "$contet"
		read content
		if [[ "$content" != "end" ]]; then
			# save to $name
			echo "$content" >> "$name"
		else
			# if content was "end" break loop
			break
		fi
	done
}

function print_file {
	# reset old value
	unset name
	# print prompt and save input to "$name"
	read -p 'enter file name to read: ' name
	# if file exists, "cat" it's content
	if [ -f "$name" ]; then
		cat "$name"
	else
		echo "ERROR: $name doesn't exist"
	fi
}

function rename_file {
	# reset old values
	unset old new
	# print prompt and save input to "$old" (same for "$new")
	read -p 'enter existing file name: ' old
	read -p 'enter new file name: ' new
	# if "$old" is file (is file, exists)
	if [ -f "$old" ]; then
		mv "$old" "$new"
	else
		echo "ERROR: $old doesn't exist"
	fi
}

function quit {
	echo "Good bye"
	exit
}

function menu {
	echo "1] write
2] print
3] rename
4] exit"
}

while true; do
	menu
	read -p 'Choose option[1/4]: ' opt
	case $opt in
		1)
			write_to_file
		;;
		2)
			print_file
		;;
		3)
			rename_file
		;;
		4)
			quit
		;;
		*)
			# REPLY is built-in variable that holds value of select in this case
			echo "Invalid option $REPLY"
		;;
	esac
done
