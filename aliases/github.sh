#!/bin/sh

rebase_func() {
  git rebase -i HEAD~$1
}
alias rebase=rebase_func

log_func() {
  git log -$1 --pretty=oneline --abbrev-commit
}
alias l=log_func

backup_branch_func() {
  current_branch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  b="-backup"
  git checkout -b "$current_branch$b"
  git checkout $current_branch
}
alias backup=backup_branch_func

push_branch_func() {
  current_branch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  git push origin "$current_branch"
}
alias push=push_branch_func

force_push_branch_func() {
  current_branch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  git push -f origin "$current_branch"
}
alias pushf=force_push_branch_func

pull_rebase_func() {
  current_branch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  git pull --rebase origin "$current_branch"
}
alias prb=pull_rebase_func

amend_last_commit_message_func() {
  git commit --amend -m "$1"
}
alias amend=amend_last_commit_message_func

new_branch_func() {
  git checkout -b "$1"
}
alias new=new_branch_func

alias diff="git diff"
alias s="git status"
alias b="git branch"
alias clean="git checkout . ; git clean -d -f"
alias aac="git add . && git commit -m 'automated commit message'"
alias stash="git stash save -u"
alias gitignore="git rm -r --cached . && git add ."
