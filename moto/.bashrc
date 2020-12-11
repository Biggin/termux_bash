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
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## Set a fancy prompt, non-color unless we live in color
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

## Uncomment for a colored prompt if the terminal has the capability.
## It is turned off by default to not distract the user: the focus in a
## terminal window should be on the output of commands, not on the prompt.
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	## We have color support assume its compliant with Ecma-48
	## Lack of such support is extremely rare and such
	## a case would tend to support setf rather than setaf
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then

PS1='\[\033[01;37m\]\342\224\214\342\224\200\[\033[34m\][\[\033[36m\]\u\[\033[33m\]@\[\033[35m\]\h\[\033[34m\]]\[\033[37m\]\342\224\200\[\033[34m\][\[\033[00m\]\[\033[32m\]\w\[\033[01;34m\]]\n\[\033[37m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\033[34m\]$(__git_ps1 $grn"(%s)")\[\033[37m\] -\[\033[34m\]$ \[\033[00m\]'
    ##PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

## If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

	#----------------------------------------------------------#
          ###-Environment Variables for My Linux Machine-###
	#----------------------------------------------------------#

export PATH="${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

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
alias lm='ls -AFCshgt --author --color=always'
alias ll='ls -AFlsh --author --color=always'
alias la='ls -AFC --color=always'
alias l='ls -ALFCsh --color=always'

## You may want to put all your additions into a separate file like
## ~/.bash_aliases instead of adding them here directly.
## See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.suroot/.bash_aliases ]; then
    . ~/.suroot/.bash_aliases
fi

## My additional shell functions are listed in various files, adding
## functionality to source them upon login.
if [ -f ~/.suroot/.bash_functions ]; then
	. ~/.suroot/.bash_functions
fi

## Enable programmable completion features, you don't need to enable
## this if it is already enabled in /etc/bash.bashrc and /etc/profile
## sources /etc/bash.bashrc.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
