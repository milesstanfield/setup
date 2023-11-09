#!/bin/sh

# https://manpages.ubuntu.com/manpages/focal/man1/xdotool.1.html
# https://github.com/jordansissel/xdotool#bring-up-firefox-and-focus-the-url-bar
# usage: bash ~/code/setup/scripts/terminal_clear.sh

# todo only do this if the active window is for gnome-terminal
# xdotool search "Mozilla Firefox" windowactivate --sync key --clearmodifiers ctrl+l

win=$(xdotool getactivewindow)
xdotool windowfocus $win
xdotool key ctrl+k # idk why but this is necessary
xdotool key shift+ctrl+8 # reset (per terminal settings)
xdotool key Return # show prompt
