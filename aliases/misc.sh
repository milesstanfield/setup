#!/bin/sh

alias aliases="alias -p"
alias boot_bios="sudo systemctl reboot --firmware-setup"
alias pidstatus="warn $$ && cat /proc/$$/status"
# todo curl how-to

finme() {
  cargo run "$@"
}
