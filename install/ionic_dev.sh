#!/bin/bash

# Good summary of steps:
# https://medium.com/@aashimad1/install-android-studio-in-ubuntu-b8aed675849f

# Install android studio
sudo apt install ubuntu-make
umake android --accept-lisence
echo "export PATH=$PATH:$HOME/Documents/android-studio-ide-183.5452501-linux/android-studio/bin/studio.sh" >> ~/.bashrc
echo "alias android-studio='studio.sh'" >> ~/.bashrc


# Install NPM
sudo apt-get install npm

# Install Oracle JAVA jdk 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default

# Install Ionic
sudo npm install -g ionic

# Install cordova
sudo npm install -g cordova

# Install ionic lab
npm i -D -E @ionic/lab

# Install gradle
sudo apt-get install gradle

# Set path Variables
echo "export ANDROID_SDK_ROOT=$HOME/Android/Sdk" >> ~/.bashrc
echo "export ANDROID_HOME=$HOME/Android/Sdk" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_SDK_ROOT/emulator" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools" >> ~/.bashrc

# Source Path Variables
source ~/.bashrc



# Run with:
# ionic cordova emulate android
# ionic cordova emulate android --livereload
# ionic cordova emulate android --

# Emulator
# ionic cordova run android ---list
# ionic cordova emulate android --target="Pixel_2_API_Q_2"



# Run with devapp
# ionic serve --devapp
# ionic serve --devapp --livereload

# Run with lab
# ionic serve --lab
