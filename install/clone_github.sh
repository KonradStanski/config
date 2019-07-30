#!/bin/bash


declare -a array=("config" "resume" "Konradstaniszewski.github.io")

for i in "${array[@]}"
do
	git clone https://github.com/konradstanski/"$i".git ~/code/"$i"
done