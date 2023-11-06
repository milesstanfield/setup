#!/bin/ruby

# usage: ruby ~/code/setup/scripts/backup_settings.rb

require "/home/milesstanfield/code/setup/services/backup_os.rb"
include BackupOS

BackupOS.backup_settings!
