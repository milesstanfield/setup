#!/bin/sh

# DEPENDENCIES ----------------------------------------------------
restore_dependencies() {
  # apt ###################
  sudo apt-get update
  warn "installing utility dependencies ---\n\
    dbus-x11: for using sudo dconf load in load_settings alias \n\
    vim: for working in git and editing commit messages \n\
    libimobiledevice-utils: gives idevicepair cli to pair/access mounted iphones \n\
    ifuse: allows to mount iPhone and access its file system in linux \n\
    dconf-editor: is a GUI for dconf (settings) \n\
    flatpak: package manager
  "
  sudo apt-get install -y \
    dbus-x11 \
    vim \
    libimobiledevice-utils \
    ifuse \
    dconf-editor \
    flatpak

  # flatpak ###################
  warn "adding remote to flathub.org for flatpak repos"
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

  warn "installing bespoke flatpak applications ---\n
    vscode: code editor
    discord: social messaging app
    sticky notes: just what it sounds like
    chrome: internet browser
    flameshot: quick markup editor (like skitch)
    gimp: image editor (like photoshop)
    signal: secure messaging app
  "
  sudo flatpak install flathub -y \
    com.visualstudio.code \
    com.discordapp.Discord \
    com.vixalien.sticky \
    com.google.Chrome \
    org.flameshot.Flameshot \
    org.gimp.GIMP \
    org.signal.Signal

  # snap ###################
  if cmd_exists snap; then
    warn "installing bespoke snap applications ---\n
      1password: password manager
    "
    sudo snap install 1password
  else
    error "cant install snap packages until snap itself is installed"
  fi
}

# DCONF ----------------------------------------------------
# restores: Pop!_OS
# restores: gnome-terminal
# restores: IBus Preferences (fixing ctrl+shift+e VSCode shortcut)
alias restore_dconf_settings="dconf load -f / < ~/code/setup/settings/local.dconf"

# VSCODE ----------------------------------------------------
restore_vscode() {
  if cmd_exists code; then # ensure vscode is installed
    warn "restoring settings.json ..."
    cp ~/code/setup/settings/vscode/settings.json ~/.config/Code/User/settings.json
    warn "restoring keybindings.json ..."
    cp ~/code/setup/settings/vscode/keybindings.json ~/.config/Code/User/keybindings.json
    warn "restoring extensions ..."
    ruby ~/code/setup/scripts/restore-vscode-extensions.rb
    warn ""
  else
    error "cant restore vscode until it is installed. Install from Pop!_Shop"
  fi
}

# apt list --installed

# dpkg --get-selections | grep -v deinstall

# apt-mark showmanual

# (zcat $(ls -tr /var/log/apt/history.log*.gz); cat /var/log/apt/history.log) 2>/dev/null |
#   egrep '^(Start-Date:|Commandline:)' |
#   grep -v aptdaemon |
#   egrep '^Commandline:'

# flatpak list

# snap list
