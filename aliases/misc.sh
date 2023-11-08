#!/bin/sh

# ALIASES ------------------------------------------------------------
alias aliases="alias -p" # list user-defined aliases

# BIOS ------------------------------------------------------------
alias boot_bios="sudo systemctl reboot --firmware-setup"

# KEY TRACKING ------------------------------------------------------------
# interactive mechanism to track which keys the system recognizes was pressed.
# useful if using different types of keyboards to see what the system thinks the keys are
track_key_func() {
  warn "can also run 'sudo showkey'"
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}
alias track_key=track_key_func

# CLAMAV -----------------------------------------------------------------
# clamd is the virus scanner engine.
# clamdscan submits files to it for scanning
# clamav-milter submits email for scanning.
# freshclam updates the virus database and notifies clam
alias start_freshclam="sudo freshclam"
alias stop_freshclam="sudo systemctl stop clamav-freshclam.service"
alias start_clamd="sudo clamd"
alias stop_clamd="sudo systemctl stop clamav-daemon.service"
# Use clamdscan with the --fdpass option so that the "clamav" user doesn't
# need to be able to read amavis's private working directory.
# config file located ~/freshclam.conf
fresh_clamscan_func() {
  warn "note: this was run without sudo. if you need to scan files only root has"
  warn "access to, you will need to prepend sudo. example: 'sudo clamdscan --fdpass /usr'"
  # todo i should save the timestamp of the scan and then create warnings in bashrc script
  # if i havent scanned in a long time
  clamdscan --fdpass /
}
alias fresh_clamscan=fresh_clamscan_func
