#!/bin/bash
# CONFIGURATION FILE FOR FEDORA

#### FEDORA INSTALL PROGRAMS
# update repositories and packages
sudo dnf upgrade -y

# install gnome-tweak-tool
sudo dnf makecache
sudo dnf install gnome-tweak-tool -y

# load all gnome settings 
## TO DUMP ALL SETTINGS USE: dconf dump /org/gnome/desktop/ > gnome-settings.conf
## TO RESET, USE: dconf reset -f /org/gnome/desktop/
dconf load /org/gnome/desktop/ < gnome-settings.conf

# install chromeium
sudo dnf install chromium -y

# install sublime and import settings
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install sublime-text -y

# install wireshark
sudo dnf install wireshark-qt -y

# install spotify
sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
sudo dnf install spotify-client -y

# install python packages (python cmoes installed)
sudo pip3 install numpy matplotlib keras

# install virtualbox

