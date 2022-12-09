#!/bin/bash

install_linux() {
   # commands to install software on Linux go here
   echo "Bootstrapping linux config"
   install/linux/install.sh
   cd stow
   make stow dir=linux
}

install_macos() {
   # commands to install software on macOS go here
   echo "Bootstrapping macos config"
   sudo install/macos/install.sh
   cd stow
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
