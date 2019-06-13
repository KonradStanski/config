#!/bin/bash

# OPTIONAL PACKAGES#####################################################

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


# install jstock
wget https://github.com/yccheok/jstock/releases/download/release_1-0-7-37/jstock-1.0.7.37-bin.zip
sudo unzip jstock-1.0.7.37-bin.zip -d /opt/
sudo chmod +x /opt/jstock/jstock.sh
echo '' >> ~/.bashrc
echo '#jstock path and alias' >> ~/.bashrc
echo 'export PATH=$PATH:/opt/jstock' >> ~/.bashrc
echo 'alias jstock="/opt/jstock/jstock.sh &"' >> ~/.bashrc


