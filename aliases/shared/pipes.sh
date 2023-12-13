#!/bin/sh

binme_grepx_func() {
  while read -r str; do
    binme grepx "$str" "$1"
  done
}
alias grepx=binme_grepx_func

grep_out_func() {
  grep -v $@
}
alias grepout=grep_out_func
