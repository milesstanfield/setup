#!/bin/sh

rebase() {
  git rebase -i HEAD~$1
}

log_fun() {
  git log -$1 --pretty=oneline --abbrev-commit
}

backup_fun() {
    currentbranch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
    b="-backup"
    git checkout -b "$currentbranch$b"
    git checkout $currentbranch
}

push_fun() {
  currentbranch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  git push origin "$currentbranch"
}

pushf_fun() {
  currentbranch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  git push -f origin "$currentbranch"
}

pullRebase_fun() {
  currentbranch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  git pull --rebase origin "$currentbranch"
}

amend_fun() {
  git commit --amend -m "$1"
}

alias diff="git diff"
alias s="git status"
alias b="git branch"
alias clean="git checkout . ; git clean -d -f"
alias aac="git add . && git commit -m 'automated commit message'"
alias stash="git stash save -u"
alias gitignore="git rm -r --cached . && git add ."
alias new='_new() { git checkout -b "$1" }; _new'
alias rebase=rebase_fun
alias l=log_fun
alias backup=backup_fun
alias push=push_fun
alias pushf=pushf_fun
alias prb=pullRebase_fun
alias amend=amend_fun
