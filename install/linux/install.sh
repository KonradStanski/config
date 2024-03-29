#!/bin/bash
#####################################################
#              PRIMARY APT PROGRAMS                 #
#####################################################

# Check if the user is running the script with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run with root privileges (sudo)"
  exit 1
fi

# update apt-get
sudo apt-get update

# install PPA's
sudo add-apt-repository ppa:jgmath2000/et -y

# Read the file line by line
while read -r line; do
  # Set the text color to green
  tput setaf 2
  # Print the program name with a header
  echo "Installing program: $line"
  # Reset the text color
  tput sgr0

  # Install the program specified in each line, forcing apt-get to stop on errors
  if ! apt-get install -y -f "$line"; then
    # Set the text color to red
    tput setaf 1
    # Print the error message
    echo "Failed to install program: $line"
    # Reset the text color
    tput sgr0
  fi
done <apt.txt

#####################################################
#                   OTHER PROGRAMS                  #
#####################################################

# Install node version manager volta
curl https://get.volta.sh | bash

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Install command line prompt
sudo snap install starship
sudo snap install --beta nvim --classic

#####################################################
#                   CHANGE SETTINGS                 #
#####################################################

# Switch default shell to zsh
chsh -s $(which zsh)
