#!/usr/bin/env bash

##################################
#: Coded-by: clnelson@github.com
#: Born-on-Date: Jan-15-2021
#: License: GPLv3
##################################

#: A script to mount my local /swapfile before executing Android builds
if [[ -z /swapfile ]]; then
	echo -e "\n${Whi}Swapfile needs to be created before using this script!${Res}"
	return 1
fi

Pre=$(sudo /sbin/swapon --show)

if [[ -z $Pre ]]; then
    sudo /sbin/swapon /swapfile
    echo -e "\n${Whi}Swapfile is now active and using \n${Byel}$(sudo swapon --show)${Res}\n"
    echo -e "${Red}Don't forget to unmount swap when finished by running  the ${Bwhi}'swapoff'${Red} command.\n${Res}"
    return 0
else
    echo -e "\n${Byel}Swapfile is already mounted!  ${Bwhi}\nExiting...\n${Res}"
    return 1
fi
