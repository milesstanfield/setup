#!/bin/sh

# KEY TRACKING ------------------------------------------------------------
# interactive mechanism to track which keys the system recognizes was pressed.
# useful if using different types of keyboards to see what the system thinks the keys are
track_key_fun() {
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}
alias track_key=track_key_fun

# SETTINGS / BACKUP  ----------------------------------------------------
# save all current config settings to `~/code/setup/saved_settings.dconf`
alias backup_settings="dconf dump / > ~/code/setup/saved_settings.dconf"
# load saved settings from `~/code/setup/saved_settings.dconf`
alias load_settings="dconf load -f / < ~/code/setup/saved_settings.dconf"

install_system_dependencies() {
  sudo apt-get install \
    dbus-x11 # for using sudo dconf load in load_settings alias
  remove_sudo_as_admin # remove the ~/.sudo_as_admin_successful file we just created
}

# CLAMAV -----------------------------------------------------------------
# clamd is the virus scanner engine.
# clamdscan submits files to it for scanning
# clamav-milter submits email for scanning.
# freshclam updates the virus database and notifies clam
alias startfreshclam="sudo freshclam && remove_sudo_as_admin"
alias stopfreshclam="sudo systemctl stop clamav-freshclam.service && remove_sudo_as_admin"
alias startclamd="sudo clamd && remove_sudo_as_admin"
alias stopclamd="sudo systemctl stop clamav-daemon.service && remove_sudo_as_admin"
# Use clamdscan with the --fdpass option so that the "clamav" user doesn't
# need to be able to read amavis's private working directory.
# config file located ~/freshclam.conf
freshclamscan() {
  warn "note: this was run without sudo. if you need to scan files only root has"
  warn "access to, you will need to prepend sudo. example: 'sudo clamdscan --fdpass /usr'"
  clamdscan --fdpass /
}

# FILES / DIRECTORIES  ----------------------------------------------------
# usage `findfile index.hml ~/code`
findfile() {
  warn "usage: findfile {PATTERN} {DIR}"
  find $2 -name "*$1*"
}
alias findfiles=findfile
