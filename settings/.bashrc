# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# GENERAL SETTINGS ###########################################
# Uncomment if you want to use tmux by default
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# ALIASES ####################################################
# Common aliases
alias q='exit'
alias home='cd ~'
alias root='cd /'
alias cs='clear;ls'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias dirsize='du -sh -- * .[^.]* ..?* 2> /dev/null'

# typos
alias sl='ls'
alias cta='cat'
alias gerp='grep'

# Git aliases
# https://jonsuh.com/blog/git-command-line-shortcuts/
alias gstat='git status'
alias gpush='git push'
alias gpull='git pull'
alias glog='git log --graph --oneline --decorate --all'
alias gdiff='git add .;git status -v;git reset'

# Common Files to edit
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias srcbash='source ~/.bashrc'
alias tmuxrc='vim ~/.tmux.conf'
alias srctmux='tmux source-file ~/.tmux.conf'

# SSH
alias sshcore='ssh <insert whatever here>'

# FUNCTIONS ####################################################
netinfo ()
{
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
/sbin/ifconfig | awk /'Bcast/ {print $3}'
/sbin/ifconfig | awk /'inet addr/ {print $4}'
/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
echo "${myip}"
echo "---------------------------------------------------"
}

# Get cheat sheet for a command
cheat(){
	curl cheat.sh/"$1"
}

# Attach to tmux session
tmuxa(){
	tmux attach-session -t "$1"
}

# Do entire git workflow
gdone(){
    git add .
    git commit -a -m "$*"
    git push
}

# Clone repo
gclone(){
  git clone https://github.com/"$1".git
}


#remove directory
rmdir(){
	rm -r -f "$1"
}

# Calculator
calc(){ awk "BEGIN{ print $* }" ;}

# BASH prompt https://misc.flogisoft.com/bash/tip_colors_and_formatting
shopt -s checkwinsize
green="\001$(tput setaf 34)\002"
yellow="\001$(tput setaf 172)\002"
blue="\001$(tput setaf 33)\002"
bold="\001$(tput bold)\002"
underline="\001$(tput smul)\002"
exitunder="\001$(tput rmul)\002"
reset="\001$(tput sgr0)\002"

PS1="$bold$green[\u@\h:"
PS1+="$underline$blue\w"
PS1+="$exitunder$green]$yellow\$(git_branch)$reset\$ "
export PS1
unset green blue bold reset
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# colour man pages:
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# PATHS #########################################################
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

export ANDROID_STUDIO=$HOME/Documents/android-studio-ide-183.5452501-linux/android-studio
export PATH=$PATH:$ANDROID_STUDIO/bin

export PATH=$PATH:$HOME/scripts

# OTHER #########################################################
