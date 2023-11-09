#!/bin/sh

# https://manpages.ubuntu.com/manpages/focal/man1/xdotool.1.html
# usage: bash ~/code/setup/scripts/terminal_scroll_top.sh

# todo only do this if the active window is for gnome-terminal
# todo xdotool key End # WORKS (for down)

win=$(xdotool getactivewindow)
xdotool windowfocus $win

incr=$((incr+1))
max=100

while (($incr < $max)); do
  xdotool key --delay 0 --window $win Shift+Page_Up
  ((incr+=1))
done
