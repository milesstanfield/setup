#!/bin/ruby

# usage: ruby ~/code/setup/scripts/restore_settings.rb

require "/home/$USER/code/setup/services/restore_os.rb"
include RestoreOS

RestoreOS.restore_settings!
