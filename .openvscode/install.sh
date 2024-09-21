#!/bin/bash
set -e

echo "install vscode: $PWD/.openvscode"

# install Machine vscode settings
envsubst <"$PWD/.openvscode/Machine/settings.template.json" >"$PWD/.openvscode/Machine/settings.json"

rm -rf $HOME/.openvscode-server/data/Machine
ln -s $PWD/.openvscode/Machine $HOME/.openvscode-server/data/Machine

# install extensions
$HOME/.openvscode-server/bin/openvscode-server --install-extension $PWD/.openvscode/fabys-settings-loader-0.0.3.vsix

$HOME/.openvscode-server/bin/openvscode-server --install-extension GitHub.github-vscode-theme
$HOME/.openvscode-server/bin/openvscode-server --install-extension PKief.material-icon-theme
$HOME/.openvscode-server/bin/openvscode-server --install-extension usernamehw.errorlens
$HOME/.openvscode-server/bin/openvscode-server --install-extension esbenp.prettier-vscode
