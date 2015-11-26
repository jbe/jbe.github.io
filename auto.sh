#!/bin/sh
tmux new-window -d -n jbe-build "filewatcher ** ./gen"
tmux new-window -d -n jbe-serve "serve ."
