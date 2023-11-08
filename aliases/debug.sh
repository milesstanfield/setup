#!/bin/sh

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
  warn "remember to stop with 'stop_system_auditing'"
  sudo tail -f $log_path
}
alias start_system_auditing=start_system_auditing_func
alias stop_system_auditing="sudo service auditd stop"
