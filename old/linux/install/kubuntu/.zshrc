# ALIASES ####################################################
# Common aliases
alias q='exit'
alias la='ls -a'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias dirsize='du -sh -- * .[^.]* ..?* 2> /dev/null'

# typos
alias sl='ls'
alias cta='cat'
alias gerp='grep'

# Common Files to edit
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias srczsh='source ~/.zshrc'
alias tmuxrc='vim ~/.tmux.conf'
alias srctmux='tmux source-file ~/.tmux.conf'

# FUNCTIONS ####################################################
netinfo (){
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

gcom(){
    git commit -m"$*"
}

# Clone repo
gclone(){
    git clone https://github.com/"$1".git
}

#remove directory
rmdir(){
    rm -r -f "$1"
}

# PATHS #########################################################
export PATH=$PATH:$HOME/scripts

# OH-MY-ZSH #########################################################
export ZSH="/home/konrad/.oh-my-zsh"
ZSH_THEME="risto"
ENABLE_CORRECTION="true"


plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# make tab accept autocomplete
bindkey '^I' autosuggest-accept

source $ZSH/oh-my-zsh.sh
