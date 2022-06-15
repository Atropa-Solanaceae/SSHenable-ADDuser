#!/bin/bash

service --status-all | grep "ssh" > temp.txt

if grep "+" temp.txt
	then
	echo "SSH is already enabled for this user"
else 
	echo "SSH is not enabled for this user"
	echo "Starting SSH service..."
	sudo service ssh start
	sudo servicectfl ssh
	echo "SSH has been started successfully"
fi

touch temp2.txt
cat /etc/passwd | grep "/home/" > temp.txt
echo grep : | egrep -o '^[^:]+' temp.txt > temp2.txt
echo "Current user(s) are: "
cat temp2.txt

if grep "sneak" temp2.txt
	then
	echo "User already exists"
else
	while true; do
		read -p "Would you like to add user? " yn
		case $yn in
			[Yy]* ) sudo adduser sneak sudo; break;;
			[Nn]* ) rm -f temp2.txt;;
			* ) echo "Y or n";;
		esac
	done
fi

rm -f temp2.txt
rm -f temp.txt
