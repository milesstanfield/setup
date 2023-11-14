#!/bin/sh

grep_out_func() {
  doc help $@ && \
    doc usage "<str> | grepout <without>" && return
  grep -v $@
}
alias grepout=grep_out_func

pipe_replace_func() {
  doc help $@ && \
    doc usage "<str> | preplace <replace> [<replacement>]" && return

  while read -r str; do
    replace_func "$str" "$1" "$2"
  done
}
alias preplace=pipe_replace_func

pipe_chomp_func() {
  while read -r str; do
    chomp "$str"
  done
}
alias pchomp=pipe_chomp_func

pipe_squish_func() {
  while read -r str; do
    squish "$str"
  done
}
alias psquish=pipe_squish_func
