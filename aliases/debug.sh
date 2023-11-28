#!/bin/sh

alias swallow="$1 &> /dev/null"
alias playground="bash $HOME/code/setup/tmp/playground.sh"
alias setowner="sudo chown $1:$1 $2" # usage: setowner whoami /some-file-or-dir
alias setexecutable="sudo chmod +x $1" # usage: setexecutable /usr/local/bin/miles
alias symlink="echo -e 'usage:\nln -s /path/to/original /path/to/link'"

# notes:
# "$@" is equivalent to "$1" "$2"
# "$*" is equivalent to "$1c$2c..." (where c is the first character of the value of the IFS variable)

yes_or_no_func() {
  # usage: yesorno iown /usr
  # echo's "yes" or "no" depending truthy evaluation of expression given
  user_alias=$(alias -p | grep "alias $1=") # "alias can_read='can_read_file_or_dir_func'"
  if varempty $user_alias; then # is not user alias
    $@ && echo "yes" || echo "no"
  else # is user alias
    [[ $user_alias =~ \ *?alias\ .*=\'(.*)\' ]] && user_alias_func_name=$(echo "${BASH_REMATCH[1]}")
    shift
    $user_alias_func_name $@ && echo "yes" || echo "no"
  fi
}
alias yesorno=yes_or_no_func

start_system_auditing_func() {
  warn "stopping auditd service ..."
  sudo service auditd stop

  log_path="/var/log/audit/audit.log"
  warn "clearing previous log $log_path"
  sudo rm -rf $log_path
  sudo touch $log_path

  warn "starting auditd service ..."
  sudo service auditd start

  warn "setting auditing rule for 'all_changes' ..."
  sudo auditctl -w / -p wa -k all_changes

  success "tailing changes at $log_path ..."
  warn "remember to stop with 'stopauditing'"
  sudo tail -f $log_path
}
alias startauditing=start_system_auditing_func
alias stopauditing="sudo service auditd stop"

# KEY TRACKING -------------------------------------------------------------------------------------------------------
# interactive mechanism to track which keys the system recognizes was pressed.
# useful if using different types of keyboards to see what the system thinks the keys are
track_key_func() {
  warn "can also run 'sudo showkey'"
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}
alias track_key=track_key_func
