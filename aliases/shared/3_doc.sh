#!/bin/sh

doc_help_func() {
  if varempty "$*"; then return 0; fi
  help_options="help -h --help"

  for arg in "$@"; do
    for option in $help_options; do
      if [ "$arg" = "$option" ]; then
        return 0
      fi
    done
  done
  return 1
}

doc_usage_func() {
  # --------------------------------------   |  --------------------------------------
  # turn this ----------------------------   |  into this ----------------------------
  # --------------------------------------   |  --------------------------------------
  #                                          |
  # doc usage "foo <command>"\               |  Usage: foo <command> [<options>...]
  #   "commands"\                            |
  #     "bar --- does some baR thing"\       |  Valid commands:
  #     "baz --- does some baZ thing"        |      bar                   miles terminal [<options>...]
  #                                          |      baz                   miles dock [<options>...]
  # --------------------------------------   |
  # --------------------------------------   |  Valid options:
  # --------------------------------------   |      help, -h, --help      display help info and exit
  #                                          |
  #                                          |  Exit Status:
  #                                          |  Returns 0 unless an invalid input is given or the
  #                                          |  executed command fails
  #                                          |
  #                                          |  --------------------------------------
  #                                          |  --------------------------------------
  #                                          |  --------------------------------------
  options="[<options>...]"
  splitter=" --- "
  spacer="\t\t\t"
  str="Usage: $1 $options\n" # "Usage: foo <command> [<options>...]"
  shift 1 # remove first ARGV so $1 is now what $2 was

  for arg in "$@"; do # "commands" "bar --- does some baR thing"
    if [[ "$arg" =~ "\$\$\$" ]]; then
      str="${str}    ${arg/"\$\$\$"/${splitter}}\n"
    elif [[ "$arg" =~ "$splitter" ]]; then
      str="${str}    ${arg/${splitter}/${spacer}}"
      if [[ ! "$str" =~ "Valid options" ]]; then
         str="${str} ${options}"
      fi
      str="${str}\n"
    elif [[ "$arg" =~ " " ]]; then
      str="${str}    ${arg}\n"
    elif [[ "$arg" =~ "description" ]]; then
      str="${str}\n$arg:\n"
    else
      str="${str}\nValid $arg:\n"
    fi
  done

  if [[ ! "$str" =~ "Valid options" ]]; then
    str="${str}\nValid options:\n"
  fi

  str="${str}    help, -h, --help\t\tdisplay help info and exit\n"
  str="${str}\nExit Status:\n"
  str="${str}Returns 0 unless an invalid input is given or the\n"
  str="${str}executed command fails"

  echo -e "$str"
}

doc_func() {
  if varempty "$1" || \
    [[ "$1" == "--help" || "$1" == "-h" ]] || \
    [[ "$1" != "help" && "$1" != "usage" ]]; then
    doc_usage_func "doc <command>"\
      "commands"\
        "usage --- display usage for this api"\
        "help --- given $@ args, return 0 or 1 if help args are present"\
      "examples"\
        "doc help \$@ && doc usage \"foo <commands>\"\ \n      \"commands\"\ \n         \"cmd1 \$\$\$ lorem ipsum\""
  else
    command=$1 # "help" in "doc help $@"
    shift
    "doc_${command}_func" "$@" # doc_usage $@
  fi
}
alias doc=doc_func
