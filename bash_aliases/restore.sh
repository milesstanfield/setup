#!/bin/sh

# DEPENDENCIES ----------------------------------------------------
restore_dependencies() {
  ruby ~/code/setup/scripts/restore_deps.rb
}

# SETTINGS ----------------------------------------------------
restore_settings() {
  ruby ~/code/setup/scripts/restore_settings.rb
}

# EVERYTHING ----------------------------------------------------
restore_os() {
  ruby ~/code/setup/scripts/restore_os.rb
}
