#!/bin/bash

# OPTIONAL PACKAGES#####################################################
# Install overgrive

# install arduino-ua/mk/corec
sudo apt-get intall arduino arduino-core -y
sudo apt-get install screen -y
sudo apt-get install arduino-mk -y

# install java for android development
https://medium.com/@aashimad1/install-android-studio-in-ubuntu-b8aed675849f
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default

# Install and configure wireshark
sudo apt-get install wireshark
sudo dpkg-reconfigure wireshark-common
sudo usermod -a -G wireshark $USER

# Install Virtualbox
sudo apt-get isntall virtualbox -y
sudo apt install virtualbox-ext-pack
sudo apt install virtualbox-qt

# Install Android Studio
wget https://dl.google.com/dl/android/studio/ide-zips/3.4.1.0/android-studio-ide-183.5522156-linux.tar.gz
tar -xvzf android-studio-ide-183.5522156-linux.tar.gz
sudo mv android-studio /opt/
echo '' >> ~/.bashrc
echo '# Android studio stuff' >> ~/.bashrc
echo 'alias android-studio="/opt/android-studio/bin/studio.sh"' >> ~/.bashrc

# Install jstock
wget https://github.com/yccheok/jstock/releases/download/release_1-0-7-37/jstock-1.0.7.37-bin.zip
sudo unzip jstock-1.0.7.37-bin.zip -d /opt/
sudo chmod +x /opt/jstock/jstock.sh
echo '' >> ~/.bashrc
echo '# jstock path and alias' >> ~/.bashrc
echo 'alias jstock="/opt/jstock/jstock.sh &"' >> ~/.bashrc

# Intsall npm and node.js
sudo apt-get install nodejs -y
sudo apt-get install npm -y

# Install npm packages

