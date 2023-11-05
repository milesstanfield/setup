#!/bin/sh

# DCONF ----------------------------------------------------
# save all current config settings to `~/code/setup/settings/local.dconf`
alias backup_settings="dconf dump / > ~/code/setup/settings/local.dconf"
