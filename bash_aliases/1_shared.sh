#!/bin/sh

# COLORS ----------------------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;93m'
BLUE='\033[0;96m'
NOCOLOR='\033[0m'

# https://stackoverflow.com/a/33206814/3123370
alias print_colors="python3 ~/code/setup/scripts/colors.py"

warn() {
  echo -e "${YELLOW}$1${NOCOLOR}"
}

print_warn() {
  printf "${YELLOW}$1${NOCOLOR}"
}

error() {
  echo -e "${RED}$1${NOCOLOR}"
}

print_error() {
  printf "${RED}$1${NOCOLOR}"
}

success() {
  echo -e "${BLUE}$1${NOCOLOR}"
}

print_success() {
  printf "${BLUE}$1${NOCOLOR}"
}


# COMMANDS ----------------------------------------------------
cmd_exists () {
  # usage: `if cmd_exists mycommand; then`
  if ! type "$1" &> /dev/null; then
    error "command: $1 doesnt exist"
    return 1
  fi;
}
