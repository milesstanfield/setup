#!/bin/sh

# DEPENDENCIES ----------------------------------------------------
restore_dependencies_func() {
  ruby ~/code/setup/scripts/restore_deps.rb
}
alias restore_dependencies=restore_dependencies_func

# SETTINGS ----------------------------------------------------
restore_settings_func() {
  ruby ~/code/setup/scripts/restore_settings.rb
}
alias restore_settings=restore_settings_func

# EVERYTHING ----------------------------------------------------
restore_os_func() {
  ruby ~/code/setup/scripts/restore_os.rb
}
alias restore_os=restore_os_func
