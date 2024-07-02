#####################################################
#              ZSH CONFIGURATION FILE               #
#####################################################
echo "Konrad's Zsh Config"
# antigen
source $HOME/.config/zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle copyfile
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle agkozak/zsh-z
#antigen bundle jeffreytse/zsh-vi-mode
antigen apply

# load fzf for zsh-vi-mode
zvm_after_init() {
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
}

# enables completion engine
autoload -Uz compinit && compinit

# Sourcing
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/platform.zsh

# bind key for completion accept
bindkey '`' autosuggest-accept

# zsh history settings
HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
SAVEHIST=$HISTSIZE


# setting my default editor
export EDITOR=vim

# set default config folder (needed for macos sometimes)
export XDG_CONFIG_HOME="$HOME/.config"

# colors I want for files and folder ect when "ls"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export CLICOLOR=1

# set fzf default search
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Paths
export PATH="$HOME/bin:$PATH"

# starship
# Check if staship installed be seeing if "starship" runs, if not use backup prompt
if command -v starship &> /dev/null
then
    echo "Using Starship Prompt"
    eval "$(starship init zsh)"
else
    echo "Using Zsh Prompt"
    source $HOME/.config/zsh/backup_prompt.zsh
fi

