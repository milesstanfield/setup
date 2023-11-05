#!/bin/sh

# DCONF ----------------------------------------------------
# save all current config settings to `~/code/setup/settings/local.dconf`
alias backup_settings="dconf dump / > ~/code/setup/settings/local.dconf"

# VSCODE ----------------------------------------------------
alias backup_vscode_settings="cp ~/.config/Code/User/settings.json ~/code/setup/settings/vscode/settings.json"
alias backup_vscode_keybindings="cp ~/.config/Code/User/keybindings.json ~/code/setup/settings/vscode/keybindings.json"
