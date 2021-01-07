#!/usr/bin/env bash

#----------------------------------------------------------------------#
#: Credits to Akhil Narang for his original function file that
#: I modified for my own purposes.
#: Also thanks to any and all the other contributors as well.
#----------------------------------------------------------------------#
#: SPDX-License-Identifier: GPL-3.0-only
#: Copyright 2020
#: Author: clnelson@github.com
#: Email: dumb.droid.dev@outlook.com
#: Date: Aug-2020
#----------------------------------------------------------------------#
#: Script defining various functions used in my daily linux work.
#: shellcheck disable=SC1090,SC1091
#: SC1090: Can't follow non-constant source. Use a directive to specify location.
#----------------------------------------------------------------------#

## Regular colors
blk='\e[0;30m'
red='\e[0;31m'
grn='\e[0;32m'
yel='\e[0;33m'
blu='\e[0;34m'
mag='\e[0;35m'
cya='\e[0;36m'
whi='\e[0;37m'
res='\e[0;00m'

## Bold colors
bblk='\e[1;90m'
bred='\e[1;91m'
bgrn='\e[1;92m'
byel='\e[1;93m'
bblu='\e[1;94m'
bmag='\e[1;95m'
bcya='\e[1;96m'
bwhi='\e[1;97m'
awhi='\e[2;37m'

# Function to display uptime of a system. All credits to the original author.
function upinfo() {
	figlet -c ${bgrn}$(hostname)
	echo ""
	echo -ne "${byel}uptime ${bwhi}is:${bcya} 	\\n "
	uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10,$11}'
}

# Function run on login to display some stuff and set my custom PS1
function onLogin() {

    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWUPSTREAM=auto
    export GIT_PS1_SHOWCOLORHINTS=1
#    unset PS1
#    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#    if [[ -f "${HOME}/git-prompt.sh" ]]; then
#        source ~/git-prompt.sh
#        PS1='| \h (\w)$(__git_ps1 " {%s}") |-> '
#    else
#        PS1='| \h (\w) |-> '
#    fi

    clear
        HOST=$(hostname)
    if [[ ${#HOST} -lt 14 ]]; then
        echo -e "${bblk}"
        figlet -c "$(hostname)"
    fi
    echo ""
    echo -ne "${red}Today is:\\t\\t${cyan} $(date)"
    echo ""
    echo -e "${red}Kernel Information: \\t${cyan} $(uname -smr)"
    echo -ne "${cyan}"
    upinfo
    echo ""
    echo -e "${yel}Welcome to ${bblk}$(hostname), ${bwhi}$(whoami)!"
    echo -e
    fortune-off | cowsay -f dragon
}

# Function to extract a file or image no matter the program used for compression
function extract {
 if [ -z "$1" ]; then
      # display usage if no parameters given
      echo -e "${whi}Usage: ${yel}extract <path/file_name>${whi}.${yel}<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
      echo -d "${yel}       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
      return 1
 else
      for n in $@
      do
        if [ -f "$n" ] ; then
             case "${n%,}" in
               *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                            tar xvf "$n"       ;;
               *.lzma)      unlzma ./"$n"      ;;
               *.bz2)       bunzip2 ./"$n"     ;;
               *.rar)       unrar x -ad ./"$n" ;;
               *.gz)        gunzip ./"$n"      ;;
               *.zip)       unzip ./"$n"       ;;
               *.z)         uncompress ./"$n"  ;;
                *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                            7z x ./"$n"        ;;
               *.xz)        unxz ./"$n"        ;;
               *.exe)       cabextract ./"$n"  ;;
               *)
                            echo -e "${yel}extract:${red} '$n' - unknown archive method"
                            return 1
                            ;;
             esac
         else
             echo -e "${red}'$n' - file does not exist"
             return 1
        fi
      done
 fi
}

# Make a new directory/directories and change into it, if you so choose
function go () {
	mkdir -pv $1 $2 $3 $4 $5 $6 $7 $8 $9
	if [ -z $1 ]; then
		echo -e "${yel}You must enter at least one directory to create..."
		return 1
	else
	echo -e "${yel}You've entered more than one dir, would you like to change into one now?\nEnter ${bwhi}'No' ${yel}to terminate after creating directories.\nOr enter the name of the newly created directory you'd like to change to.${res}\n$(ls -AFC --color=always)"
	fi
	read -r continue
	if [ -z $continue ]; then
		printf "%s\n" "${red}Error: No response entered" "${bwhi}Exiting..."
		return 1
	fi
	case $continue in
			  $1) cd $1 && echo $(pwd) ;;
			  $2) cd $2 && echo $(pwd) ;;
			  $3) cd $3 && echo $(pwd) ;;
			  $4) cd $4 && echo $(pwd) ;;
			  $5) cd $5 && echo $(pwd) ;;
			  $6) cd $6 && echo $(pwd) ;;
			  $7) cd $7 && echo $(pwd) ;;
			  $8) cd $8 && echo $(pwd) ;;
	          $9) cd $9 && echo $(pwd) ;;
	n|no|N|No|NO) echo -e "${bwhi}Exiting the script now..." ;;
			   *) printf "%s\n" "${yel}You did not enter a correct response!" "${bwhi}Exiting now..." ${res}$(pwd) && $(ls -AFC --color=always) ;;
	esac
}

#function go () {
#	if [ -d $1 ]; then
#		printf "%s\n" "The directory '$1' is already in the filesystem..." "Changing directories!"
#		cd $1
#	else
#		mkdir -pv $1
#		cd $1
#		echo -e $(pwd)
#	fi
#}


# File manipulation commands simplied by ugly functions
function copy () {
	cp -riv $@ | pv -Ipet || return 1
	return 0
}

function move () {
	time mv -iv $@ | progress -m || return 1
	return 0
}

function rmf () {
	pv -Ipet | sudo rm -rf $@ || return 1
	return 0
}

# For the lazy ones that don't like having to type the full URL everytime
function clone () {
	time git clone https://github.com/$@
}

function lab () {
	time git clone https://gitlab.com/$@
}

# Repo commands with various flags I'm too lazy to type each time
function resub () {
    time repo sync --force-sync --no-clone-bundle --current-branch --no-tags --submodules --optimized-fetch -j2 $@
}

function repair () {
	time repo sync --detach --force-sync --force-remove-dirty --no-tags --current-branch --no-clone-bundle -j4 $@
}

function repinit () {
	time repo init --no-clone-bundle --no-tags --depth=1 --platform=linux --reference=${AOSP_MIRROR} --reference=${LOS_MIRROR} --dissociate --current-branch -j4 -u https://github.com/$@
}

function aospinit () {
	time repo init --no-clone-bundle --no-tags --depth=1 --platform=linux --reference=${AOSP_MIRROR} --dissociate --current-branch -j4 -u https://android.googlesource.com/$@
}

function starch () {
	time repo start $1 --all
	time repo checkout $1
	time repo branches -a
}
