#!/bin/bash
set -ea

# OpenVSCode
if [ -d "$HOME/.openvscode-server" ]; then
  bash $PWD/.openvscode/install.sh
  exit 0
fi
