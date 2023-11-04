#!/bin/sh

# SUDO ----------------------------------------------------
# whenever we use sudo in an alias it creates a .sudo_as_admin_successful file. get rid of it!
alias remove_sudo_as_admin="rm ~/.sudo_as_admin_successful"

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

error() {
  echo -e "${RED}$1${NOCOLOR}"
}

success() {
  echo -e "${BLUE}$1${NOCOLOR}"
}
