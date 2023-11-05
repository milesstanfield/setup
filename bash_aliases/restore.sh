#!/bin/sh

# DCONF ----------------------------------------------------
# load saved settings from `~/code/setup/settings/local.dconf`
alias restore_settings="dconf load -f / < ~/code/setup/settings/local.dconf"

# INSTALL DEPENDENCIES ----------------------------------------------------
restore_dependencies() {
  # dbus-x11: for using sudo dconf load in load_settings alias
  # vim: for working in git and editing commit messages
  sudo apt-get install dbus-x11 vim
}
