#!/bin/bash
set -ea

# OpenVSCode
if [ -d "$HOME/.openvscode-server" ]; then
  bash $PWD/.openvscode/install.sh
  exit 0
fi

bash $PWD/.nvim/install.sh
bash $PWD/.tmux/install.sh
bash $PWD/.wezterm/install.sh
