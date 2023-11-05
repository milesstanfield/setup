#!/bin/sh

rebase() {
  git rebase -i HEAD~$1
}

log_fun() {
  git log -$1 --pretty=oneline --abbrev-commit
}

backup() {
  currentbranch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  b="-backup"
  git checkout -b "$currentbranch$b"
  git checkout $currentbranch
}

push() {
  currentbranch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  git push origin "$currentbranch"
}

pushf() {
  currentbranch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  git push -f origin "$currentbranch"
}

prb() {
  currentbranch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  git pull --rebase origin "$currentbranch"
}

amend() {
  git commit --amend -m "$1"
}

new() {
  git checkout -b "$1"
}

alias diff="git diff"
alias s="git status"
alias b="git branch"
alias clean="git checkout . ; git clean -d -f"
alias aac="git add . && git commit -m 'automated commit message'"
alias stash="git stash save -u"
alias gitignore="git rm -r --cached . && git add ."
alias l=log_fun # because `l` is already a defined alias in `0_linux.sh` (from linux)
