#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "no arguments"
elif [ "$#" -eq 1 ]; then
  echo "one argument"
  echo $*
  echo $@
else
  echo "too many arguments"
  echo $*
  echo $@
fi
