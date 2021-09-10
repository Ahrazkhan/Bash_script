#!/bin/bash


# check permission, $EUID holds numeric value, if 0 it's root
if [ $EUID -ne 0 ]; then
	echo "Run as root"
	exit 1
fi

# check positional params
# $# is bash's built-in that holds parameters count
if [ $# -ne 1 ]; then
	echo "Usage: $0 <file>"
	exit 2
fi

# check if parameter is file
if [ ! -f "$1" ]; then
	echo "ERROR: $1 doens't exist"
	exit 1
fi

### FUNCTIONS ###

function create {
	echo "INFO: Creating user $1"
	# useradd is command that adds users, -m means to create home dir as well
	useradd -m $1
}

function delete {
	echo "INFO: Deleting user $1"
	# deluser is command to delete user, --remove-home removes home
	# &> /dev/null means to redirect output to null device, just ignores it's verbose output
	deluser --remove-home $1 &> /dev/null
}

function verify {
	echo -e "\n\nVerifying"
	cat /etc/passwd
	ls /home/
	echo
}

while read user; do
	# check if grep can find username in /etc/passwd
	# -q option means to do it quietly, do not prin anything to screen
	if grep -q "^${user}:" /etc/passwd; then
		echo "User $user already exists"
		continue
	else
		# call function
		create $user
	fi
done < "$1"

# verify added users
verify

# ask user
# -n 1 means to read only 1 char
read -n 1 -p 'Do you want to remove newly created accounts?[Y/n] ' remove
echo

# ${remove,,} means to convert it to lowercase (eg: Y will become y) and we don't have to check for "y" and "Y"
case ${remove,,} in
	y)
		while read user; do
			# call function
			delete $user
		done < "$1"
		# verify
		verify
	;;
	*) echo "ok" ;;
esac
