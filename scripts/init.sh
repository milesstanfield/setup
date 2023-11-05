#!/bin/sh

# usage ./home/milesstanfield/setup/scripts/init.sh

ruby ~/code/setup/scripts/prompt-for-keyboard-type.rb

touch /tmp/initted # so we won't run this again
echo "ran ~/code/setup/scripts/init.sh"
