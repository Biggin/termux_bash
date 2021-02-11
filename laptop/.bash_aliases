## An alias file for quicker syntax of common commands

## System level aliases
alias _='sudo'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias xx='exit'
alias du='ncdu'
alias top='htop'
alias cls='clear'
alias psa='ps auxf'
alias pff='poweroff'
alias less='less -R'
alias mkd='mkdir -pv'
alias free='free -mth'
alias path='echo ${PATH}'
alias df='df -Tha --total'
alias bout='cd $Ext/build/out'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias wget2='wget2 -p --progress=bar --force-progress'
alias rfkill='sudo rfkill --output DEVICE,ID,TYPE,TYPE-DESC,SOFT,HARD'
alias getgov='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias setsave='echo "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias setperf='echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'

## IP related queries
alias net='curl ipinfo.io'
alias inet='curl ipinfo.io/ip'
alias ip='ip -c -h -d -s -s a'

## File handling & manipulation...
alias c='bat'
alias r='fc -s'
alias mv='mv -i'
alias cp='cp -ir'
alias cn='cat -nst'
alias eng="env | grep"
alias shit='sudo inxi'
alias nash="nano -Y sh"
alias file='file -s -z'
alias rc="nano ~/.bashrc"
alias bin="ls ~/.local/bin"
alias ifile='file -s -z -i'
alias mod6='sudo chmod 644'
alias mod7='sudo chmod 755'
alias histg='history | grep'
alias cbin="cd ~/.local/bin"
alias src="source ~/.bashrc"
alias dd='dd status=progress'
alias clist='bat --list-themes'
alias diff='diff --color=always'
alias suown="sudo chown root:root"
alias own="sudo chown ${USER}:${USER}"
alias funcs="nano -Y sh ~/.bash_functions"
alias aliases="nano -Y sh ~/.bash_aliases"
alias diffy='diff -yw --suppress-common-lines'
alias back="tac -r -s 'x\|[^x]' " # Reverse file and lines
alias bing="ls /bin/ /sbin/ /usr/bin/ /usr/sbin/ ~/.local/bin/ | grep"

## Removal for the 'noid' community....
alias rmf='rm -rf'
alias sub='scrub -SRfr -p pfitzner33'
alias bish='scrub -SRfr -p pfitzner33 ~/.bash_history ~/.lesshst ~/.python_history'
## For the SuperUser
alias surf='sudo rm -rf'
alias susub='sudo scrub -SRfr -p pfitzner33'
alias subish='sudo scrub -SRfr -p pfitzner33 /root/.bash_history /root/.lesshst /root/.python_history'

## Aliases for package management
alias al='apt list'
alias as='apt search'
alias aptsh='apt show'
alias ag='sudo apt-get'
alias ap='sudo apt-get purge'
alias au='sudo apt-get update'
alias ai='sudo apt-get install'
alias ali='apt list --installed | less'
alias alig='apt list --installed | grep'
alias auu='sudo apt-get update && sudo apt-get upgrade'
alias clapt='sudo apt autoremove && sudo apt remove && sudo apt autoclean && sudo apt clean'

## Dpkg simplification
alias dp='sudo dpkg'
alias dp.h='dpkg --help'
alias dp.i='sudo dpkg -i'
alias dp.l='sudo dpkg -l'
alias dp.L='sudo dpkg -L'
alias dp.s='sudo dpkg -S'
alias dp.fh='dpkg --force-help'
alias dp.lg='sudo dpkg -l | grep'
alias dp.ca='sudo dpkg --configure -a'
alias lintian='lintian --color=always'

#- Sort installed packages by the amount of disk space currently used by the program
alias dp.ss="dpkg-query -W --showformat='${Installed-Size} ${Package}\n' | sort -nr | less"

## Custom Android development commands
alias blobs="java -jar ~/.local/bin/MissingBlobs.jar"
alias chow_call="source ~/scripts/android/chow_call.sh"
alias start_recovery="source ~/scripts/android/recovery.sh"

## Android ADB/Fastboot command aliases
alias adb.pu='adb push'
alias adb.ll='adb pull'
alias adb_='adb devices -l'
alias adbk='adb kill-server'
alias adb.sh="adb shell '$@'"
alias adb.rr='adb reboot recovery'
alias adb.rb='adb reboot bootloader'

alias fast='fastboot'
alias fast.o='fastboot oem'
alias fast.re='fastboot reboot'
alias fast_='fastboot devices -l'
alias fast.fb='fastboot flash boot'
alias fast.var='fastboot getvar all'
alias fast.fr='fastboot flash recovery'
alias fast.rb='fastboot reboot bootloader'

## Repo aliases for remote repositories
alias rstat='repo status'
alias reman='repo manifest'
alias rebra='repo branches'
alias rechk='repo checkout'
alias reup='repo selfupdate'
alias repoh='repo help --all'
alias rerepo='repo rebase -i'
alias rediff='repo diffmanifests'
alias rebaser='repo rebase --autosquash --auto-stash -m'

#alias repair='repo sync --detach --no-clone-bundle --force-remove-dirty --force-sync --no-tags -j8'

#alias losinit="repo init --no-clone-bundle --no-tags --current-branch --reference=${Aosp_Mirror}/platform/manifest.git --dissociate --platform=linux -u ${Los_Mirror}/lineage/LineageOS/android_manifest.git"

#alias respo='repo sync --current-branch --no-tags --no-clone-bundle --force-sync --optimized-fetch -j4'

## Git for lazy people
alias gadd='git add .'
alias git.h='git help'
alias git.pu='git push'
alias git.ll='git pull'
alias git.m='git merge'
alias git.re='git reset'
alias gstat='git status'
alias git.st='git stash'
alias git.br='git branch'
alias git.sq='git squash'
alias git.rem='git remote'
alias git.ha='git help -a'
alias git.rb='git rebase -i'
alias git.chk='git checkout'
alias git.c='git commit -am'
alias git.cl='git clean -xdf'
alias git.add='git remote add'
alias git.cp='git cherry-pick'
alias git.rh='git reset --hard'
alias git.rs='git reset --soft'
alias git.chbr='git checkout -b'
alias git.ca='git commit --amend'
alias git.rbs='git rebase --skip'
alias git.rba='git rebase --abort'
alias git.rbc='git rebase --continue'
alias git.cps='git cherry-pick --skip'
alias git.cpa='git cherry-pick --abort'
alias git.set='git remote --set-upstream'
alias git.cpc='git cherry-pick --continue'
alias git.cn='git commit --ammend --no-edit'
alias git.bra='git branch --list -a --color=always'
