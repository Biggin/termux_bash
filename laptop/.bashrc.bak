# /home/tux/dotfiles/.bashrc: executed by bash for non-login shells.
## See /usr/share/doc/bash/examples/startup-files for examples

 #########################################################################
#-------------------------------------------------------------------------#
  #=====================================================================#
          #############--My Awesome Login Banner--#############
  #=====================================================================#
#-------------------------------------------------------------------------#
 #########################################################################

## Regular colors
BLK='\e[0;30m'
RED='\e[0;31m'
GRN='\e[0;32m'
YEL='\e[0;33m'
BLU='\e[0;34m'
MAG='\e[0;35m'
CYA='\e[0;36m'
WHI='\e[0;37m'
RES='\e[0;00m'

## Bright colors
BBLK='\e[1;90m'
BRED='\e[1;91m'
BGRN='\e[1;92m'
BYEL='\e[1;93m'
BBLU='\e[1;94m'
BMAG='\e[1;95m'
BCYA='\e[1;96m'
BWHI='\e[1;97m'
AWHI='\e[2;37m'
echo ""
echo -e $MAG"				WELCOME BACK... "
echo ""
echo ""
echo ""
echo -e $BCYA"              @@@@@@@   @@@   @@@@@@@@   @@@@@@@@  @@@  @@@ @@@  "
echo -e $BCYA"              @@@@@@@@  @@@  @@@@@@@@@  @@@@@@@@@  @@@  @@@@ @@  "
echo -e $BCYA"              @@!  @@@  @@!  !@@        !@@        @!@  !@!@!@! "
echo -e $BCYA"              !@   @!@  !@!  !@!        !@!        !@!  !@!@!@!"
echo -e $CYA"              @!@!@!@   !!@  !@! @!@!@  !@! @!@!@  !!@  @!@ !!@  "
echo -e $CYA"              !!!@!!!!  !!!  !!! !!@!!  !!! !!@!!  !!!  !@! !!!  "
echo -e $WHI"              !!:  !!!  !!:  :!!   !!:  :!!   !!:  !!:  !!: !!!  "
echo -e $WHI"              :!:  !:!  :!:  :!:   !::  :!:   !::  :!:  :!: !:!  "
echo -e $AWHI"               :: ::::   ::   ::: ::::   ::: ::::  ::   ::  ::  "
echo -e $AWHI"                : : ::   :     :: :: :    :: :: :  :    ::  : "
echo""
echo""
echo""

## If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## Do not put duplicate lines or lines starting with space in the history.
## See bash man page for more options
HISTCONTROL=ignoreboth:ignoredupes:ignorespace

## Append to the history file, don't overwrite it
shopt -s histappend
shopt -s histreedit

## For setting history length see HISTSIZE and HISTFILESIZE in bash
HISTSIZE=800
HISTFILESIZE=1200

## Check the window size after each command and, if necessary,
## update the values of LINES and COLUMNS.
shopt -s checkwinsize

## If set, the pattern ** used in a pathname expansion context will
## match all files and zero or more directories and subdirectories.
shopt -s globstar

## Make less more friendly for non-text input files, see lesspipe
[ -x /usr/bin/lesspipe ] && eval $(SHELL=/bin/sh lesspipe)

#-------------------------------------------------------------------------#
   #############-To Set the Command Prompt, thanks ParrotOS-############
#-------------------------------------------------------------------------#

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

PS1='\[\033[01;31m\]\342\224\214\342\224\200\[\033[37m\][\[\033[32m\]\u\[\033[33m\]@\[\033[35m\]\h\[\033[37m\]]\[\033[31m\]\342\224\200\[\033[37m\][\[\033[00m\]\[\033[36m\]\w\[\033[01;37m\]]\n\[\033[31m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\033[37m\]$(__git_ps1 $BLU"(%s)")\[\033[33m\]$ \[\033[00m\]'
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
   ############-Environment Variables for My Linux Machine-#############
#-------------------------------------------------------------------------#
export JAVA_HOME="/home/tux/Studio/android-studio/jre"
export PATH="${HOME}/Studio/android-studio/bin:${HOME}/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:${NVM_BIN}:${TOOLS}"
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

## AOSP build variables for my configuration
export SRC="/home/tux/Android"
export TOOLS="${SRC}/workspace/vendor/samsung/zero-usc/tools"
export TWRP="/home/tux/Android/twrp"
export DIST_DIR="/home/tux/Android/distrib"
export OUT_DIR="/home/tux/Out"
export OUT_DIR_COMMON_BASE="/home/tux/Out/common"
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -X:+TieredCompilation -Xmx4G"
export STUDIO_JDK="/home/tux/Studio/android-studio/jre"
export ANDROID_SDK_HOME="/home/tux/Studio/sdk"
export ANDROID_AVD_HOME="/home/tux/Studio/sdk/.android/avd"
export ANDROID_EMULATOR_HOME="/home/tux/Studio/sdk/emulator"
export ADB_VENDOR_KEYS="/home/tux/Studio/sdk/.android"
export QEMU_AUDIO_DRV="alsa"
export APK_BIN="/home/tux/Studio/android-studio/bin"

## CCACHE variables for the build process
export USE_CCACHE="1"
export CCACHE_DIR="/home/tux/Android/.ccache"
export CCACHE_NLEVELS=7
export CCACHE_MAXSIZE="100G"
export CCACHE_BASEDIR="/home/tux/Android"
export CCACHE_LOGFILE="/home/tux/Android/cash.log"

## Atom.io environment variables for ease of use
export ATOM_PROJECTS_DIR="/home/tux/Android"
export ATOM_HOME="/home/tux/Android/coding/.atom"
export NVM_DIR="$HOME/Android/coding/.nvm"
export NVM_BIN="/home/tux/Android/coding/.nvm/versions/node/v14.5.0/bin"
export NVM_INC="/home/tux/Android/coding/.nvm/versions/node/v14.5.0/include/node"

## This loads nvm bash_completion
 if [ -s "$NVM_DIR/bash_completion" ]; then
	. "$NVM_DIR/bash_completion"
 fi

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#-------------------------------------------------------------------------#
  ####################-Finally the ALIAS section-########################
#-------------------------------------------------------------------------#

## Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls -FC --color=always'
    alias dire='dir -dULsh --color=always'
    #alias vdir='vdir --color=always'

    alias grab='grep -Un --text --color=always'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi


## Some more ls aliases
alias lm='ls -shAGgpt --author --color=always'
alias ll='ls -AFlhiNq --author --group-directories-first --color=always'
alias la='ls -AFC --author --color=always'
alias l='ls -ALFsht --author --color=always'

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

## Load KB-E init file
##source $SRC/extra_tools/build_essentials/resources/init/init.sh
