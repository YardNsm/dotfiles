#!/bin/bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Homebrew
# --------------------------------------------- #
print_info "Updating Homebrew"
source $current_dir/scripts/update_homebrew.sh

print_info "Install Homebrew and its taps"
source $current_dir/scripts/install_homebrew.sh

print_info "Install Homebrew dependencies"
source $current_dir/scripts/install_dependencies.sh

print_info "Install applications and fonts"
source $current_dir/scripts/install_applications.sh

print_info "Cleaning up"
source $current_dir/scripts/cleanup.sh
