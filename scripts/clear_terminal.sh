#!/bin/sh

# https://manpages.ubuntu.com/manpages/focal/man1/xdotool.1.html
# usage: bash ~/code/setup/scripts/clear_terminal.sh

# todo only do this if the active window is for gnome-terminal

win=$(xdotool getactivewindow)
xdotool windowfocus $win
xdotool key ctrl+k # reset
xdotool key ctrl+l # clear
