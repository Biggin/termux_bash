## An alias file for quicker syntax of common commands

## System level aliases
alias _='sudo'
alias diff='diff --color=always'
alias diffy='diff -yw --suppress-common-lines'
alias cn='cat -nst'
alias back="tac -r -s 'x\|[^x]' "
alias cpr='cp -ir'
alias tile='file -p --extension --dereference'
alias cls='clear'
alias mkd='mkdir -p'
alias lesser='less -R --status-column --quit-if-one-screen --quit-on-intr --no-lessopen --squeeze-blank-lines --hilite-unread'
alias path='echo ${PATH}'
alias rc='nano ~/.bashrc'
alias aliases='nano ~/.bash_aliases'
alias xx='exit'
alias pff='poweroff'
alias rfkill='sudo rfkill --output DEVICE,ID,TYPE,TYPE-DESC,SOFT,HARD'

## File removal "securely" for the noid...
alias sub='scrub -SRfr -p pfitzner33'
alias bish='scrub -SRfr -p pfitzner33 ~/.bash_history'
alias shard='shred -fzn 23 --remove=wipe'
alias rmf='rm -rf'

## Aliases for package management
alias ag='sudo apt-get'
alias ai='sudo apt-get install'
alias ap='sudo apt-get purge'
alias al='apt list'
alias ali='apt list --installed'
alias alig='apt list --installed | grep'
alias as='apt search'
alias apsh='apt show'
alias au='sudo apt-get update'
alias auu='sudo apt-get update && sudo apt-get upgrade'
alias clapt='sudo apt autoremove && sudo apt remove && sudo apt autoclean && sudo apt clean'

## Dpkg simplification
alias lintian='lintian --color=always'
alias dpkgh='dpkg --help'
alias dpkgfh='dpkg --force-help'
alias dpkgl='sudo dpkg -L'
alias dpkgs='sudo dpkg -S'
alias dpkgcon='sudo dpkg --configure -a'

## Android development commands 
alias adb_='adb devices -l'
alias adbrb='adb reboot bootloader'
alias adbrr='adb reboot recovery'
alias adbk='adb kill-server'
alias adbpu='adb push'
alias adbll='adb pull'
alias adbsh='adb shell'

alias fast='fastboot'
alias fast_='fastboot devices -l'
alias fastre='fastboot reboot'
alias fastrb='fastboot reboot bootloader'
alias fastfr='fastboot flash recovery'
alias fastfb='fastboot flash boot'
alias fasto='fastboot oem'
alias fastvar='fastboot getvar all'

## Repo aliases for remote repositories
alias repoh='repo help'
alias rerepo='repo rebase -i'
alias rerebase='repo rebase --autosquash --auto-stash -m'
#alias repoerr='repo sync --force-sync --prune --no-clone-bundle --no-tags --current-branch -j2'
alias repair='repo sync --detach --no-clone-bundle --force-remove-dirty --force-sync -j 4'
alias respo='repo sync --current-branch --no-tags --no-clone-bundle --optimized-fetch -j2'
alias repochk='repo checkout --branch'
alias repoi='repo init'
alias repoiu='repo init -u'
alias repoir='repo sync --no-clone-bundle --force-sync --optimized-fetch -j3'
alias rstat='repo status'
alias reman='repo diffmanifests'

## Git for lazy people
alias git='hub'
alias gith='git help'
alias githp='git help -a'
alias gitbra='git branch --list -a --color=always'
alias regit='git rebase -i'
alias gitchk='git checkout --branch'
alias gitc='git clone'
alias gstat='git status'
alias gitcom='git commit -m'
