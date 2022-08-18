#! /bin/sh

# Text colors
NOCOLOR='\033[0m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'

# Check privilege

if [ "$USER" != "root" ]; then echo "${LRED}This installation requires root privilege!${NOCOLOR}"; exit; fi

# INSTALL

mkdir /etc/torsh
chmod 777 /etc/torsh

cp -r ./lib/ /usr/lib/torsh/
chmod 751 /usr/lib/torsh

cp ./torsh /usr/bin/torsh

echo "\n${LGREEN}DONE!${NOCOLOR}"
