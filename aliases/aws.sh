#!/bin/sh

ave_func() {
  aws-vault exec --duration=12h -- $@
}
alias ave=ave_func
