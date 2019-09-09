#!/bin/bash
# CONFIGURATION FILE FOR MINT


#### MINT INSTALL PROGRAMS
# install all initial updates
echo ===================================================================================================
echo update
sudo apt upgrade -y && sudo apt install -y

# install chrome
echo ===================================================================================================
echo install chrome
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# install spotify
echo ===================================================================================================
echo install spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update -y
sudo apt-get install spotify-client -y

# install sublime
echo ===================================================================================================
echo sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt install sublime-text -y

# Install Vim
sudo apt install vim -y

# Install Tmux
echo ===================================================================================================
echo Tmux
sudo apt install tmux -y
sudo apt install acpi
cp ../../settings/.tmux.conf ~/.tmux.conf

# install python3
echo ===================================================================================================
echo python
sudo apt install python3 -y

# install pip3
echo ===================================================================================================
echo pip3
sudo apt install python3-pip -y

# install pip3 packages
echo ===================================================================================================
echo pip3 packages
pip3 install virtualenv
pip3 install numpy
pip3 install matplotlib
pip3 install pyserial

# install CommandLine Utilities:
echo ===================================================================================================
echo tree
sudo apt install tree -y

echo glanecs
sudo apt install glances -y

# Load settings
# opposite is dconf dump / > cinnamon_settings.conf
echo ===================================================================================================
echo settings
dconf load / < mint_settings.conf

# update all installed packages
echo ===================================================================================================
echo update packages
sudo apt upgrade -y && sudo apt install -y

# set git settings
git config --global user.email kstanisz@ualberta.ca
git config --global user.name konradStanski
git config --global credential.helper store

# Load Backgrounds
curl -o ~/Pictures/backgrounds/smokyforest_background.jpg https://i.imgur.com/lhZoAOv.jpg
curl -o ~/Pictures/backgrounds/dock_background.jpg https://i.imgur.com/8ndudfV.jpg
curl -o ~/Pictures/backgrounds/mars_background.jpg https://i.imgur.com/apNgmSO.jpg
curl -o ~/Pictures/backgrounds/earth_background.jpg https://i.imgur.com/cqeMox0.jpg
curl -o ~/Pictures/backgrounds/apple_background.jpg https://i.imgur.com/Sux2Age.jpg
gsettings set org.cinnamon.desktop.background picture-uri 'file:///home/konrad/Pictures/backgrounds/smokyforest_background.jpg'

# Copy bashrc and vimrc
cp ../../settings/.bashrc ~/.bashrc
cp ../../settings/.vimrc ~/.vimrc
source ~/.bashrc

# Create Scripts folder and copy contents
mkdir ~/scripts
cp ../../scripts/ ~/scripts

# Setup custom sublime settings
cp ../../settings/sublime-text-3/Package\ Control.sublime-settings ~/.config/sublime-text-3/Packages/User
cp ../../settings/sublime-text-3/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User

# Inorder to launch terminal in no border mode you must make a hotkey with gnome-terminal --hide-menubar
#
# Command to restart mouse driver
# sudo modprobe -r hid-multitouch && sudo modprobe hid-multitouch
#
#