#!/bin/ruby

# usage: ruby ~/code/setup/scripts/prompt-for-keyboard-type.rb

puts "Are you using a Mac Keyboard? <y/N>"
input = gets

if input.chomp.match?(/[y|Y]/)
  %x(/usr/bin/sh ~/code/setup/scripts/mac-keyboard.sh)
end
