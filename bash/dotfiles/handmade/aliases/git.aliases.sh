## Git aliases borrowed from the oh-my-bash git plugin and
## modified for my use on various systems

alias aliases.git='nano $OSH_CUSTOM/aliases/git.aliases.sh'

#############
#			#
# FUNCTIONS #
#			#
#############

# The name of the current branch
# Backward-compatibility wrapper for when this function was
# defined here in the plugin, before being pulled in to core
# lib/git.zsh as git_current_branch() to fix the core -> git
# plugin dependency.
function current_branch() {
  git_current_branch
}

# The list of remotes
function current_repository() {
  if ! $_omb_git_git_cmd rev-parse --is-inside-work-tree &> /dev/null; then
    return
  fi
  echo $($_omb_git_git_cmd remote -v | cut -d':' -f 2)
}

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}

# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

###########
#		  #
# Aliases #
#		  #
###########

# Sorted Alphabetically
alias gadd='git add .'
alias git.aa='git add --all'
alias git.ap='git add --patch'
alias git.au='git add --update'

alias git.br='git branch'
alias git.bra='git branch -a'
alias git.brd='git branch -d'
alias git.brad='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'

alias git.brn='git branch --no-merged'
alias git.bre='git branch --remote'
alias git.bl='git blame -b -w'
alias git.bs='git bisect'
alias git.bsb='git bisect bad'
alias git.bsg='git bisect good'
alias git.bsr='git bisect reset'
alias git.bss='git bisect start'

alias git.c='git commit -m'
alias git.ca='git commit -a -m'
alias git.cs='git commit -s -m'
alias git.cf='git config --list'
alias git.cl='git clone --recursive'
alias glean='git clean -fd'
alias gristine='git reset --hard && git clean -dfx'
alias git.cb='git checkout -b'
alias git.cm='git checkout master'
alias git.cd='git checkout develop'
alias git.chk='git checkout'
alias gcount='git shortlog -sn'
#compdef _git gcount complete -F _git gcount
alias git.cp='git cherry-pick'
alias git.cpa='git cherry-pick --abort'
alias git.cpc='git cherry-pick --continue'
alias git.cps='git cherry-pick -s'
alias git.cS='git commit -S'

alias git.d='git diff'
alias git.dc='git diff --cached'
alias git.dct='git describe --tags `git rev-list --tags --max-count=1`'
alias git.dt='git diff-tree --no-commit-id --name-only -r'
alias git.dw='git diff --word-diff'

gdv() {
  git diff -w "$@" | view -
}
#compdef _git gdv=git-diff

alias git.f='git fetch'
alias git.fa='git fetch --all --prune'
alias git.fo='git fetch origin'

gfg() {
  git ls-files | grep "$@"
}
#compdef _grep gfg

alias gg='git gui citool'
alias gga='git gui citool --amend'

ggf() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git push --force origin "${b:=$1}"
}
#compdef _git ggf=git-checkout

ggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git pull origin "${b:=$1}"
  fi
}
#compdef _git ggl=git-checkout

ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}
#compdef _git ggp=git-checkout

ggpnp() {
  if [[ "$#" == 0 ]]; then
    ggl && ggp
  else
    ggl "${*}" && ggp "${*}"
  fi
}
#compdef _git ggpnp=git-checkout

ggu() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git pull --rebase origin "${b:=$1}"
}
#compdef _git ggu=git-checkout

alias ggpur='ggu'
#compdef _git ggpur=git-checkout

alias ggpull='git pull origin $(git_current_branch)'
#compdef _git ggpull=git-checkout

alias ggpush='git push origin $(git_current_branch)'
#compdef _git ggpush=git-checkout

alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias git.h='git help'
alias git.ha='git help -a'

alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
#compdef _git git-svn-dcommit-push=git

alias gk='\gitk --all --branches'
#compdef _git gk='gitk'
alias gke='\gitk --all $(git log -g --pretty=%h)'
#compdef _git gke='gitk'

alias git.ll='git pull'
alias git.lg='git log --stat'
alias git.lgp='git log --stat -p'
alias git.lgg='git log --graph'
alias git.lgga='git log --graph --decorate --all'
alias git.lgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"
#compdef _git glp=git-log

alias git.mrg='git merge'
alias git.mom='git merge origin/master'
alias git.mt='git mergetool --no-prompt'
alias git.mtvim='git mergetool --no-prompt --tool=vimdiff'
alias git.mum='git merge upstream/master'

alias git.pu='git push'
alias git.pud='git push --dry-run'
alias git.puat='git push origin --all && git push origin --tags'
#compdef _git gpoat=git-push
alias git.puu='git push upstream'
alias git.puv='git push -v'

alias git.re='git remote'
alias git.ra='git remote add'
alias git.rb='git rebase'
alias git.rba='git rebase --abort'
alias git.rbc='git rebase --continue'
alias git.rbi='git rebase -i'
alias git.rbm='git rebase master'
alias git.rbs='git rebase --skip'
alias git.rh='git reset HEAD'
alias git.rs='git reset --soft'
alias git.rhh='git reset HEAD --hard'
alias git.rmv='git remote remove'
alias git.rnm='git remote rename'
alias git.rset='git remote set-url'
alias git.rt='cd $(git rev-parse --show-toplevel || echo ".")'
alias git.ru='git reset --'
alias git.rup='git remote update'
alias git.rv='git remote -v'

alias gstab='git status -sb'
alias git.s='git switch'
alias git.sd='git svn dcommit'
alias git.si='git submodule init'
alias git.sps='git show --pretty=short --show-signature'
alias git.sr='git svn rebase'
alias git.ss='git status -s'
alias gstat='git status'
alias git.sta='git stash save'
alias git.staa='git stash apply'
alias git.stc='git stash clear'
alias git.std='git stash drop'
alias git.stl='git stash list'
alias git.stp='git stash pop'
alias git.sts='git stash show --text'
alias git.su='git submodule update'

alias git.ts='git tag -s'
alias git.tv='git tag | sort -V'

alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias git.up='git pull --rebase'
alias git.upv='git pull --rebase -v'
alias git.upa='git pull --rebase --autostash'
alias git.upav='git pull --rebase --autostash -v'
alias git.lum='git pull upstream master'

alias git.wch='git whatchanged -p --abbrev-commit --pretty=medium'
alias git.wip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
