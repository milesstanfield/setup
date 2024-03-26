#!/bin/sh

alias ave="aws-vault exec --duration=12h -- $@"
alias s3="aws-vault login cr-stage-admin"
