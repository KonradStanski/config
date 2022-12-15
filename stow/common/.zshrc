source $HOME/.config/zsh/main.zsh

# EVERTHING BELOW IS NOT TRACKED BY GIT
# brew
export PATH="$HOME/.local/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
