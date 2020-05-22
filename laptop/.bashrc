# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#-------------------------------------------------------------------------#
  #=====================================================================#
          #############--My Awesome Login Banner--#############
  #=====================================================================#
#-------------------------------------------------------------------------#

## Regular colors ##
blk='\e[0;30m'
red='\e[0;31m'
grn='\e[0;32m'
yel='\e[0;33m'
blu='\e[0;34m'
mag='\e[0;35m'
cya='\e[0;36m'
whi='\e[0;37m'
awhi='\e[2;37m'

## Bright colors ##
bbla='\e[1;90m'
bred='\e[1;91m'
bgrn='\e[1;92m'
byel='\e[1;93m'
bblu='\e[1;94m'
bmag='\e[1;95m'
bcya='\e[1;96m'
bwhi='\e[1;97m'

echo ""
echo -e $mag"				WELCOME BACK... "
echo ""
echo ""
echo ""
echo -e $bcya"              @@@@@@@   @@@   @@@@@@@@   @@@@@@@@  @@@  @@@  @@@  "
echo -e $bcya"              @@@@@@@@  @@@  @@@@@@@@@  @@@@@@@@@  @@@  @@@@ @@@  "
echo -e $bcya"              @@!  @@@  @@!  !@@        !@@        @@!  @@!@!@@@  "
echo -e $cya"              !@   @!@  !@!  !@!        !@!        !@!  !@!!@!@!  "
echo -e $cya"              @!@!@!@   !!@  !@! @!@!@  !@! @!@!@  !!@  @!@ !!@!  "
echo -e $cya"              !!!@!!!!  !!!  !!! !!@!!  !!! !!@!!  !!!  !@!  !!!  "
echo -e $whi"              !!:  !!!  !!:  :!!   !!:  :!!   !!:  !!:  !!:  !!!  "
echo -e $whi"              :!:  !:!  :!:  :!:   !::  :!:   !::  :!:  :!:  !:!  "
echo -e $awhi"               :: ::::   ::   ::: ::::   ::: ::::   ::   ::   ::  "
echo -e $awhi"               :: : ::   :     :: :: :    :: :: :   :    ::    :   "
echo""
echo""
echo""

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
HISTSIZE=200
HISTFILESIZE=500

## Check the window size after each command and, if necessary,
## update the values of LINES and COLUMNS.
shopt -s checkwinsize

## If set, the pattern "**" used in a pathname expansion context will
## match all files and zero or more directories and subdirectories.
##shopt -s globstar

## Make less more friendly for non-text input files, see lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#-------------------------------------------------------------------------#
   #############-To Set the Command Prompt, thanks ParrotOS-############
#-------------------------------------------------------------------------#
## set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

## Uncomment for a colored prompt, if the terminal has the capability. It's
## turned off by default to not distract the user: the focus in a terminal
## window should be on the output of commands, not on the prompt.
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
   
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]\[\033[33m\]@\[\033[01;35m\]\h\[\033[00m\]\[\033[01;37m\]:\[\033[01;33m\][\[\033[00m\]\[\033[37m\]\w\[\033[01;33m\]]\[\033[00m\]\[\033[37m\]\$\[\033[00m\] '
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

#-------------------------------------------------------------------------#
   ###############-Environment Variables for My Linux Machine###########
#-------------------------------------------------------------------------#
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## AOSP build variables for my configuration
export DIST_DIR="/home/tux/Android/distrib"
export OUT_DIR="/home/tux/Android/out"
export OUT_DIR_COMMON_BASE="/home/tux/Android/out/common"
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -X:+TieredCompilation -Xmx4G"
export STUDIO_JDK="/home/tux/studio/android-studio/jre"
export ANDROID_SDK_ROOT="/home/tux/studio/sdk"
export ADB_VENDOR_KEYS="/home/tux/studio/.android:/home/tux/.android"
export DROID_DIR="/home/tux/Android"

## CCACHE variables for the build process
export USE_CCACHE="1"
export CCACHE_DIR="/home/tux/Android/.ccache"
export CCACHE_NLEVELS=5
export CCACHE_MAXSIZE="50G"
export CCACHE_BASEDIR="/home/tux/Android"
export CCACHE_LOGFILE="/home/tux/Android/.money.log"

## Atom.io environment variables for ease of use
#export ATOM_PROJECTS_DIR="/home/tux"
#export PATH="home/tux/Android/coding/.nvm/versions/node/v14.0.0/bin:/home/tux/studio/android-studio/bin:/home/tux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
#export ATOM_HOME="/home/tux/Android/coding/.atom"
#export ATOM_DEV_RESOURCE_PATH="/home/tux/Android/coding"
#export ATOM_REPOS_HOME="/home/tux/Android/coding/repos"
#export NVM_DIR="/home/tux/Android/coding/.nvm"
#export NVM_BIN="/home/tux/Android/coding/.nvm/versions/node/v14.0.0/bin"
#export NVM_INC="/home/tux/Android/coding/.nvm/versions/node/v14.0.0/include/node"

## This loads nvm bash_completion
# if [ -s "$NVM_DIR/bash_completion" ]; then
#	. $NVM_DIR/bash_completion
# fi

#-------------------------------------------------------------------------#
  ####################-Finally the ALIAS section-########################
#-------------------------------------------------------------------------#
## enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

d=".dircolors"
test -r $d && eval "$(dircolors $d)"

    alias ls='ls -AFC --color=always'
    alias dire='dir -dULsh --color=always'
    #alias vdir='vdir --color=always'

    alias grab='grep -Un --text --color=always'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
#fi


## Some more ls aliases ##
alias lm='ls -shAGlpt --author --color=always'
alias ll='ls -AFlLHhiNq --author --group-directories-first --color=always'
alias la='ls -AlLChHst --author --color=always'
alias l='ls -ALFh --author --color=always'


## Add an "alert" alias for long running commands.  Use like so:
##   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo
#terminal || echo error)" "$(history|tail -n1|sed -e
#'\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## Alias definitions.
## You may want to put all your additions into a separate file like
## ~/.bash_aliases, instead of adding them here directly.
##See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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
