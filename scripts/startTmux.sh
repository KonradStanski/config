#!/bin/sh
# Make first window
cd ~/dev/qbo-homepage-ui


tmux new-session -d
# make split
cd ~/dev/qbo-homepage-widgets-ui
tmux send-keys "grunt devServer"
tmux rename-window Serve
tmux split-window -h
tmux send-keys "yarn serve --remote --port=34213"

# make homepage
cd ~/dev/qbo-homepage-ui
tmux new-window
tmux rename-window Homepage

# make widgets
cd ~/dev/qbo-homepage-widgets-ui
tmux new-window
tmux rename-window Widgets

# Make test
cd ~
tmux new-window
tmux rename-window Home

# go to first window
tmux next-window

tmux -2 attach-session -d
