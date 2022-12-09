#!/bin/bash

new_section() {
    echo ""
    echo $1
    echo ===================================================================================================
}

new_section "update"
sudo apt upgrade -y && sudo apt install -y

new_section "Install Chrome"
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

new_section "Install VsCode"
sudo apt install software-properties-common apt-transport-https wget
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

new_section "Install Github Desktop"
sudo wget https://github.com/shiftkey/desktop/releases/download/release-2.9.3-linux3/GitHubDesktop-linux-2.9.3-linux3.deb
sudo apt-get install gdebi-core
sudo gdebi GitHubDesktop-linux-2.9.3-linux3.deb

new_section "Install Spotify"
sudo apt install snapd
sudo snap install spotify

new_section "Install Vim"
sudo apt install vim -y
cp ../../settings/.vimrc ~/.vimrc


new_section "Install Tmux"
sudo apt install tmux -y
sudo apt install acpi
cp ../../settings/.tmux.conf ~/.tmux.conf

new_section "Install Python3"
sudo apt install python3 -y
sudo apt install python3-pip -y

new_section "Install Command Line Utilities"
sudo apt install tree -y
sudo apt install glances -y

new_section "Install TouchEgg"
sudo add-apt-repository ppa:touchegg/stable
sudo apt update
sudo apt install touchegg -y
cp ./touchegg.conf ~/.config/touchegg/

new_section "Install ZSH and oh-my-zsh"
sudo apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

new_section "Install oh-my-zsh"
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

new_section "Install Buncha Programs"
sudo apt install transmission
