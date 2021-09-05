## An alias file for quicker syntax of common commands
alias kali='cd ~ && ./start-kali.sh'

## System level aliases
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'

alias d='dirs -v | head -10'
alias ls='ls -FC --color=always'
alias l.='ls -d .*'
alias la='ls -A'
alias l='ls -sh'
alias ll='l -lA'
alias lt='ll -shut'

alias xx='exit'
alias shit='inxi'
alias 600='chmod 600'
alias 644='chmod 644'
alias 700='chmod 700'
alias 755='chmod 755'
alias modx='chmod +x'
alias own="chown $(whoami):$(whoami)"
alias diff='diff --color=always'
alias diffy='diff -yw --suppress-common-lines'
alias c='bat'
alias cb='bat -l bash'
alias cr='bat **/README.*'
alias blist='bat --list-themes'
alias blang='bat --list-languages'
alias cn='cat -nst'
alias back="tac -r -s 'x\|[^x]' " # Reverse file and lines
alias cp='cp -ir'
alias mv='mv -i'
alias nano='nano -W'
alias less='less -FRX'
alias file='file -s -z'
alias fhere='find . -name '
alias cls='clear'
alias mkd='mkdir -pv'
alias path='echo ${PATH}'
alias top='htop'
alias du='du -h'
alias df='df -h'
alias free='free -mth'
alias psa='ps auxf'
alias wg='wget2'
alias wget2='wget2 -c --progress=bar'
alias histg='history | grep'
alias rc="nano $HOME/.bashrc"
alias colors="bash ~/scripts/setup/print_colors.sh"
alias funcs="nano -Y sh $OSH_CUSTOM/funcs.sh"
alias aliases="nano -Y sh $OSH_CUSTOM/aliases/bash.aliases.sh"
alias src="source ~/.bashrc"
alias net='curl ipinfo.io'
alias ip='ip -c -h -d -s -s a'
alias setperf='echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias setsave='echo "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias rfkill='sudo rfkill --output DEVICE,ID,TYPE,TYPE-DESC,SOFT,HARD'

## File removal "securely" for the noid...
alias sub='scrub -SRfr -p pfitzner33'
alias bish='scrub -SRfr -p pfitzner33 ~/.bash_history ~/.lesshst'
alias shard='shred -fzn 23 --remove=wipe'
alias rmf='rm -rf'

## Aliases for package management
alias ag='apt-get'
alias ai='apt-get install'
alias ap='apt-get purge'
alias al='apt list'
alias ali='apt list --installed'
alias alig='apt list --installed | grep'
alias as='apt search'
alias aptsh='apt show'
alias au='apt-get update'
alias auu='apt-get update && apt-get upgrade'
alias clapt='apt autoremove && apt remove && apt autoclean && apt clean'

## Dpkg simplification
alias dp='dpkg'
alias dp.h='dpkg --help'
alias dp.fh='dpkg --force-help'
alias dp.i='dpkg -i'
alias dp.l='dpkg -l'
alias dp.lg='dpkg -l | grep'
alias dp.L='dpkg -L'
alias dp.s='dpkg -S'
alias dp.con='dpkg --configure -a'

## Mega.nz cli aliases for different accounts
alias megadf.b="megadf -h --config=${HOME}/.biggin.megarc"
alias megals.b="megals -nh --config=${HOME}/.biggin.megarc /Root"
alias megadl.b="megadl --config=${HOME}/.biggin.megarc --path"
alias megacopy.b="megacopy --config=${HOME}/.biggin.megarc"
alias megaget.b="megaget --config=${HOME}/.biggin.megarc --path"
alias megaput.b="megaput --config=${HOME}/.biggin.megarc --enable-previews --path"

alias megadf.d="megadf -h --config=${HOME}/.droid.megarc"
alias megals.d="megals -nh --config=${HOME}/.droid.megarc /Root"
alias megadl.d="megadl --config=${HOME}/.droid.megarc --path"
alias megacopy.d="megacopy --config=${HOME}/.droid.megarc"
alias megaget.d="megaget --config=${HOME}/.droid.megarc --path"
alias megaput.d="megaput --config=${HOME}/.droid.megarc --enable-previews --path"

## Git for lazy people
#alias git.h='git help'
#alias git.ha='git help -a'
#alias git.bra='git branch --list -a --color=always'
#alias regit='git rebase -i'
#alias git.rbc='git rebase --continue'
#alias git.rba='git rebase --abort'
#alias git.rbs='git rebase --skip'
#alias git.chk='git checkout'
#alias git.cl='git clone'
#alias gstat='git status'
#alias gadd='git add . '
#alias git.l='git log'
#alias git.c='git commit -m'
#alias git.ca='git commit --amend -m'
#alias git.cn='git commit --no-edit -m'
#alias git.pu='git push'
#alias git.ll='git pull'
#alias git.re='git reset --hard'
#alias git.add='git remote add'
#alias git.set='git remote --set-upstream'
#alias git.re='git reset'
#alias git.rh='git reset --hard'
#alias git.rs='git reset --soft'
#alias git.cp='git cherry-pick'
#alias git.st='git stash'
#alias git.sq='git squash'