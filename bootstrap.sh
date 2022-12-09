#!/bin/bash

#####################################################
#             KONRAD'S BOOTSRAP SCRIPT              #
#####################################################
# This Script should be idempotent, meaning it can be run multiple times without causing problems

# Check if the user is running the script with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run with root privileges (sudo)"
  exit 1
fi

install_linux() {
   # commands to install software on Linux go here
   echo "Bootstrapping linux config"
   cd install/linux
   ./install.sh
   cd ../../stow
   make stow dir=linux
}

install_macos() {
   # commands to install software on macOS go here
   echo "Bootstrapping macos config"
   cd install/macos
   ./install.sh
   cd ../../stow
   make -f stow/make stow dir=macos
}

if [ "$(uname)" == "Darwin" ]; then
   install_macos
elif [ "$(uname)" == "Linux" ]; then
   install_linux
else
   # not macOS or Linux
   echo "Error: this script only works on macOS and Linux"
   exit 1
fi
