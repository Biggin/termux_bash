#!/usr/bin/env bash

#----------------------------------------------------------------------#
#: Credits to Akhil Narang for his original function file that
#: I modified for my own purposes.
#: Also thanks to any and all the other contributors as well.
#----------------------------------------------------------------------#
#: Author: clnelson@github.com
#: Copyright: (C) Biggin 2020-2021
#: Email: dumb.droid.dev@outlook.com
#: Date: Aug-23-2020
#: License: GPLv3
#----------------------------------------------------------------------#
#: Script defining various functions used in my daily linux work.
#: shellcheck disable=SC1090,SC1091
#: SC1090: Can't follow non-constant source. Use a directive to specify location.
#----------------------------------------------------------------------#
source ~/scripts/setup/colors.sh

# Function to display uptime of a system. All credits to the original author.
function upinfo() {
	figlet -c ${Bgrn}$(hostname)
	echo ""
	echo -ne "${Byel}uptime ${Bwhi}is:${Bcya} 	\\n "
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
        echo -e "${Bblk}"
        figlet -c "$(hostname)"
    fi
    echo ""
    echo -ne "${Red}Today is:\\t\\t${Cyan} $(date)"
    echo ""
    echo -e "${Red}Kernel Information: \\t${Cyan} $(uname -smr)"
    echo -ne "${Cyan}"
    upinfo
    echo ""
    echo -e "${Yel}Welcome to ${Bblk}$(hostname), ${Bwhi}$(whoami)!"
    echo -e
    fortune-off | cowsay -f dragon
}

# Function to extract a file or image no matter the program used for compression
function extract {
 if [ -z "$1" ]; then
      # display usage if no parameters given
      echo -e "${Whi}Usage: ${Yel}extract <path/file_name>${Whi}.${Yel}<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
      echo -d "${Yel}       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
      return 1
 else
      for n in $@
      do
        if [ -f "$n" ]; then
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
                            echo -e "${Yel}extract:${Red} '$n' - unknown archive method" return 1 ;;
             esac
         else
             echo -e "${Red}'$n' - file does not exist"
             return 1
        fi
      done
 fi
}

# Make a new directory/directories and change into it, if you so choose
function go () {
	mkdir -pv $1 && cd $1
}

# File manipulation commands simplied by ugly functions
function copy () {
	cp -irv "$@" | progress -m || return 1
	return 0
}

function move () {
	time mv -iv "$@" | progress -m || return 1
	return 0
}

function rmv () {
	sudo rm -rf "$@" && sudo progress -m || return 1
	return 0
}

# For the lazy ones that don't like having to type the full URL everytime
function clone () {
	time git clone https://github.com/"$@"
}

function lab () {
	time git clone https://gitlab.com/"$@"
}

# Repo calls with various flags I'm too lazy to type each time
function respo () {
    time repo sync --force-sync --no-clone-bundle --current-branch --no-tags --optimized-fetch -j4 "$@"
	# My standard repo sync call for fast, and minimal syncing
}

function repair () {
	time repo sync --detach --force-sync --force-remove-dirty --prune --no-clone-bundle -j4 "$@"
	# My standard repo call for fixing broken projects or directories that I broke
}

function repoir () {
	sudo time repo sync --no-clone-bundle --force-sync -j4 "$@"
	# For syncing my mirror repos b/c they're owned by root to keep contamination down
}

function repinit () {
	time repo init --no-clone-bundle --platform='linux' --no-tags --current-branch --reference=$Aosp_Mirror/platform/manifest.git --dissociate -u "$@"
}

function losinit () {
	time repo init --no-clone-bundle --no-tags --depth=1 --reference="${Aosp_Mirror}/platform/manifest.git" --dissociate --platform='linux' --current-branch -u "${Los_Mirror}/android_manifest.git" -b '$1'
}

function aospinit () {
	time repo init --no-clone-bundle --no-tags --depth=1 --dissociate --current-branch --platform='linux' --reference='https://android.googlesource.com/platform/manifest.git' -u '${Aosp_Mirror}/platform/manifest.git' -b '$1'
}

