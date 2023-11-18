#!/bin/sh

find_file_func() {
  doc help $@ && doc usage "findfile <dir> <pattern>" \
    "options" \
    "--shallow --- applies -maxdepth=1 option to 'find' function" &&
    return

  if includes "$*" "--shallow"; then
    find $1 -maxdepth 1 -type f -iname "*$2*"
  else
    find $1 -type f -iname "*$2*"
  fi
}

find_directory_func() {
  doc help $@ && doc usage "finddir <dir> <pattern>" \
    "options" \
    "--shallow --- applies -maxdepth=1 option to 'find' function" &&
    return

  if includes "$*" "--shallow"; then
    find $1 -maxdepth 1 -type d -iname "*$2*"
  else
    find $1 -type d -iname "*$2*"
  fi
}

# todo why isnt this working anymore?
find_it_func() {
  doc help $@ && doc usage "findit <dir> <pattern>" \
    "options" \
    "--shallow --- applies -maxdepth=1 option to 'find' function" &&
    return

  if includes "$*" "--shallow"; then
    find $1 -maxdepth 1 -iname "*$2*"
  else
    find $1 -iname "*$2*"
  fi
}

alias findfile=find_file_func
alias findfiles=find_file_func
alias finddir=find_directory_func
alias findfolder=find_directory_func
alias findit=find_it_func
