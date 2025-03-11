#####################################################
#                      ALIASES                      #
#####################################################
# Common aliases
alias q='exit'
alias re='reset'
#alias ls='ls -GHp'
#alias ls="ls --color=auto"
if command -v eza &> /dev/null
then
  alias ls="eza"
  alias ll='eza -lah --icons'
  alias la='eza -a'
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

pudb() {
    if [ "$1" = "True" ]; then
        export PYTHONBREAKPOINT="pudb.set_trace"
    else
        unset PYTHONBREAKPOINT
    fi
    echo "PYTHONBREAKPOINT Value is:"
    echo $PYTHONBREAKPOINT
}

tformat() {
   if [ "$1" = "True" ]; then
      export TRACEFORMAT=tid,time,facility-name,trace-level,function-name
   else
      unset TRACEFORMAT
   fi
   echo "TRACEFORMAT Value is:"
   echo $TRACEFORMAT
}

# method to change file extensions
chext() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: chext <oldext> <newext>"
    return 1
  fi
  local oldext="$1"
  local newext="$2"
  for f in *."$oldext"; do
    [[ -e "$f" ]] || continue  # Skip if no files match
    mv -- "$f" "${f%.$oldext}.$newext"
  done
}

