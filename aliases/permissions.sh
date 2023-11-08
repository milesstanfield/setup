#!/bin/sh

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

who_owns_file_or_dir_func() {
  stat -c '%U' $1
}
alias whoowns=who_owns_file_or_dir_func

current_user_does_own_file_or_dir_func() {
  current_user=$(stat -c '%U' $1)
  if ! [ "$current_user" == "$(whoami)" ]; then
    return 1
  fi
}
alias do_own=current_user_does_own_file_or_dir_func
