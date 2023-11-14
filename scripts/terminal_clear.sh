#!/bin/sh

# https://manpages.ubuntu.com/manpages/focal/man1/xdotool.1.html
# usage: bash ~/code/setup/scripts/terminal_clear.sh

win_name=$(xdotool getwindowfocus getwindowname)

# only do this if the active window is for gnome-terminal
if [[ "$win_name" =~ "milesstanfield@pop-os:" ]]; then
  sleep 0.06
  xdotool key shift+ctrl+k ctrl+l
fi
