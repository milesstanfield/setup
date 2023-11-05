#!/bin/sh

# DCONF ----------------------------------------------------
# load saved settings from `~/code/setup/settings/local.dconf`
alias restore_dconf_settings="dconf load -f / < ~/code/setup/settings/local.dconf"

# DEPENDENCIES ----------------------------------------------------
restore_dependencies() {
  # dbus-x11: for using sudo dconf load in load_settings alias
  # vim: for working in git and editing commit messages
  # libimobiledevice-utils: gives idevicepair cli to pair/access mounted iphones
  # ifuse: allows to mount iPhone and access its file system in linux
  sudo apt-get install dbus-x11 vim libimobiledevice-utils ifuse

  warn "Install the following apps from the Pop!_Shop"
  warn "  - Visual Studio Code"
}

# VSCODE ----------------------------------------------------
restore_vscode() {
  if cmd_exists code; then # ensure vscode is installed
    warn "restoring settings.json ..."
    cp ~/code/setup/settings/vscode/settings.json ~/.config/Code/User/settings.json
    warn "restoring keybindings.json ..."
    cp ~/code/setup/settings/vscode/keybindings.json ~/.config/Code/User/keybindings.json
    warn "restoring extensions ..."
    ruby ~/code/setup/scripts/restore-vscode-extensions.rb
  else
    error "cant restore vscode until it is installed. Install from Pop!_Shop"
  fi
}
