#!/bin/sh

# COLORS ----------------------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;93m'
BLUE='\033[0;96m'
NOCOLOR='\033[0m'

# https://stackoverflow.com/a/33206814/3123370
alias print_colors="python3 ~/code/setup/scripts/colors.py"

warn_func() {
  echo -e "${YELLOW}$1${NOCOLOR}"
}
alias warn=warn_func

print_warn_func() {
  printf "${YELLOW}$1${NOCOLOR}"
}
alias print_warn=print_warn_func

error_func() {
  echo -e "${RED}$1${NOCOLOR}"
}
alias error=error_func

print_error_func() {
  printf "${RED}$1${NOCOLOR}"
}
alias print_error=print_error_func

success_func() {
  echo -e "${BLUE}$1${NOCOLOR}"
}
alias success=success_func

print_success_func() {
  printf "${BLUE}$1${NOCOLOR}"
}
alias print_success=print_success_func

# COMMANDS ----------------------------------------------------
cmd_exists_func() {
  # usage: `if cmd_exists mycommand; then`
  if ! type "$1" &> /dev/null; then
    error "command: $1 doesnt exist"
    return 1
  fi;
}
alias cmd_exists=cmd_exists_func

# FILES / DIRECTORIES -------------------------------------------
# usage `findfile index.hml ~/code`
findfile_func() {
  warn "usage: findfile {PATTERN} {DIR}"
  find $2 -name "*$1*"
}
alias findfile=findfile_func
alias findfiles=findfile_func

# GREP / SEARCH -------------------------------------------------
grep_exclude_func() {
  grep -v $@
}
alias grepexclude=grep_exclude_func

# PERMISSIONS ---------------------------------------------------
can_write_file_or_dir_func() {
  test -w $1
}
alias can_write=can_write_file_or_dir_func

can_read_file_or_dir_func() {
  test -r $1
}
alias can_read=can_read_file_or_dir_func

can_execute_file_func() {
  test -f $1 && test -x $1
}
alias can_execute=can_execute_file_func
