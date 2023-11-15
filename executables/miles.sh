#!/bin/bash

# usage: miles terminal --clear

# uncomment and add the following lines to your ~/.bashrc after custom aliases are sourced
# if type cmdexists &> /dev/null && ! cmdexists miles ; then
#   error "run the following to install [miles] cli:"
#   error "sudo cp ~/code/setup/executables/miles.sh /usr/local/bin/miles && sudo chmod +x /usr/local/bin/miles"
# fi

red='\033[0;31m'
no_color='\033[0m'
help_commands="help -h --help"
commands="terminal dock"
terminal_options="--clear --scroll-top"
dock_options="--toggle"
exit_code=0

scroll_top_terminal_func() {
  source /home/$USER/code/setup/scripts/terminal_scroll_top.sh
}

clear_terminal_func() {
  source /home/$USER/code/setup/scripts/terminal_clear.sh
}

toggle_dock_func() {
  source /home/$USER/code/setup/scripts/dock_toggle.sh
}

error_func() {
  exit_code=1
  echo -e "${red}$1${no_color}"
}

exit_status_func() {
  echo -e "    Exit Status:"
  echo -e "    Returns 0 unless an invalid input is given or the"
  echo -e "    executed command fails"
  exit $exit_code
}

describe_terminal_func() {
  echo "    terminal              miles terminal [<options>...]"
}

describe_dock_func() {
  echo "    dock                  miles dock [<options>...]"
}

describe_help_func() {
  echo -e "    help, -h, --help      display help info and exit\n"
  exit_status_func
}

describe_scroll_top_terminal_func() {
  echo -e "    --scroll-top          scroll active terminal to top of page"
}

describe_clear_terminal_func() {
  echo -e "    --clear               reset and clear the active terminal"
}

describe_toggle_dock_func() {
  echo -e "    --toggle              toggle visibility of the dock"
}

commands_usage_func() {
  echo -e "Usage: miles <command> [<options>...]\n"
  echo "Valid commands:"
  for command in $commands; do
    "describe_${command}_func"
  done
  describe_help_func
}

clean_option_func() {
  echo $(echo $1 | cut -c3- | tr '-' '_') # remove prepended "--" and convert "-" to "_"
}

terminal_usage_func() {
  echo -e "Usage: miles terminal [<options>...]\n"
  echo "Valid options:"
  for option in $terminal_options; do
    clean_option=$(clean_option_func $option)
    "describe_${clean_option}_terminal_func" # describe_clear_terminal_func
  done
  describe_help_func
}

dock_usage_func() {
  echo -e "Usage: miles dock [<options>...]\n"
  echo "Valid options:"
  for option in $dock_options; do
    clean_option=$(clean_option_func $option)
    "describe_${clean_option}_dock_func" # describe_clear_dock_func
  done
  describe_help_func
}

check_and_execute_help_func() {
  for help_command in $help_commands; do
    for arg in $@; do
      if [[ "$help_command" == "$arg" ]]; then
        commands_usage_func
      fi
    done
  done
}

check_and_execute_valid_commands_func() {
  if ! [ "$3" == "" ]; then
    error_func "'$1 $2 $3' too many args"
    "${1}_usage_func" # terminal_usage_func
  fi

  for command in $commands; do
    if [ "$command" == "$1" ]; then
      handle_valid_command_func $@
    fi
  done
}

check_for_valid_options_func() {
  options=$(eval echo \${$1\_options})
  for option in $options; do
    if [[ "$option" == "$2" ]]; then
      handle_valid_option_func $@
    fi
  done

  error_func "'$2' is not a valid option"
  "${1}_usage_func" # terminal_usage_func
}

handle_valid_option_func() {
  clean_option=$(clean_option_func $2)
  "${clean_option}_${1}_func" # clear_terminal_func
  exit 0
}

handle_valid_command_func() {
  if [ "$2" == "" ]; then
    error_func "missing <option>"
    "${1}_usage_func" # terminal_usage_func
  else
    check_for_valid_options_func $@
  fi
}

main() {
  check_and_execute_help_func $@
  check_and_execute_valid_commands_func $@

  if [ "$1" == "" ]; then
    commands_usage_func
  else
    error_func "'$1' is not a valid command"
    commands_usage_func
  fi
}

main $@
