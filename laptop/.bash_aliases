## An alias file for quicker syntax of common commands

## System level aliases
alias _=sudo
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
alias df='df -Tha --total'
alias path='echo ${PATH}'
alias cout='cd $OUT/'
alias dout='cd $OUT_DIR/'
alias bout='cd $External/build/'
alias googler='googler --colorize=always'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias wget2='wget2 -p --progress=bar --force-progress'
alias rfkill='sudo rfkill --output DEVICE,ID,TYPE,TYPE-DESC,SOFT,HARD'
alias getgov='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'

alias setperf='echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'

alias setsave='echo "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'

## IP related queries
alias net='curl ipinfo.io'
alias inet='curl ipinfo.io/ip'
alias ip='ip -c -h -d -s -s a'

## File handling & manipulation...
alias c='batcat'
alias r='fc -s'
alias mv='mv -i'
alias cp='cp -ir'
alias bat='batcat'
alias cn='cat -nst'
alias eng="env | grep"
alias shit='sudo inxi'
alias nash="nano -Y sh"
alias file='file -s -z'
alias rc="nano ~/.bashrc"
alias ifile='file -s -z -i'
alias histg='history | grep'
alias lbin="ls ~/.local/bin"
alias cbin="cd ~/.local/bin"
alias src="source ~/.bashrc"
alias dd='dd status=progress'
alias mod6='sudo chmod 644'
alias mod7='sudo chmod 755'
alias diff='diff --color=always'
alias feek='find . -type f -name '
alias deek='find . -type d -name '
alias suown="sudo chown root:root"
alias own="sudo chown ${USER}:${USER}"
alias funcs="nano -Y sh ~/.bash_functions"
alias aliases="nano -Y sh ~/.bash_aliases"
alias diffy='diff -yw --suppress-common-lines'
alias bat='bat --color=always --terminal-width=-2 --style=full --theme=Github'
alias back="tac -r -s 'x\|[^x]' " # Reverse file and lines
alias bing="ls /bin/ /sbin/ /usr/bin/ /usr/sbin/ /usr/local/bin/ /usr/local/sbin/  | grep"

## Removal for the 'noid' community....
alias rmf='sudo rm -rf'
alias sub='sudo scrub -SRfr -p pfitzner33'
alias shard='sudo shred -fzn 23 --remove=wipe'
alias bish='sudo scrub -SRfr -p pfitzner33 ~/.bash_history ~/.lesshst'

## Aliases for package management
alias ag='sudo apt-get'
alias ai='sudo apt-get install'
alias ap='sudo apt-get purge'
alias al='apt list'
alias ali='apt list --installed | less'
alias alig='apt list --installed | grep'
alias as='sudo apt search'
alias aptsh='apt show'
alias au='sudo apt-get update'
alias auu='sudo apt-get update && sudo apt-get upgrade'
alias clapt='sudo apt autoremove && sudo apt remove && sudo apt autoclean && sudo apt clean'

## Dpkg simplification
alias lintian='lintian --color=always'
alias dp='sudo dpkg'
alias dp.h='dpkg --help'
alias dp.fh='dpkg --force-help'
alias dp.i='sudo dpkg -i'
alias dp.l='sudo dpkg -l'
alias dp.lg='sudo dpkg -l | grep'
alias dp.L='sudo dpkg -L'
alias dp.s='sudo dpkg -S'
alias dp.ca='sudo dpkg --configure -a'

## Custom Android development commands
alias chow_call="source ~/scripts/android/chow_call.sh"
alias start_recovery="source ~/scripts/android/recovery.sh"
alias blobs="java -jar ~/.local/bin/MissingBlobs.jar"

## Android ADB/Fastboot command aliases
alias adb_='adb devices -l'
alias adbk='adb kill-server'
alias adb.pu='adb push'
alias adb.ll='adb pull'
alias adb.sh='adb shell'
alias adb.rr='adb reboot recovery'
alias adb.rb='adb reboot bootloader'

alias fast='fastboot'
alias fast.o='fastboot oem'
alias fast_='fastboot devices -l'
alias fast.re='fastboot reboot'
alias fast.rb='fastboot reboot bootloader'
alias fast.fr='fastboot flash recovery'
alias fast.fb='fastboot flash boot'
alias fast.var='fastboot getvar all'

## Repo aliases for remote repositories
alias repoh='repo help --all'
alias rstat='repo status'
alias rebra='repo branches'
alias rechk='repo checkout'
alias reup='repo selfupdate'
alias rediff='repo diffmanifests'
alias reman='repo manifest'
alias rerepo='repo rebase -i'
alias rebaser='repo rebase --autosquash --auto-stash -m'
alias repoir='sudo repo sync --no-clone-bundle --force-sync -j2'

#alias repair='repo sync --detach --no-clone-bundle --force-remove-dirty
#--force-sync -j8'

#alias repin="repo init --no-clone-bundle --no-tags --current-branch
#--reference=${AOSP_MIRROR} --dissociate --platform=linux -u"

#alias respo='repo sync --current-branch --no-tags --no-clone-bundle
#--force-sync -j2'

## Git for lazy people
alias git.h='git help'
alias git.ha='git help -a'
alias gadd='git add . '
alias git.pu='git push'
alias git.ll='git pull'
alias gstat='git status'
alias git.br='git branch'
alias git.bra='git branch --list -a --color=always'
alias git.st='git stash'
alias git.sq='git squash'
alias git.m='git merge'
alias git.rb='git rebase -i'
alias git.rbc='git rebase --continue'
alias git.rba='git rebase --abort'
alias git.rbs='git rebase --skip'
alias git.chk='git checkout'
alias git.chbr='git checkout -b'
alias git.c='git commit -am'
alias git.ca='git commit --amend -m'
alias git.cn='git commit --no-edit -m'
alias git.cl='git clean -xdf'
alias git.re='git reset'
alias git.rh='git reset --hard'
alias git.rs='git reset --soft'
alias git.rem='git remote'
alias git.add='git remote add'
alias git.set='git remote --set-upstream'
alias git.cp='git cherry-pick'
alias git.cps='git cherry-pick --skip'
alias git.cpa='git cherry-pick --abort'
alias git.cpc='git cherry-pick --continue'