function starch () {
	time repo start "$1" --all; repo checkout "$1"; repo branches -a;
	# Call to start a new branch for development and also checkout that same branch in one call
}

function mans () {
	man "$1" | grep -iC2 --color='always' "$2" | less -R
	# Search manpages in argument '1' for term in argument '2', case insensitive
}

function quiet () {
	"$*" &> /dev/null &
	# Mute the output of a command
}

function cmd.stats () {
	if [[ $# -lt 1 ]]; then
      NUM=10
    else
      NUM=${1}
    fi
	history | awk '{print $2}' | sort | uniq -c | sort -rn | head -"$NUM"
	# Shows the 10 most used commands
}

function mkzip () {
	time zip -r "$1".zip "$1"
	# Create a zip archive of a folder
}

bak () {
	local Filename Ftime
	Filename=$1
	Ftime=$(date +%Y%m%d_%H%M)
	cp -ar "${Filename}" "${Filename}_${Ftime}.bak"
	# Backup folder/file with timestamp
}

mkiso () {
	if type "mkisofs" > /dev/null; then
		if [ -z ${1+x} ]; then
			local isoname=${PWD##*/}
		else
			local isoname=$1
		fi

		if [ -z ${2+x} ]; then
			local destpath=../
		else
			local destpath=$2
		fi

		if [ -z ${3+x} ]; then
			local srcpath=${PWD}
		else
			local srcpath=$3
		fi

		if [ ! -f "${destpath}${isoname}.iso" ]; then
			echo "Writing ${isoname}.iso to ${destpath} from ${srcpath}."
			mkisofs -V "${isoname}" -iso-level 3 -r -o "${destpath}${isoname}.iso" "${srcpath}"
		else
			echo "${destpath}${isoname}.iso already exists!"
		fi
	else
		echo -e "mkisofs binary not present on your system. \nIt's in the cdrtools package and can be installed with the command `sudo apt-get install cdrtools`"
	fi
}

function my_ps () {
	ps "$@" -u "$USER" -o pid,%cpu,%mem,start,time,bsdtime,command;
	# Find all processes owned by 'user'
}

function ips () {
	# Displays ALL IP addresses for this host
	if command -v ifconfig &>/dev/null
	then
		ifconfig | awk '/inet /{ print $2 }'
  	elif command -v ip &>/dev/null
  	then
		ip addr | grep -oP 'inet \K[\d.]+'
  	else
		echo "You don't have ifconfig or ip command installed!"
  	fi
}

function myip () {
	# Shows your IP address, as seen by the internet
	res=$(curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+')
	echo -e "${Bwhi}Your public IP is: ${Bgrn} $res ${Res}"
}

function ii() {
	# Display useful host related information
	echo -e "\\n${Whi}You are logged on ${Bmag}$HOST${Res}"
	echo -e "\\nAdditionnal information:$Res " ; uname -a
	echo -e "\\n${Yel}Users logged on:$Res " ; w -h
	echo -e "\\n${Yel}Current date :$Res " ; date
	echo -e "\\n${Yel}Machine stats :$Res " ; uptime
	[[ "$OSTYPE" == *Linux* ]] && echo -e "\\n${Red}Current network location :$Res " ; scselect
	echo -e "\\n${Red}Public facing IP Address :$Res " ;myip
	[[ "$OSTYPE" == *Linux* ]] && echo -e "\\n${Red}DNS Configuration:$Res " ; scutil --dns
	echo
}

function batchmod () {
	# chmod for all files and directories under the current one
	echo -ne "${Bblu}Applying 0755 permission for all directories..."
	(find . -type d -print0 | xargs -0 chmod 0755) &
	spinner
	echo -ne "$Res"

	echo -ne "${Bblu}Applying 0644 permission for all files..."
	(find . -type f -print0 | xargs -0 chmod 0644) &
	spinner
	echo -ne "$Res"
}
