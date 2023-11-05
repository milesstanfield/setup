#!/bin/sh

# DCONF ----------------------------------------------------
# save all current system dconf settings
alias backup_settings="dconf dump / > ~/code/setup/settings/local.dconf"

# VSCODE ----------------------------------------------------
backup_vscode() {
  warn "backing up settings.json ..."
  cp ~/.config/Code/User/settings.json ~/code/setup/settings/vscode/settings.json
  warn "backing up keybindings.json ..."
  cp ~/.config/Code/User/keybindings.json ~/code/setup/settings/vscode/keybindings.json
  warn "backing up extensions ..."
  echo "$(code --list-extensions)" > ~/code/setup/settings/vscode/extensions.txt
}
