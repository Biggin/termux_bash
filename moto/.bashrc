# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

 #--------------------------------------------------------------#
    #========================================================#
        ###########--My Awesome Login Banner--###########
    #========================================================#
 #--------------------------------------------------------------#

## Regular colors ##
BLK='\e[0;30m'
RED='\e[0;31m'
GRN='\e[0;32m'
YEL='\e[0;33m'
BLU='\e[0;34m'
MAG='\e[0;35m'
CYA='\e[0;36m'
WHI='\e[0;37m'
AWHI='\e[2;37m'
RES='\e[00m'

## Bright colors ##
BBLK='\e[1;90m'
BRED='\e[1;91m'
BGRN='\e[1;92m'
BYEL='\e[1;93m'
BBLU='\e[1;94m'
BMAG='\e[1;95m'
BCYA='\e[1;96m'
BWHI='\e[1;97m'

echo ""
echo -e $MAG"				WELCOME BACK... "
echo ""
echo ""
echo ""
echo -e $BCYA"              @@@@@@@   @@@   @@@@@@@@   @@@@@@@@  @@@  @@@  @@@  "
echo -e $BCYA"              @@@@@@@@  @@@  @@@@@@@@@  @@@@@@@@@  @@@  @@@@ @@@  "
echo -e $BCYA"              @@!  @@@  @@!  !@@        !@@        @@!  @@!@!@@@  "
echo -e $CYA"              !@   @!@  !@!  !@!        !@!        !@!  !@!!@!@!  "
echo -e $CYA"              @!@!@!@   !!@  !@! @!@!@  !@! @!@!@  !!@  @!@ !!@!  "
echo -e $CYA"              !!!@!!!!  !!!  !!! !!@!!  !!! !!@!!  !!!  !@!  !!!  "
echo -e $WHI"              !!:  !!!  !!:  :!!   !!:  :!!   !!:  !!:  !!:  !!!  "
echo -e $WHI"              :!:  !:!  :!:  :!:   !::  :!:   !::  :!:  :!:  !:!  "
echo -e $AWHI"               :: ::::   ::   ::: ::::   ::: ::::   ::   ::   ::  "
echo -e $AWHI"               :: : ::   :     :: :: :    :: :: :   :    ::    :   "
echo""
echo""
echo""

PS1="${RED}\342\224\214\342\224\200[${BGRN}Biggin${BYEL}@${MAG}termux${RED}]\342\224\200[${RES}\w${RED}]"'$(__git_ps1 ${BYEL}"(${BLU}%s${BYEL})")'"\n$RED\342\224\224\342\224\200\342\224\200\342\225\274${BYEL} $ ${RES}"

## If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## Don't put duplicate lines or lines starting with space in the history.
## See bash for more options
HISTCONTROL=ignoreboth:ignoredupes:ignorespace:ignoredups

## Append to the history file, don't overwrite it
shopt -s histappend
shopt -s histreedit

## For setting history length see HISTSIZE and HISTFILESIZE in bash
HISTSIZE=500
HISTFILESIZE=1000

## Check the window size after each command and, if necessary,
## update the values of LINES and COLUMNS.
shopt -s checkwinsize

## If set, the pattern ** used in a pathname expansion context will
## match all files and zero or more directories and subdirectories.
shopt -s globstar

## Make less more friendly for non-text input files, see lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

 #--------------------------------------------------------------#
     #####-To Set the Command Prompt, thanks ParrotOS-#####
 #--------------------------------------------------------------#
## set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#    PS1='\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo -e \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo -e '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo -e  '\[\033[01;35m\]biggin\[\033[01;33m\]@\[\033[01;96m\]termux'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]$(__git_ps1 "(%s)")\$ \[\e[0m\]'

## If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

 #--------------------------------------------------------------#
      #####-Environment Variables for My Linux Machine#####
 #--------------------------------------------------------------#
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

 #--------------------------------------------------------------#
      #############-Finally the ALIAS section-############
 #--------------------------------------------------------------#
## Enable color support of ls and also add handy aliases
d="${HOME}/.dircolors"
test -r $d && eval "$(dircolors -b $d)"

alias ls='ls -FC --color=always'
alias dire='dir -dULsh --color=always'
#alias vdir='vdir --color=always'

alias grab='grep -Un --text --color=always'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'

## Some more ls aliases ##
alias lm='ls -shAGlpt --author --color=always'
alias ll='ls -AFClsh --author --color=always'
alias la='ls -AFC --color=always'
alias l='ls -FCsh --color=always'

## Alias definitions.
## You may want to put all your additions into a separate file like
## ~/.bash_aliases, instead of adding them here directly.
##See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
      . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
	. ~/.git-prompt.sh
fi

## Enable programmable completion features (you don't need to enable
## this, if it's already enabled in /etc/bash.bashrc and /etc/profile
## sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
