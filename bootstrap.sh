#!/bin/bash

install_linux() {
   # commands to install software on Linux go here
   echo "installing linux"
   ./install/linux/install.sh
   ./stow/make stow dir=linux
}

install_macos() {
   # commands to install software on macOS go here
   echo "installing macos"
   ./install/macos/install.sh
   ./stow/make stow dir=macos
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
