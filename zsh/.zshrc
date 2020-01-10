#Normal colors for LS

#LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/m-solovyev/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="frisk"
ZSH_THEME="gnzh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ansible docker docker-compose archlinux rsync systemd sudo zsh_reload zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#################################
#
#
#       CUSTOM
#
#
#################################



#####################################

# ALIAS COMMON

#####################################

#restart zsh
alias r="source ~/.zshrc"
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

alias update="yaourt -Suy --aur --noconfirm && sudo yaourt -Suy --aur --noconfirm"

# Docker exec
function de() {
  docker exec -it $1 bash
}

function scent() {
cat ~/.ssh/id_rsa.pub | ssh -i ~/MAIL-RU/id_rsa centos@$1 'cat >> ~/.ssh/authorized_keys'
}

#####################################

# fkp stuff

#####################################

alias reload_arm_kd_fkp='cd /home/m-solovyev/deploy/ANSIBLE/tmp/FKP && ap -i _fkp reload-arm-kd.yaml'

export _FKP='/home/m-solovyev/deploy/ANSIBLE/tmp/FKP/_fkp'
export _DEVA='/home/m-solovyev/deploy/ANSIBLE/_deva'
export _ASGARD='/home/m-solovyev/deploy/ANSIBLE/_asgard'
export _SHIRE='/home/m-solovyev/deploy/ANSIBLE/_shire'
export _DO='/home/m-solovyev/deploy/ANSIBLE/_test'

alias rfkp='sudo resolvectl dns wlp5s0 10.132.14.4'
alias rmail='sudo resolvectl dns wlp5s0 10.31.13.22'
#####################################

# RUN UTILS

#####################################

#screenfetch
if hash screenfetch 2>/dev/null; then
    screenfetch
fi


####################################
#
#
#       ZSH_CONFIG
#
#
####################################

HISTSIZE=999999999



setopt appendhistory autocd extendedglob nomatch
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/m-solovyev/.zshrc'

autoload -Uz compinit
compinit

setopt completealiases
autoload -U compinit && compinit
setopt HIST_IGNORE_DUPS


#shell configuration by Vlsu (http://vlsu.blogspot.com)
autoload -U compinit   
compinit -D    
autoload colors && colors   
autoload zcalc     
zstyle ':completion:*' menu yes select 
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
autoload -U pick-web-browser
alias -s html=pick-web-browser

bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-pattern-search-forward


setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY 
setopt histexpiredupsfirst histfindnodups
setopt CORRECT_ALL
setopt AUTO_CD
setopt SH_WORD_SPLIT
setopt IGNORE_EOF
setopt NO_BEEP
setopt extended_glob
setopt correct
setopt MENUCOMPLETE
setopt nohup
setopt ZLE
setopt MULTIBYTE
setopt NUMERIC_GLOB_SORT

mkd() { mkdir $1; cd $1 }

unpack() {
if [ -f $1 ] ; then
case $1 in
 *.tar.bz2)   tar xjf $1        ;;
 *.tar.gz)    tar xzf $1     ;;
 *.bz2)       bunzip2 $1       ;;
 *.rar)       unrar x $1     ;;
 *.gz)        gunzip $1     ;;
 *.tar)       tar xf $1        ;;
 *.tbz2)      tar xjf $1      ;;
 *.tgz)       tar xzf $1       ;;
 *.zip)       unzip $1     ;;
 *.Z)         uncompress $1  ;;
 *.7z)        7z x $1    ;;
 *)           echo "$fg_bold[red]Ошибка:$reset_color Невозможно распаковать '$1'..." ;;
esac
else
echo "$fg_bold[red]Ошибка:$reset_color '$1' - неподдерживаемый тип файла"
fi
}

pack() {
if [ $1 ] ; then
case $1 in
 tbz)    tar cjvf $2.tar.bz2 $2      ;;
 tgz)    tar czvf $2.tar.gz  $2    ;;
 tar)   tar cpvf $2.tar  $2       ;;
 bz2) bzip $2 ;;
 gz)  gzip -c -9 -n $2 > $2.gz ;;
 zip)    zip -r $2.zip $2   ;;
 7z)     7z a $2.7z $2    ;;
 *)      echo "$fg_bold[red]Ошибка:$reset_color '$1' не может быть упакован через pack()" ;;
esac
else
echo "$fg_bold[red]Ошибка:$reset_color '$1' - неподдерживаемый тип файла"
fi
}

