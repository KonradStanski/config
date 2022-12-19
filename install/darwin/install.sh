#!/bin/bash
#####################################################
#              PRIMARY BREW PROGRAMS                #
#####################################################

# Check if the user is running the script with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run with root privileges (sudo)"
  exit 1
fi

# Read the file line by line
while read -r line; do
  # Set the text color to green
  tput setaf 2
  # Print the program name with a header
  echo "Installing program: $line"
  # Reset the text color
  tput sgr0

  # Install the program specified in each line, forcing apt-get to stop on errors
  if ! brew install -y -f "$line"; then
    # Set the text color to red
    tput setaf 1
    # Print the error message
    echo "Failed to install program: $line"
    # Reset the text color
    tput sgr0
  fi
done <brew.txt

#####################################################
#                   OTHER PROGRAMS                  #
#####################################################


#####################################################
#                   CHANGE SETTINGS                 #
#####################################################

# Switch default shell to zsh
chsh -s $(which zsh)