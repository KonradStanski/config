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
# antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle agkozak/zsh-z
antigen apply

# enables completion engine
autoload -Uz compinit && compinit

# Sourcing
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/paths.zsh
source $HOME/.config/zsh/platform.zsh
# source $HOME/.config/fzf/fzf.zsh

# history search
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

# bind key for completion accept
bindkey '^ ' autosuggest-accept

# zsh history settings
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# setting my default editor
export EDITOR=nvim

# colors I want for files and folder ect when "ls"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export CLICOLOR=1

# Settings for terminal prompt
autoload -U promptinit && promptinit
setopt prompt_subst
# needed for git prompt
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# main prompt
PROMPT='%B%F{34}[%f%b' #[
PROMPT+='%F{34}%n%f' #username
PROMPT+='%F{34}@%f' #@
PROMPT+='%F{34}%m:%f' # comp
PROMPT+='%U%B%F{27}%~%f%b%u' #dir
PROMPT+='%B%F{34}]%f%b' #]
PROMPT+='%F{254}%f' #:
PROMPT+=' 
%B%F{34}> %f%b' # new line and >
#set git right prompt
RPROMPT=''
RPROMPT='%F{214}$(git_branch)%f' #git
RPROMPT+=' %(?.%F{green}√.%F{red}?%?)%f' #result of last command


