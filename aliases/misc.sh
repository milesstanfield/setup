#!/bin/sh

alias aliases="alias -p"
alias boot_bios="sudo systemctl reboot --firmware-setup"
alias pidstatus="warn $$ && cat /proc/$$/status"
# todo curl how-to

find_file_func() {
  # todo move this to shared alias/function everyone can use
  if [[ "$@" =~ "-h" || "$@" =~ "help" ]]; then
    warn "\
Usage: findfile <dir> <pattern> [<options>...]\n\

Options:
    --shallow           applies -maxdepth=1 option"
  else
    # todo convert --shallow to -maxdepth=1
    find $1 -type f -name "*$2*"
  fi
}
alias findfile=find_file_func
alias findfiles=find_file_func

find_directory_func() {
  warn "usage: finddir {DIR} {PATTERN}"
  # todo document and add --shallow option
  find $1 -type d -name "*$2*"
}
alias finddir=find_directory_func
