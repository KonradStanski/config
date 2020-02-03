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
alias ls='ls -GHp'
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
alias gbranch='git branch -a'

# Common Files to edit
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias srczsh='source ~/.zshrc'
alias tmuxrc='vim ~/.tmux.conf'
alias srctmux='tmux source-file ~/.tmux.conf'

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
    git commit -a -m "$1"
    git push
}

# Clone repo
gclone(){
  git clone https://github.com/"$1".git
}

# Commit with message
gcom(){
  git commit -m"$*"
}

#remove directory
rmdir(){
	rm -r -f "$1"
}

# Calculator
calc(){ awk "BEGIN{ print $* }" ;}


# zsh Prompt
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export LSCOLORS="gxfxcxdxbxegedabagacad"

autoload -U promptinit && promptinit
setopt prompt_subst

PROMPT='%B%F{28}[%f%b' #[
PROMPT+='%B%F{21}%n%f%b' #username
PROMPT+='%F{240}@ %f' #@
PROMPT+='%B%F{21}%~%f%b' #dir
PROMPT+='%B%F{28}]%f%b' #]
# PROMPT+='%F{214}$(git_branch)%f' #git
PROMPT+='%F{240}:%f ' #:

#set git right prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{214}(%b)%f'
zstyle ':vcs_info:*' enable git
RPROMPT+=' %(?.%F{green}√.%F{red}?%?)%f' #result of last command

# ZSH specific stuff
autoload -Uz compinit && compinit

# PATHS #########################################################
export PATH=$PATH:$ANDROID_STUDIO/bin
export PATH=$PATH:$HOME/scripts
export ANDROID_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

# OTHER #########################################################
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH
