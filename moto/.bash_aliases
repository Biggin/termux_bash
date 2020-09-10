## An alias file for a faster workflow, shorter syntax and shell customization for my most common commands. Why type the same overly long commands on a daily basis

## System level aliases
alias ..='cd ..'
alias cls='clear'
alias mkd='mkdir -p'
alias src='source ~/.bashrc'
alias rc='nano ~/.bashrc'
alias func='nano ~/.bash_functions'
alias aliases='nano ~/.bash_aliases'
alias ip='ip -c'
alias net='curl ipinfo.io/ip'
alias path='echo ${PATH}'
alias rfkill=' rfkill --output DEVICE,ID,TYPE,TYPE-DESC,SOFT,HARD'
alias xx='exit'
alias pff='poweroff'
alias suown="sudo chown ${USER:USER}"
alias arch='cd ~ && bash start-arch.sh'
alias deb='cd ~/debian && bash start-debian.sh'
alias pc='ssh tux@10.168.11.55'

## File handling aliases
alias c='bat'
alias cn='cat -nst'
alias cpr='cp -ir'
alias back="tac -r -s 'x\|[^x]' "
alias filez='file -z'
alias tile='file -p --extension'
alias diff='diff --color=always'
alias diffy='diff -yw --suppress-common-lines'
alias lesser='less --status-column --quit-if-one-screen --quit-on-intr --no-lessopen --squeeze-blank-lines --hilite-unread'
alias bat='bat --color always --decorations always --style full --theme Dracula'

## 'Secure' file removal for the noid...
alias sub='scrub -SRfr -p bsi'
alias bish='scrub -SRfr -p gutmann ~/.bash_history'
alias shard='shred -fzn 23 --remove=wipe'
alias rmf='rm -rf'

## Aliases for package management
alias ag=' apt-get'
alias ai=' apt-get install'
alias ap=' apt-get purge'
alias al='apt list'
alias ali='apt list --installed'
alias alig='apt list --installed | grep'
alias as='apt search'
alias apsh='apt show'
alias au=' apt-get update'
alias auu=' apt-get update &&  apt-get upgrade'
alias clapt=' apt autoremove &&  apt remove &&  apt autoclean &&  apt clean'

## Dpkg simplification
alias lintian='lintian --color=always'
alias dp.h='dpkg --help'
alias dp.fh='dpkg --force-help'
alias dp.l='dpkg -l'
alias dp.L='dpkg -L'
alias dp.s='dpkg -S'
alias dp.con=' dpkg --configure -a'

## Python shortcuts for the lazy
alias py='python'
alias piss='pip search'
alias pi='pip install'

## Android development⅞ commands 
alias adb_='adb devices -l'
alias adbk='adb kill-server'
alias adb.pu='adb push'
alias adb.ll='adb pull'
alias adb.sh='adb shell'
alias adb.rb='adb reboot bootloader'
alias adb.rr='adb reboot recovery'

alias fast='fastboot'
alias fast_='fastboot devices -l'
alias fast.re='fastboot reboot'
alias fast.rb='fastboot reboot bootloader'
alias fast.fr='fastboot flash recovery'
alias fast.fb='fastboot flash boot'
alias fast.o='fastboot oem'
alias fast.var='fastboot getvar all'

## Git for lazy people
alias git='hub'
alias git.h='git help'
alias git.ha='git help -a'
alias git.b='git branch'
alias git.br='git branch -a --color=always'
alias regit='git rebase -i'
alias git.chk='git checkout'
alias clone='git clone'
alias gstat='git status'
alias gadd='git add .'
alias git.c='git commit -m'
alias git.pu='git push'
alias git.ll='git pull'
