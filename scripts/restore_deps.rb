#!/bin/ruby

# usage: ruby ~/code/setup/scripts/restore_deps.rb

require "/home/#{%x(printf $USER)}/code/setup/services/restore_os.rb"
include RestoreOS

RestoreOS.restore_dependencies!
