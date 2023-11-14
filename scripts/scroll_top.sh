#!/bin/sh

# https://manpages.ubuntu.com/manpages/focal/man1/xdotool.1.html
# usage: bash ~/code/setup/scripts/terminal_scroll_top.sh

win_id=$(xdotool getactivewindow)
win_name=$(xdotool getwindowfocus getwindowname)
xdotool windowfocus $win_id

if [[ "$win_name" =~ "milesstanfield@pop-os:" ]]; then
  incr=$((incr+1))
  max=100

  while (($incr < $max)); do
    xdotool key --delay 0 --window $win_id Shift+Page_Up
    ((incr+=1))
  done
elif [[ "$win_name" =~ "Google Chrome" ]]; then
  sleep 0.06
  # todo not working
  xdotool key Home # fn+LeftArrow
else # vscode and anything else
  sleep 0.06
  xdotool key ctrl+Shift+Alt+Up
fi
