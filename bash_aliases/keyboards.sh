#!/bin/sh

alias reset_keys="setxkbmap -layout us"
alias mac="reset_keys && xmodmap ~/code/setup/xmodmaps/super_L_as_ctrl_L.Xmodmap"
# ----NOW
# FN
# Control_L
# Alt_L
# Control_L

win() {
  reset_keys
  xmodmap ~/code/setup/xmodmaps/switch_alt_L_and_super_L.Xmodmap
  xmodmap ~/code/setup/xmodmaps/super_L_as_ctrl_L.Xmodmap
}
# ----NOW
# Control_L
# FN
# Alt_L
# Control_L
