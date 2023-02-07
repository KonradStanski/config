#!/bin/bash
# MANUAL INSTAL:
# parallels
# notion
# stay
# magnet
# Maybe isntall amethyst instead of magnet???
# display link

#####################################################
#               PRE-INSTALL PROGRAMS                #
#####################################################
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Updating Homebrew"
    brew update
fi

if [[ $(command -v cargo) == "" ]]; then
    echo "Installing rust"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
    echo "Rust already installed"
fi


#####################################################
#              PRIMARY BREW PROGRAMS                #
#####################################################

brew bundle

#####################################################
#                   OTHER PROGRAMS                  #
#####################################################

# Install fzf key bindings and fuzzy completion
$(brew --prefix)/opt/fzf/install
# use this to uninstall
# $(brew --prefix)/opt/fzf/uninstall

#####################################################
#                   CHANGE SETTINGS                 #
#####################################################

# Switch default shell to zsh
chsh -s $(which zsh)
