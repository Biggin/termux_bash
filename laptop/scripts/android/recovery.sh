#!/usr/bin/env bash

##################################
#: Coded-by: clnelson@github.com
#: Born-on-Date: Oct-25-2020
#: License: GPLv3
#################################

#: A script to unset some things in my environment and add some paths and additional functions as well.

myDir=$(pwd)
Scripts=/home/${USER}/scripts/android
source ${Scripts}/swapfile.sh

export PATH=~/.local/bin:~/scripts/android:/usr/lib/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

export LC_ALL="C"
export ALLOW_MISSING_DEPENDENCIES=true
export CCACHE_EXEC=$(command -v ccache)
export GIT_PS1_SHOWUPSTREAM=author
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

unset PS1
export PS1='\[\033[01;32m\]\342\224\214\342\224\200[\[\033[33m\]\u\[\033[00m\]\[\033[31m\]@\[\033[01;34m\]\h\[\033[01;32m\]]\342\224\200[\[\033[00m\]\[\033[37m\]\w\[\033[01;32m\]]\n\342\224\224\342\224\200\342\224\200\342\225\274$(__git_ps1 " $bblk%s") \[\033[00m\]\[\033[31m\]-> \[\033[00m\]'

unset STUDIO
unset STUDIO_JDK
unset ANDROID_SDK_HOME
unset ANDROID_AVD_HOME
unset ANDROID_EMULATOR_HOME
unset QEMU_AUDIO_DRV
unset APK_BIN
unset NVM_DIR
unset NVM_BIN
unset NVM_INC
unset GCC_COLORS
unset LESSOPEN
unset LESSCLOSE

echo -e ${whi}"Setting cpu to performance mode for every possible gain we can get..."${res}
setperf

Cpu=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
Mode=$(echo -e $Cpu | cut -d ' ' -f 1)

echo -e "All processors are now set to: ${bmag}${Mode}${res}\n"

source ${myDir}/build/envsetup.sh
echo -e "\n${yel}Enjoy your stay and have ${bblu}FUN${whi}!!!${res}\n"

#function SetPerf () {
	# change the CPU governor to performance mode to crank out every bit of HorsePower we can get!
#	if [ $Cpu != "performance" ]; then
#		echo "performance" | sudo tee
#/sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

#	else
#		echo -e "Processors already set to: ${bmag}${Mode}${res}\n"
#	fi
#}
