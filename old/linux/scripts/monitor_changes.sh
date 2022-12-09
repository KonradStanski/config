#!/bin/bash


# This Script watches the current directory for changes
# will run the code in the while loop if something changes

while inotifywait -q -r -e modify ./; do
	pdflatex resume.tex
done
