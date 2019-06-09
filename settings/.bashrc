# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Uncomment if you want to use tmux by default
# [[ $TERM != "screen" ]] && exec tmux


# ALIASES ####################################################
# Common aliases
alias q='exit'
alias home='cd ~'
alias root='cd /'
alias cs='clear;ls'
alias p='cat'
alias ls='ls --color=auto'
alias lsa='ls -a'
alias lsl='ls -l'
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
alias gcom='git commit -m'
alias gadd='git add .'
alias gpush='git push'
alias glg='git log --graph --oneline --decorate --all'

# Common Files to edit
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias srcbash='source ~/.bashrc'

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

#copy and go to dir
cpg (){
  if [ -d "$2" ];then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}

#move and go to dir
mvg (){
  if [ -d "$2" ];then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}

# Do entire git workflow
gdone() {
    git add .
    git commit -a -m "$1"
    git push
}

#remove directory
rmdir(){
	rm -r -f "$1"
}


# PATHS #########################################################
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

export ANDROID_STUDIO=$HOME/Documents/android-studio-ide-183.5452501-linux/android-studio
export PATH=$PATH:$ANDROID_STUDIO/bin
alias android-studio='studio.sh'

# BASH prompt https://misc.flogisoft.com/bash/tip_colors_and_formatting
shopt -s checkwinsize
green="\001$(tput setaf 34)\002"
blue="\001$(tput setaf 25)\002"
bold="\001$(tput bold)\002"
underline="\001$(tput smul)\002"
exitunder="\001$(tput rmul)\002"
reset="\001$(tput sgr0)\002"

PS1="$bold$green[\u@\h:"
PS1+="$underline$blue\w"
PS1+="$exitunder$green]\$$reset "
export PS1
unset green blue bold reset


# OTHER #########################################################
