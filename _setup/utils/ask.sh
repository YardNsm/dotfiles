#!/usr/bin/env bash

# ---------------------------------------------

# Check if the last reply was yes
answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

# Ask a question
ask() {
  print_question "$1"
  read
}

# Ask a question for confirmation
ask_for_confirmation() {
  print_question "$1 [y/N] "
  read -n 1
}

# Get the last answer
get_answer() {
  printf "$REPLY"
}

# Ask for sudo permission
ask_for_sudo() {
  sudo -v &> /dev/null
}

check_for_sudo() {
  print_info "Checking for sudo permissions"
  ask_for_sudo
  print_result $? "Permission to destroy this machine was granted"
}
