#!/bin/sh

remove_surrounding_regex_slashes_or_not_func() {
  if [[ "$1" =~ ^/ ]]; then
    echo "$1" | sed -r "s/^\///g" | sed -r "s/\/$//g" # remove prepended and appended `/`
  else
    echo "$1"
  fi
}

replace_func() {
  replace=$(remove_surrounding_regex_slashes_or_not_func "$2")
  replacement=$3
  group=$4
  echo -e "$1" | perl -pe "s/${replace}/${replacement}/g"
}

squish_func() {
  str="$1"
  str=$(printf "$str" | tr -d '\n')                    # remove all new line chars
  str=$(replace_func "$str" "/^(\s+)(.*)(\s+)$/" "\2") # leading and trailing whitespace
  echo $str
}

starts_with_func() {
  [[ "$1" =~ ^$2 ]]
}

matches_func() {
  match=$(remove_surrounding_regex_slashes_or_not_func "$2")
  [[ "$1" =~ $match ]]
}

includes_func() {
  matches_func "$1" "$2"
}

excludes_func() {
  ! includes_func "$1" "$2"
}

split_func() {
  str=$(remove_surrounding_regex_slashes_or_not_func "$2")
  echo -e "$1" | perl -pe "s/${str}/\n/g"
}

chomp_func() {
  replace_func "$1" "/\n+$/"
}

alias chomp=chomp_func
alias squish=squish_func
alias startswith=starts_with_func
alias split=split_func
alias replace=replace_func
alias includes=includes_func
alias excludes=excludes_func
alias matches=matches_func
