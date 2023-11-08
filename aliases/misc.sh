#!/bin/sh

# ALIASES -------------------------------------------------------------------------------------------------------
list_user_aliases_func() {
  alias -p
}
alias aliases=list_user_aliases_func


# BIOS -------------------------------------------------------------------------------------------------------
alias boot_bios="sudo systemctl reboot --firmware-setup"

# KEY TRACKING -------------------------------------------------------------------------------------------------------
# interactive mechanism to track which keys the system recognizes was pressed.
# useful if using different types of keyboards to see what the system thinks the keys are
track_key_func() {
  warn "can also run 'sudo showkey'"
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}
alias track_key=track_key_func


# CLAMAV ------------------------------------------------------------------------------------------------------------
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


# COMMANDS -----------------------------------------------------------------------------------------------
cmd_exists_func() {
  # usage: `if cmd_exists mycommand; then`
  if ! type "$1" &> /dev/null; then
    error "command: $1 doesnt exist"
    return 1
  fi;
}
alias cmd_exists=cmd_exists_func


# VARIABLES -----------------------------------------------------------------------------------------------
is_variable_empty_func() {
  test -z $1
}
alias isempty=is_variable_empty_func


# FILES / DIRECTORIES --------------------------------------------------------------------------------------
# usage `findfile index.hml ~/code`
findfile_func() {
  warn "usage: findfile {PATTERN} {DIR}"
  find $2 -name "*$1*"
}
alias findfile=findfile_func
alias findfiles=findfile_func


# GREP / MATCH / REGEX -------------------------------------------------------------------------------------
# bash regex literals https://unix.stackexchange.com/a/530359/590411
alias regex_literals="echo alnum alpha ascii blank cntrl digit graph lower print punct space upper word xdigit"
grep_exclude_func() {
  grep -v $@
}
alias grepexclude=grep_exclude_func


# FILE / FOLDER PERMISSIONS ----------------------------------------------------------------------------------------------
can_write_file_or_dir_func() {
  test -e $1 || error "No such file or directory: $1"
  test -e $1 && test -w $1
}
alias can_write=can_write_file_or_dir_func

can_read_file_or_dir_func() {
  test -e $1 || error "No such file or directory: $1"
  test -e $1 && test -r $1
}
alias can_read=can_read_file_or_dir_func

can_execute_file_func() {
  test -e $1 || error "No such file or directory: $1"
  test -e $1 && test -x $1
}
alias can_execute=can_execute_file_func

current_user_does_own_file_or_dir_func() {
  current_user=$(stat -c '%U' $1)
  if ! [ "$current_user" == "$(whoami)" ]; then
    return 1
  fi
}
alias do_own=current_user_does_own_file_or_dir_func


# DEBUGGING ALIASES -----------------------------------------------------------------------------------------
yes_or_no_func() {
  # usage: yesorno can_write ~/
  # usage: yesorno can_read_file_or_dir_func ~/
  # echos: "yes" or "no" depending on 1 or 0 code returned
  user_alias=$(alias -p | grep "alias $1=") # "alias can_read='can_read_file_or_dir_func'"
  if [ -z "$user_alias" ]; then
    $@ && echo "yes" || echo "no"
  else # is user alias
    [[ $user_alias =~ \ *?alias\ .*=\'(.*)\' ]] && \
      user_alias_func_name=$(echo "${BASH_REMATCH[1]}")
    shift # remove first arg
    # $user_alias_func_name="can_read_file_or_dir_func"
    $user_alias_func_name $@ && echo "yes" || echo "no"
  fi
}
alias yesorno=yes_or_no_func
