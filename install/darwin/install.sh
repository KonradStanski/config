#!/bin/bash
# MANUAL INSTAL:
# parallels
# chrome
# notion
# stay
# magnet
# Maybe isntall amethyst instead of magnet???
# display link
# vscode brew install --cask visual-studio-code
# github desktop brew install --cask github
# configure chrome tab navigation shortcut in keyboard shortcuts


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


#####################################################
#                   CHANGE SETTINGS                 #
#####################################################

# Switch default shell to zsh
chsh -s $(which zsh)
