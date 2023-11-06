#!/bin/sh

ave() {
  aws-vault exec --duration=12h -- $@
}
