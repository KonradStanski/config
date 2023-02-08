#####################################################
#              ZSH CONFIGURATION FILE               #
#####################################################
# antigen
source $HOME/.config/zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle copyfile
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle agkozak/zsh-z
antigen apply

# enables completion engine
autoload -Uz compinit && compinit

# Sourcing
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/paths.zsh
source $HOME/.config/zsh/platform.zsh

# bind key for completion accept
bindkey '`' autosuggest-accept

# zsh history settings
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# setting my default editor
export EDITOR=nvim

# colors I want for files and folder ect when "ls"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export CLICOLOR=1

# starship
# Check if staship installed be seeing if "starship" runs, if not use backup prompt
if command -v starship &> /dev/null
then
    eval "$(starship init zsh)"
else
    source $HOME/.config/zsh/backup_prompt.zsh
fi

