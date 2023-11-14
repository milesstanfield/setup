#!/bin/sh

# https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html

file_executable_func() {
  test -f $1 && test -x $1
}

path_writable_func() {
  test -w $1
}

path_readable_func() {
  test -r $1
}

variable_is_empty_func() {
  test -z "$1" # quote here was absolutely necessary .. but why? for doc help $@ where multiple args given
}

file_is_present_func() {
  test -f $1 && test -s $1
}

file_exists_func() {
  test -f $1
}

file_is_empty_func() {
  file_exists_func $1 && ! file_is_present_func $1
}

command_exists_func() {
  if ! type "$1" &> /dev/null; then
    return 1
  fi
}

# paths (file or directory)
alias pathexists="test -e $1" # True if file or directory exists.
alias pathsymlinkexists="test -L $1" # True if path exists and is a symbolic link
alias pathreadable=path_readable_func # True if file or directory exists and is readable.
alias pathwritable=path_writable_func # True if file or directory exists and is writable.
alias pathmodified="test -N $1" # True if file exists and has been modified since it was last read.

# directories
alias direxists="test -d $1" # True if path exists and is a directory

# files
alias fileexists=file_exists_func # True if path exists and is a file.
alias filereadable="test -f $1 && test -r $1" # True if path exists, is a file, and is readable.
alias filepresent=file_is_present_func # True if path exists, is a file, and has content
alias fileempty=file_is_empty_func # True if path is an existing file but has no content
alias fileexecutable=file_executable_func # True if path exists, is a file, and is executable.

# variables
alias vardefined="test -v $1" # True if the variable NAME is set with any value (ex: varnameset FOO)
alias varempty=variable_is_empty_func # True if variable isn't set OR it is but its value is empty
alias varpresent="! variable_is_empty_func $1" # True if variable is set and its value is not empty

# commands
alias cmdexists=command_exists_func

# human friendly
alias canwrite=path_writable_func
alias caniwrite=path_writable_func
alias canread=path_readable_func
alias caniread=path_readable_func
alias canexecute=file_executable_func
alias caniexecute=file_executable_func
alias whoowns="stat -c '%U' $1"
alias iown="test -O $1"
