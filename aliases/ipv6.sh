#!/bin/sh

alias disableipv6="sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1"
alias enableipv6="sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0 && sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0"

if [[ $(sysctl -a 2>/dev/null | grep disable_ipv6) = *"all.disable_ipv6 = 1"* ]]; then
  yellow="\033[1;93m"
  nocolor="\033[0m"
  msg="reminder: ipv6 is disabled. run 'enableipv6' to enabled it"
  echo -e "${yellow}$msg${nocolor}"
fi
