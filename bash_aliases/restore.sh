#!/bin/sh

# DCONF ----------------------------------------------------
# load saved settings from `~/code/setup/settings/local.dconf`
alias restore_dconf_settings="dconf load -f / < ~/code/setup/settings/local.dconf"

# DEPENDENCIES ----------------------------------------------------
restore_dependencies() {
  # dbus-x11: for using sudo dconf load in load_settings alias
  # vim: for working in git and editing commit messages
  sudo apt-get install dbus-x11 vim
}

# VSCODE ----------------------------------------------------
# note: cant do this until vscode is installed
alias restore_vscode_settings="cp ~/code/setup/settings/vscode/settings.json ~/.config/Code/User/settings.json"
alias restore_vscode_keybindings="cp ~/code/setup/settings/vscode/keybindings.json ~/.config/Code/User/keybindings.json"
