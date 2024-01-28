#!/bin/bash

#####################################################
#             KONRAD'S BOOTSRAP SCRIPT              #
#####################################################
# This Script should be idempotent, meaning it can be run multiple times without causing problems

install_linux() {
   # commands to install software on Linux go here
   echo "Bootstrapping linux config"
   # install applications
   cd install/linux
   chmod +x ./install.sh
   ./install.sh
   # stow config files
   cd ../../stow
   make stow
}

install_macos() {
   # commands to install software on macOS go here
   echo "Bootstrapping macos config"
   # install applications
   cd install/darwin
   chmod +x ./install.sh
   sudo -u $SUDO_USER ./install.sh
   # stow config files
   cd ../../stow
   make stow
}

check_sudo() {
   # Check if the user is running the script with root privileges
   if [[ $EUID -ne 0 ]]; then
     echo "This script must be run with root privileges (sudo)"
     exit 
   fi
}

check_sudo
if [ "$(uname)" == "Darwin" ]; then
   install_macos
elif [ "$(uname)" == "Linux" ]; then
   install_linux
else
   # not macOS or Linux
   echo "Error: this script only works on macOS and Linux"
   exit 1
fi
