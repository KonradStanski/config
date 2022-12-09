#!/bin/bash
#####################################################
#              PRIMARY APT PROGRAMS                 #
#####################################################

# Set the text color to red using tput
tput setaf 1

# Parse the file containing the list of programs to install
while read program; do
  # Install the program using apt
  if ! apt install -y $program; then
    # Print an error message if the installation fails
    echo "Error: Failed to install $program"
  fi
done < apt.txt

# Reset the text color to the default using tput
tput sgr0

#####################################################
#                   OTHER PROGRAMS                  #
#####################################################

# Install node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash


#####################################################
#                   CHANGE SETTINGS                 #
#####################################################

# Switch default shell to zsh
chsh -s $(which zsh)
