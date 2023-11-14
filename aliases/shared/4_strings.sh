#!/bin/sh

remove_surrounding_regex_slashes_or_not_func() {
  if [[ "$1" =~ ^/ ]]; then
    echo "$1" | sed -r "s/^\///g" | sed -r "s/\/$//g" # remove prepended and appended `/`
  else
    echo "$1"
  fi
}

replace_func() {
  doc help $@ && doc usage "replace <str> <replace> [<replacement>]"\
    "examples"\
      "replace \"foo bar\" \" \" \"_\" => \"foo_bar\""\
      "replace \"  foo  bar\" \"/^\s+/\"  => \"foo  bar\""\
      "replace \"foo_bar baz\" \"/([a-z]+)_([a-z]+)\s/\" \"\1%\" => \"foo%baz\""\
      && return

  replace=$(remove_surrounding_regex_slashes_or_not_func "$2")
  replacement=$3
  group=$4
  echo -e "$1" | perl -pe "s/${replace}/${replacement}/g"
}

squish_func() {
  doc help $@ && doc usage "squish <str>" \
    "description"\
      "removes all new line chars, leading spaces, trailing spaces, and converts inner multi spaces to a single"\
    && return

  str="$1"
  str=$(printf "$str" | tr -d '\n') # remove all new line chars
  str=$(replace_func "$str" "/^(\s+)(.*)(\s+)$/" "\2") # leading and trailing whitespace
  echo $str
}

starts_with_func() {
  doc help $@ && doc usage "startswith <str> <substring>" && return
  [[ "$1" =~ ^$2 ]]
}

matches_func() {
  doc help $@ && doc usage "matches <str> <regex>" && return
  match=$(remove_surrounding_regex_slashes_or_not_func "$2")
  [[ "$1" =~ $match ]]
}

includes_func() {
  doc help $@ && doc usage "includes <str> <match>" && return
  matches_func "$1" "$2"
}

excludes_func() {
  doc help $@ && doc usage "excludes <str> <match>" && return
  ! includes_func "$1" "$2"
}

split_func() {
  doc help $@ && doc usage "split <str> <substring>" && return
  # todo this appears to support regex?
  # todo change to -P for perl ?
  echo "$1" | sed -r "s/${2}/\n/g"
}

chomp_func() {
  doc help $@ && doc usage "squish <str>" \
    "description"\
      "removes trailing new line characters"\
    && return
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
