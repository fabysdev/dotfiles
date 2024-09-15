#!/bin/bash
set -ea

sudo apt install tmux -y

ln -s $PWD/.tmux/.tmux.conf $HOME/.tmux.conf
