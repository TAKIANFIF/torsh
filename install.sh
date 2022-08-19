#! /bin/sh

# Text colors
NOCOLOR='\033[0m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'

# Check privilege

if [ "$USER" != "root" ]; then echo "${LRED}This installation requires root privilege!${NOCOLOR}"; exit; fi

# Use no for all prompts
if [ "$1" = "-n" ] ; then no=true; else no=false; fi

# INSTALL

chmod +x ./torsh
chmod -R +x ./lib

mkdir /etc/torsh
chmod 777 /etc/torsh

cp -r ./lib/ /usr/lib/torsh/
chmod 751 /usr/lib/torsh

cp ./torsh /usr/bin/torsh

echo "\n${LGREEN}DONE!${NOCOLOR}"

# Clean
if [ $no = false ]; then
	echo -n "\n\nDo you want to remove installation files? [ Y/n ] "
	clean="Y"
	read clean

	if [ "$clean" = "n"  ] || [ "$clean" = "N" ]; then
		# No
		exit
	else
		# Clean
		cd ..
		rm -r ./torsh/
	fi
fi
