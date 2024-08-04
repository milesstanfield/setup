#!/bin/bash

squash_func() {
  current_branch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  squash_branch="${current_branch}-squashme"
  git checkout -b "${squash_branch}"
  git checkout "${current_branch}"

  last_commit_msg=$(git log -1 --pretty=%s --skip=$(($1 - 1)))
  reset_to_sha=$(git log -1 --format=format:%H --skip=$1) # sha before the one specified

  echo "reset to sha=${reset_to_sha}"

  git reset --hard "${reset_to_sha}"
  git merge --squash "${squash_branch}"
  git commit -m "${last_commit_msg}"
  git branch -D "${squash_branch}"
}
alias squash=squash_func

rebase_func() {
  git rebase -i HEAD~$1
}
alias rebase=rebase_func

log_func() {
  git log -$1 --oneline
}
alias l=log_func

backup_branch_func() {
  current_branch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  b="-backup"
  git checkout -b "${current_branch}${b}"
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

checkout_main_or_master_func() {
  if grep -q master ".git/config"; then
    git checkout master
  else
    git checkout main
  fi
}
alias m=checkout_main_or_master_func

checkin_func() {
  red='\033[0;31m'
  nocolor='\033[0m'
  branches=()
  index=0
  for full_branch in $(git for-each-ref --format='%(refname)' refs/heads/); do
    branch_name=${full_branch#"refs/heads/"}
    branches+=("$branch_name")
    echo $((index++)). "$branch_name"
  done

  if [[ "$1" = *"del"* ]]; then
    echo -e "${red}delete branch number: ${nocolor}"
  else
    echo "checkout branch number: "
  fi

  read input_number
  branch=${branches[$input_number]}

  re='^[0-9]+$'
  if ! [[ $input_number =~ $re ]]; then
    echo -e "${red}${input_number} is not a number${nocolor}"
  elif [[ "$branch" == "" ]]; then
    echo -e "${red}${input_number} is not a valid branch index${nocolor}"
  elif [[ "$1" = *"del"* ]]; then
    git branch -D $branch
  else
    git checkout $branch
  fi
}
alias c=checkin_func
alias del="checkin_func 'del'"

alias diff="git diff"
alias s="git status"
alias b="git branch"
alias clean="git checkout . ; git clean -d -f"
alias aac="git add . && git commit -m 'automated commit message'"
alias stash="git stash save -u"
alias gitignore="git rm -r --cached . && git add ."
