#!/bin/sh

# usage: bash ~/code/setup/scripts/dock_toggle.sh

dock_enabled=$(gnome-extensions info cosmic-dock@system76.com | grep ENABLED)
if [ -z "$dock_enabled" ]; then
  gnome-extensions enable cosmic-dock@system76.com
else
  gnome-extensions disable cosmic-dock@system76.com
fi
