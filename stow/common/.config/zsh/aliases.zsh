#####################################################
#                      ALIASES                      #
#####################################################
# Common aliases
alias q='exit'
alias re='reset'
#alias ls='ls -GHp'
alias ls="ls --color=auto"
alias la='ls -a'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias dirsize='du -sh -- * .[^.]* ..?* 2> /dev/null'

# typos
alias sl='ls'
alias cta='cat'
alias gerp='grep'

# Git aliases
alias lg='lazygit'
alias glog='git log --graph --oneline --decorate --all'

# neovim
alias nv='nvim'

# Common Files to edit (use EDITOR variable)
alias vimrc='$EDITOR ~/.config/vim/main.vim'
alias zshrc='$EDITOR ~/.config/zsh/main.zsh'
alias tmuxrc='$EDITOR ~/.config/tmux/main.tmux.conf'
alias aliases='$EDITOR ~/.config/zsh/aliases.zsh'
alias srctmux='tmux source-file ~/.tmux.conf'
alias srczsh='source ~/.zshrc'

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

