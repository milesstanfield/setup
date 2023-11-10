#!/bin/sh

# ALIASES -------------------------------------------------------------------------------------------------------
list_user_aliases_func() {
  alias -p
}
alias aliases=list_user_aliases_func


# BIOS ---------------------------------------------------------------------------------------------------------------
alias boot_bios="sudo systemctl reboot --firmware-setup"


# KEY TRACKING -------------------------------------------------------------------------------------------------------
# interactive mechanism to track which keys the system recognizes was pressed.
# useful if using different types of keyboards to see what the system thinks the keys are
track_key_func() {
  warn "can also run 'sudo showkey'"
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}
alias track_key=track_key_func


# COMMANDS -----------------------------------------------------------------------------------------------------------
cmd_exists_func() {
  # usage: `if cmd_exists mycommand; then`
  if ! type "$1" &> /dev/null; then
    error "command: $1 doesnt exist"
    return 1
  fi;
}
alias cmd_exists=cmd_exists_func


# VARIABLES -----------------------------------------------------------------------------------------------------------
is_variable_empty_func() {
  test -z $1
}
alias isempty=is_variable_empty_func


# FILES / DIRECTORIES --------------------------------------------------------------------------------------------------
# usage `findfile index.hml ~/code`
findfile_func() {
  warn "usage: findfile {PATTERN} {DIR}"
  find $2 -name "*$1*"
}
alias findfile=findfile_func
alias findfiles=findfile_func


# GREP / MATCH / REGEX -------------------------------------------------------------------------------------------------
# bash regex literals https://unix.stackexchange.com/a/530359/590411
alias regex_literals="echo alnum alpha ascii blank cntrl digit graph lower print punct space upper word xdigit"
grep_exclude_func() {
  grep -v $@
}
alias grepexclude=grep_exclude_func


# BASH PROCESSES
pidstatus_func() {
  pid=$(if [ "$1" == "" ]; then echo "$$"; else echo "$1"; fi)
  cat "/proc/$pid/status"
}
alias pidstatus=pidstatus_func
