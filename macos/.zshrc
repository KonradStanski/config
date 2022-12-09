# antigen
source $HOME/.config/zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# history search
hstr --show-configuration >> ~/.zshrc

# zsh settings
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
EDITOR=nvim

# Sourcing
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/paths.zsh
