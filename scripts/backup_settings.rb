#!/bin/ruby

# usage: ruby ~/code/setup/scripts/backup_settings.rb

require "/home/#{%x(printf $USER)}/code/setup/services/backup_os.rb"
include BackupOS

BackupOS.backup_settings!
