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
