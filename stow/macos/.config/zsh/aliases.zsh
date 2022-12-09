
# ALIASES ####################################################
# Common aliases
alias q='exit'
alias ls='ls -GHp'
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
# https://jonsuh.com/blog/git-command-line-shortcuts/
alias gstat='git status'
alias gpush='git push'
alias gpull='git pull'
alias glog='git log --graph --oneline --decorate --all'
alias gdiff='git add .;git status -v;git reset'
alias gbranch='git branch -a'

# Common Files to edit (use EDITOR variable)
alias vimrc=
alias zshrc='$EDITOR ~/.zshrc'
alias srczsh='source ~/.zshrc'
alias tmuxrc='$EDITOR ~/.tmux.conf'
alias srctmux='tmux source-file ~/.tmux.conf'

#remove directory
rmdir(){
	rm -r -f "$1"
}
