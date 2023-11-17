#!/bin/sh

# DEPENDENCIES ----------------------------------------------------
restore_dependencies_func() {
  ruby ~/code/setup/scripts/restore_deps.rb
}
alias restoredependencies=restore_dependencies_func

# SETTINGS ----------------------------------------------------
restore_settings_func() {
  ruby ~/code/setup/scripts/restore_settings.rb
}
alias restoresettings=restore_settings_func
