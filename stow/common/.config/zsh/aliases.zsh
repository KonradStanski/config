#####################################################
#                      ALIASES                      #
#####################################################
# Common aliases
alias q='exit'
alias re='reset'
#alias ls='ls -GHp'
#alias ls="ls --color=auto"
if command -v exa &> /dev/null
then
  alias ls="exa"
  alias ll='exa -lah --icons'
  alias la='exa -a'
fi
if command -v ranger &> /dev/null
then
  alias e=". ranger"
fi
alias ..='cd ..'
alias ...='cd ../..'
alias dirsize='du -sh -- * .[^.]* ..?* 2> /dev/null'
alias find='fd'

# typos
alias sl='ls'
alias cta='cat'
alias gerp='grep'

# Git aliases
alias lg='lazygit'
alias glog='git log --graph --oneline --decorate --all'
alias gpull='git pull'

# vim
alias nv='nvim'
alias vt='vim -p `fzf`'

# Common Files to edit (use EDITOR variable)
alias vimrc='$EDITOR ~/.config/vim/main.vim'
alias zshrc='$EDITOR ~/.config/zsh/main.zsh'
alias tmuxrc='$EDITOR ~/.config/tmux/main.tmux.conf'
alias aliases='$EDITOR ~/.config/zsh/aliases.zsh'
alias srctmux='tmux source-file ~/.tmux.conf'
alias srczsh='source ~/.zshrc'

# search
rgs(){
  rg -i -e "$*" .
}

#remove directory
rmdir(){
	rm -r -f "$1"
}

# Do entire git workflow
gdone(){
    git add .
    git commit -a -m "$*"
    git push
}

