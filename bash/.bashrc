# ~/.bashrc
# cd ~/ && wget --backups=2 https://gist.githubusercontent.com/artfaal/0a0b5ed4123b7f72d2ae04fe59829ba5/raw/40583cf83cf568f1dcfc926edff0b5c36f11005c/.bashrc

#####################################

# BASH CONFIG

#####################################

# ENG LANGUAGE
export LANG=en_US.UTF-8
export LANGUAGE=en
export LANG=en_US.UTF-8

#Unlim History
HISTSIZE=
HISTFILESIZE=

# Add bash_completion
if test -f /etc/bash_completion; then
  source /etc/bash_completion
fi

# FC vim for edit
#export FCEDIT=vim

# Make sublime default visual editor
export VISUAL=subl

# Avoid duplicates
HISTCONTROL=ignoreboth:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# Fix paths
shopt -s cdspell

# After each command, append to the history file and reread it
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Pretty ls
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# Vim for bash navigate
set -o vi

#####################################

# ALIAS ARCH

#####################################
alias paci="sudo pacman -S"
alias pacr="sudo pacman -Rcns"
alias pacg="sudo pacman -R $(pacman -Qdtq)"
#####################################

# ALIAS COMMON

#####################################

#restart bash
alias r="source ~/.bashrc"
alias st='subl'
alias cr="sudo /home/m-solovyev/connect-rosreestr.sh"
alias da="cd ~/deploy/ANSIBLE"
alias dm="cd ~/deploy/ANSIBLE/tmp/MAIL.RU"
alias RELOAD_ALL='cd ~/depoloy/ANSIBLE/ && ansible-playbook RM_ALL.yaml && ansible-playbook START_ALL.yaml --skip-tags get_images,tar-stuff,copy-front-bundle'

alias ta="tmux attach"
alias tk="tmux kill-server"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias docker_stat="sudo docker stats --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}'"
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}\t{{.Ports}}"'
alias ap="ansible-playbook"

alias clean_bash_history="awk '!seen[$0]++' ~/.bash_history > ~/.tmp && cat ~/.tmp > ~/.bash_history && rm ~/.tmp"
alias pyclean="find . -name \*.pyc -delete"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias pacls="cat /var/log/pacman.log | grep -i installed"
alias disk="cfdisk"
alias whateth="ls /sys/class/net/"
alias clean_bash_history="awk '!seen[$0]++' ~/.bash_history > ~/.tmp && cat ~/.tmp > ~/.bash_history && rm ~/.tmp"
alias pyclean="find . -name \*.pyc -delete"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias untar="tar -xvzf"
alias update="yaourt -Suy --aur --noconfirm && sudo yaourt -Suy --aur --noconfirm"

# SSH vith my bashrc config
function s() {
  scp ~/.bashrc $1:/tmp/.bashrc_temp
  ssh -t $1 "bash --rcfile /tmp/.bashrc_temp ; rm /tmp/.bashrc_temp"
}

# Docker exec
function de() {
  docker exec -it $1 bash
}

function scent() {
cat ~/.ssh/id_rsa.pub | ssh -i ~/MAIL-RU/id_rsa centos@$1 'cat >> ~/.ssh/authorized_keys'
}

#####################################

# ALIAS GIT

#####################################

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gpristine='git reset --hard && git clean -dfx'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ggpur='ggu'
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias ghh='git help'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gk='\gitk --all --branches'
alias gke='\gitk --all $(git log -g --pretty=%h)'
alias gl='git pull'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"
alias gm='git merge'
alias gmom='git merge origin/master'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/master'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'
alias gpu='git push upstream'
alias gpv='git push -v'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash save'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gsu='git submodule update'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias glum='git pull upstream master'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'

#####################################

# RUN UTILS

#####################################

#screenfetch
if hash screenfetch 2>/dev/null; then
    screenfetch
fi

#navi
if hash navi 2>/dev/null; then
    source "$(navi widget bash)"
fi


#####################################

# fkp stuff

#####################################

alias reload_arm_kd_fkp='cd /home/m-solovyev/deploy/ANSIBLE/tmp/FKP && ap -i _fkp reload-arm-kd.yaml'

export _FKP='/home/m-solovyev/deploy/ANSIBLE/tmp/FKP/_fkp'
export _DEVA='/home/m-solovyev/deploy/ANSIBLE/_deva'
export _ASGARD='/home/m-solovyev/deploy/ANSIBLE/_asgard'
export _SHIRE='/home/m-solovyev/deploy/ANSIBLE/_shire'
export _DO='/home/m-solovyev/deploy/ANSIBLE/_test'
