#!/bin/bash
set -ea

# Dependencies
sudo apt update && sudo apt install -y ripgrep fd-find python3.11-venv

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# NeoVim
set +e

NEOVIM_VERSION=$(curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo /tmp/nvim.appimage "https://github.com/neovim/neovim/releases/download/v${NEOVIM_VERSION}/nvim.appimage"
chmod u+x /tmp/nvim.appimage
/tmp/nvim.appimage

if [ $? -ne 0 ]; then
  mkdir -p /tmp/nvim_extracted
  cd /tmp/nvim_extracted
  /tmp/nvim.appimage --appimage-extract

  sudo mv /tmp/nvim_extracted/squashfs-root/ /
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
  cd -
fi

ln -s $PWD/.nvim/nvim $HOME/.config/nvim

set -e
