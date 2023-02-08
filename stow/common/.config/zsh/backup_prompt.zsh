# PROMPT TO USE IF STARSHIP NOT INSTALLED


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
