#!/bin/sh

# interactive mechanism to track which keys the system recognizes was pressed.
# useful if using different types of keyboards to see what the system thinks the keys are
track_key_fun() {
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}
alias track_key=track_key_fun

# ClamAV -----------------------------------------------------------------
# clamd is the virus scanner engine.
# clamdscan submits files to it for scanning
# clamav-milter submits email for scanning.
# freshclam updates the virus database and notifies clam
alias startfreshclam="freshclam"
alias stopfreshclam="systemctl stop clamav-freshclam.service"
alias startclamd="clamd"
alias stopclamd="systemctl stop clamav-daemon.service"
# Use clamdscan with the --fdpass option so that the "clamav" user doesn't
# need to be able to read amavis's private working directory.
# config file located ~/freshclam.conf
alias freshclamscan="clamdscan --fdpass /"

# usage `findfile index.hml ~/code`
findfile() {
  find $2 -name "*$1*"
}
alias findfiles=findfile

# save all current config settings to `~/code/setup/saved_settings.dconf`
alias backup_settings="dconf dump / > ~/code/setup/saved_settings.dconf"
# load saved settings from `~/code/setup/saved_settings.dconf`
alias load_settings="dconf load -f / < ~/code/setup/saved_settings.dconf"
