#!/bin/ruby

require "open3"
require "/home/milesstanfield/code/setup/services/color.rb"

file_path = "/home/milesstanfield/code/setup/settings/vscode/extensions.txt"
File.readlines(file_path, chomp: true).each do |ext|
  stdout, stdeerr, status = Open3.capture3("code --install-extension #{ext}")

  if status.success?
    Color.success(stdout)
  else
    Color.error(stdeerr)
  end
end