ccopy(){ cp $1 /tmp/ccopy.$1; }
alias cpaste="ls /tmp/ccopy.* | sed 's|/tmp/ccopy.||' | xargs -I % mv /tmp/ccopy.% ./%"

alias mv='nocorrect mv -i'
alias cp='nocorrect cp -iR'
alias rm='nocorrect rm -i'
alias rmf='nocorrect rm -f'
alias rmrf='nocorrect rm -fR'
alias mkdir='nocorrect mkdir'
alias ag='nocorrect ag'
alias ls='ls --color=auto'   
alias lsd='ls -ld .*'    
alias lls='ls -alFh --color=auto'
alias grep='grep --color=auto'   
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias -g convKU="| iconv -c -f koi8r -t utf8"  
alias -g convCU="| iconv -c -f cp1251 -t utf8"
alias -g convUK="| iconv -c -f utf8 -t koi8r"  
alias -g convUC="| iconv -c -f utf8 -t cp1251"  
alias df='df -h'
alias du='du -h'
alias psgrep='ps aux | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'
alias dirtree='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

alias -s {txt,log,list}=vim
alias -s {pdf,djvu}="nohup evince"
alias -s {avi,mpeg,mpg,mov,m2v,flv}="nohup totem"
alias -s {ogg,mp3,wav,m3u,pls}="nohup totem"
alias -s {jpg,jpeg,png,gif,tif,tiff,bmp}="nohup eog"

#zstyle ':completion:*:*:kill:*' menu yes select
#zstyle ':completion:*:kill:*' force-list always
#zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"
#zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
#zstyle ':completion:*:processes-names' command 'ps axho command' 
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*::::' completer _expand _complete _correct _ignored _approximate
#zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
#zstyle ':completion:*:expand:*' tag-order all-expansions
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:options' description 'yes'
#zstyle ':completion:*:options' auto-description '%d'
#zstyle ':completion:*:descriptions' format '> %B%d%b'
#zstyle ':completion:*:messages' format '> %d'
#zstyle ':completion:*:warnings' format '> Ошибка: нет совпадений для: %d'
#zstyle ':completion:*:corrections' format '> %B%d (число ошибок: %e)%b'
#zstyle ':completion:*:correct:*' insert-unambiguous true
#zstyle ':completion:*:correct:*' original true
#zstyle ':completion:*:correct:*' prompt 'исправить на:'
#zstyle ':completion:*' prompt 'Исправить (число ошибок: %e) > '
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
#zstyle ':completion:*' match-original both
#zstyle ':completion:*:matches' group 'yes'
#zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
#zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~''*?.old' '*?.pro'
#zstyle ':completion:*:rm:*' ignore-line yes
#zstyle ':completion:*:functions' ignored-patterns '_*'
#zstyle ':completion:*:incremental:*' completer _complete _correct
#zstyle ':completion:*:predict:*' completer _complete
#zstyle -e ':completion:*' hosts 'reply=($myhosts)'
#zstyle ':completion:*' insert-tab true
#zstyle ':completion:*' select-prompt '%SСтрока: %LЭлемент: %M[%p]%s'
#zstyle ':completion:*' list-prompt '%SТекущее положение: %p%s'
#zstyle ':completion:*' sort true
#zstyle ':completion:*' file-sort name
#zstyle ':completion:*' keep-prefix changed
#zstyle ':completion:*:man:*' separate-sections true
#zstyle ':completion:*:history-words' stop yes
#zstyle ':completion:*:history-words' remove-all-dups yes
#zstyle ':completion:*:history-words' list false
#zstyle ':completion:*:history-words' menu yes select
#zstyle ':completion:*' old-menu true
#zstyle ':completion:*' original true
#zstyle ':completion:*' substitute 1
#zstyle ':completion:*' use-compctl true
#zstyle ':completion:*' word true
#zstyle ':completion:*' special-dirs true
#zstyle ':completion:*' squeeze-slashes true
#zstyle ':completion:*:(ssh|scp|ftp):*' hosts $hosts
#zstyle ':completion:*:(ssh|scp|ftp):*' users $users
#zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'
#zstyle ':completion:*:*:*:users' ignored-patterns adm apache bin daemon games gdm halt ident junkbust lp mail mailnull named news nfsnobody nobody nscd ntp operator pcap postgres radvd rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs


bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-pattern-search-forward
LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:'

