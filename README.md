# Fabys Dotfiles

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
