#!/bin/sh

# MAC KEYBOARD ------------------------------------------------------------
alias reset_keys="setxkbmap -layout us"
alias mac="reset_keys && xmodmap ~/code/setup/xmodmaps/super_L_as_ctrl_L.Xmodmap"
# ----WAS           ----NOW
# FN                FN
# Control_L         Control_L
# Alt_L             Alt_L
# Super_L           Control_L

# WINDOWS KEYBOARD ------------------------------------------------------------
windows_keyboard_func() {
  reset_keys
  xmodmap ~/code/setup/xmodmaps/switch_alt_L_and_super_L.Xmodmap
  xmodmap ~/code/setup/xmodmaps/super_L_as_ctrl_L.Xmodmap
}
alias win=windows_keyboard_func
# ----WAS           -----NOW
# FN                Control_L
# Control_L         FN
# Super_L           Alt_L
# Alt_L             Control_L
