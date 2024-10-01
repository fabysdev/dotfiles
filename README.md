# Fabys Dotfiles

## Font

https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip

## Terminal

```bash
vim ~/.bashrc
```

```
ssh_pid=$(pidof ssh-agent)
if [ "$ssh_pid" = "" ]; then
  ssh_env="$(ssh-agent -s)"
  echo "$ssh_env" | head -n 2 | tee ~/.ssh_agent_env > /dev/null
fi
if [ -f ~/.ssh_agent_env ]; then
  eval "$(cat ~/.ssh_agent_env)"
fi

ssh-add $HOME/.ssh/id_rsa
```

## Devpod

```bash
devpod context set-options -o EXIT_AFTER_TIMEOUT=false
devpod context set-options -o TELEMETRY=false
```

## OpenVSCode

```bash
devpod up <URL> --ide openvscode --gpg-agent-forwarding --dotfiles https://github.com/fabysdev/dotfiles # --ide-option="BIND_ADDRESS=0.0.0.0:8080" --recreate

# Run command: "FabysSettingsLoader: Load Settings"
```

## NeoVim

```bash
devpod up <URL> --ide none --gpg-agent-forwarding --dotfiles https://github.com/fabysdev/dotfiles # --recreate

devpod ssh <name>

tmux -u
# install tmux plugins (C-b)+(I)
~/.tmux/plugins/tpm/bin/install_plugins

```
