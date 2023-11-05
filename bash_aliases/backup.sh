#!/bin/sh

# DCONF ----------------------------------------------------
# save all current system dconf settings
alias backup_settings="dconf dump / > ~/code/setup/settings/local.dconf"

# VSCODE ----------------------------------------------------
alias backup_vscode_settings="cp ~/.config/Code/User/settings.json ~/code/setup/settings/vscode/settings.json"
alias backup_vscode_keybindings="cp ~/.config/Code/User/keybindings.json ~/code/setup/settings/vscode/keybindings.json"
