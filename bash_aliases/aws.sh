#!/bin/sh

function ave() {
  aws-vault exec --duration=12h -- $@
}
