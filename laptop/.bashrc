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
blk='\033[30m'
red='\033[31m'
grn='\033[32m'
yel='\033[33m'
blu='\033[34m'
mag='\033[35m'
cya='\033[36m'
whi='\033[37m'
res='\033[00m'

## Bright colors
bblk='\033[1;90m'
bred='\033[1;91m'
bgrn='\033[1;92m'
byel='\033[1;93m'
bblu='\033[1;94m'
bmag='\033[1;95m'
bcya='\033[1;96m'
bwhi='\033[1;97m'
awhi='\033[2;37m'

echo ""
echo -e $mag"				WELCOME BACK... "
echo ""
echo ""
echo ""
echo -e $bcya"              @@@@@@@   @@@   @@@@@@@@   @@@@@@@@  @@@  @@@ @@@"
echo -e $bcya"              @@@@@@@@  @@@  @@@@@@@@@  @@@@@@@@@  @@@  @@@@ @@"
echo -e $bcya"              @@!  @@@  @@!  !@@        !@@        @!@  !@!@!@!"
echo -e $bcya"              !@   @!@  !@!  !@!        !@!        !@!  !@!@!@!"
echo -e $cya"              @!@!@!@   !!@  !@! @!@!@  !@! @!@!@  !!@  @!@ !!@"
echo -e $cya"              !!!@!!!!  !!!  !!! !!@!!  !!! !!@!!  !!!  !@! !!!"
echo -e $whi"              !!:  !!!  !!:  :!!   !!:  :!!   !!:  !!:  !!: !!!"
echo -e $whi"              :!:  !:!  :!:  :!:   !::  :!:   !::  :!:  :!: !:!"
echo -e $awhi"               :: ::::  ::    ::: ::::   ::: ::::  ::   ::  ::"
echo -e $awhi"                : : ::  :      :: :: :    :: :: :  :    ::  :"
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
HISTSIZE=2500
HISTFILESIZE=3000

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

PS1='\[\033[30m\]\342\224\214\342\224\200[\[\033[36m\]\u\[\033[00m\]\[\033[33m\]@\[\033[35m\]\h\[\033[30m\]]\342\224\200[\[\033[00m\]\[\033[37m\]\w\[\033[30m\]]\n\342\224\224\342\224\200\342\224\200\342\225\274\[\033[00m\]$(__git_ps1 " $yel($bblk%s$yel)")\[\033[01;31m\]$ \[\033[00m\]'
    ##PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

##PS1='\[\033[01;32m\]\342\224\214\342\224\200[\[\033[36m\]\u\[\033[00m\]\[\033[01;33m\]@\[\033[01;35m\]\h\[\033[01;32m\]]\342\224\200[\[\033[00m\]\[\033[01;37m\]\w\[\033[01;32m\]]\n\342\224\224\342\224\200\342\224\200\342\225\274$(__git_ps1 " ${bwhi}(${res}${blu}%s${bwhi})")\[\033[01;31m\]$ \[\033[00m\]'

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
#export JAVA_HOME="/home/tux/Studio/android-studio/jre"
#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/bin"

export PATH=~/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/lib/ccache:/snap/bin:/opt/android-studio/bin

export GCC_COLORS="error=01;31:warning=01;33:note=01;37:caret=01;04;32:locus=01:quote=01"
export MANPAGER=most

## AOSP build variables for my configuration
export Andy=~/Android
export Ext="/media/external"
export Pers="/media/personal"
export Mirrors="$Ext/mirrors"
export Aosp_Mirror="$Mirrors/aosp"
export Los_Mirror="$Mirrors/lineage/LineageOS"
export OUT_DIR="$Ext/build/out"
export DIST_DIR="$Ext/build/distrib"
export OUT_DIR_COMMON_BASE="$Ext/build/common"
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -X:+TieredCompilation -Xmx4G"
#export Studio="$HOME/Studio"
#export STUDIO_JDK="$Studio/android-studio/jre"
#export ANDROID_SDK_HOME="$Studio/sdk"
#export ANDROID_AVD_HOME="$Studio/sdk/.android/avd"
#export ANDROID_EMULATOR_HOME="$Studio/sdk/emulator"
#export ADB_VENDOR_KEYS="$Studio/sdk/.android"
#export QEMU_AUDIO_DRV="alsa"
#export APK_BIN="$Studio/android-studio/bin"

## CCACHE variables for the build process
export USE_CCACHE=1
export CCACHE_MAXSIZE=100G
export CCACHE_DIR="$Mirrors/ccache"
export CCACHE_LOGFILE="$Mirrors/ccache/cash.log"
export CCACHE_NLEVELS=7

## Atom.io environment variables for ease of use
export ATOM_PROJECTS_DIR=~/github/Projects
export ATOM_HOME=~/github/atom/.atom
export NVM_COLORS='gbcmy'
export NVM_DIR=~/github/.nvm
#export NVM_BIN="$Andy/coding/.nvm/versions/node/v14.5.0/bin"
#export NVM_INC="$Andy/coding/.nvm/versions/node/v14.5.0/include/node"

## This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

## This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#-------------------------------------------------------------------------#
  ####################-Finally the ALIAS section-########################
#-------------------------------------------------------------------------#
## Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls -FC --color=always'
    alias dire='dir -dULsh --color=always'
    #alias vdir='vdir --color=always'

    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
    alias grab='grep -Un --text'
fi

## Some more ls aliases
alias la='ls -A'
alias l='ls -sh'
alias ll='l -Al --author'
alias lm='ll -Gt'

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
