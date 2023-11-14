#!/bin/sh

# COLORS -----------------------------------------------------------------------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;93m'
BLUE='\033[0;96m'
NOCOLOR='\033[0m'

# https://stackoverflow.com/a/33206814/3123370
colors_func() {
  python3 ~/code/setup/scripts/colors.py
}
alias colors=colors_func

warn_func() {
  echo -e "${YELLOW}$1${NOCOLOR}"
}
alias warn=warn_func

pring_warn_func() {
  printf "${YELLOW}$1${NOCOLOR}"
}
alias pwarn=pring_warn_func

error_func() {
  echo -e "${RED}$1${NOCOLOR}"
}
alias error=error_func

print_error_func() {
  printf "${RED}$1${NOCOLOR}"
}
alias perror=print_error_func

success_func() {
  echo -e "${BLUE}$1${NOCOLOR}"
}
alias success=success_func

print_success_func() {
  printf "${BLUE}$1${NOCOLOR}"
}
alias psuccess=print_success_func
