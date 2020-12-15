# /data/data/com.termux/files/home/.suroot/.bashrc: executed by bash for non-login shells.

#: Author:   clnelson@github.com
#: Created:  Spring-2020
#: Device:   Termux(Android)

	#----------------------------------------------------------#
  #=====================================================================#
          #############--My Awesome Login Banner--############
  #=====================================================================#
	#----------------------------------------------------------#

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

## Bright colors
bblk='\e[1;90m'
bred='\e[1;91m'
bgrn='\e[1;92m'
byel='\e[1;93m'
bblu='\e[1;94m'
bmag='\e[1;95m'
bcya='\e[1;96m'
bwhi='\e[1;97m'
awhi='\e[2;37m'

echo ""
echo -e $mag"				WELCOME BACK... "
echo ""
echo ""
echo ""
echo -e $bcya"              @@@@@@@   @@@   @@@@@@@@   @@@@@@@@  @@@  @@@ @@@  "
echo -e $bcya"              @@@@@@@@  @@@  @@@@@@@@@  @@@@@@@@@  @@@  @@@@ @@  "
echo -e $bcya"              @@!  @@@  @@!  !@@        !@@        @!@  !@!@!@! "
echo -e $bcya"              !@   @!@  !@!  !@!        !@!        !@!  !@!@!@!"
echo -e $cya"              @!@!@!@   !!@  !@! @!@!@  !@! @!@!@  !!@  @!@ !!@  "
echo -e $cya"              !!!@!!!!  !!!  !!! !!@!!  !!! !!@!!  !!!  !@! !!!  "
echo -e $whi"              !!:  !!!  !!:  :!!   !!:  :!!   !!:  !!:  !!: !!!  "
echo -e $whi"              :!:  !:!  :!:  :!:   !::  :!:   !::  :!:  :!: !:!  "
echo -e $awhi"               :: ::::   ::   ::: ::::   ::: ::::  ::   ::  ::  "
echo -e $awhi"                : : ::   :     :: :: :    :: :: :  :    ::  : "
echo""
echo""
echo""

## If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## Do not put duplicate lines starting with space in the history.
## See bash man page for more options
HISTCONTROL=ignoreboth:ignoredupes:ignorespace

## Append to the history file, don't overwrite it
shopt -s histappend
shopt -s histreedit

## For setting history length see HISTSIZE and HISTFILESIZE in bash
HISTSIZE=1000
HISTFILESIZE=1200

## Check the window size after each command and, if necessary,
## update the values of LINES and COLUMNS.
shopt -s checkwinsize

## If set, the pattern ** used in a pathname expansion context will
## match all files and zero or more directories and subdirectories.
shopt -s globstar

	#----------------------------------------------------------#
   	     ###-To Set the Command Prompt, thanks ParrotOS-###
	#----------------------------------------------------------#
## Set variable identifying the chroot you work in
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#
### Set a fancy prompt, non-color unless we live in color
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac

## If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1='\[\033[01;32m\]\342\224\214\342\224\200[\[\033[36m\]haxon\[\033[33m\]@\[\033[35m\]zeroflteusc\[\033[32m\]]\342\224\200\[\033[32m\][\[\033[00m\]\[\033[37m\]\w\[\033[01;32m\]]\n\[\033[32m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\033[34m\]$(__git_ps1 $blu"(%s)")\[\033[37m\] -\[\033[31m\]$ \[\033[00m\]'

#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

	#----------------------------------------------------------#
          ###-Environment Variables for My Linux Machine-###
	#----------------------------------------------------------#


	#----------------------------------------------------------#
            ##########-Finally the ALIAS section-##########
	#----------------------------------------------------------#

## Enable color support of ls and also add handy aliases
eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias dire='dir -dULsh --color=always'
    alias vdir='vdir --color=always'
    alias grab='grep -Un --text --color=always'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'

## Some more ls aliases
alias ls='ls -FC --color=always'
alias la='ls -A'
alias l='ls -sh'
alias ll='l -Al --author'

## You may want to put all your additions into a separate file like
## ~/.bash_aliases instead of adding them here directly.
## See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## My additional shell functions are listed in various files, adding
## functionality to source them upon login.
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi
