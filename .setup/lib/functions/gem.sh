#!/usr/bin/env bash

# ---------------------------------------------

# Install a Gem

gem_list=""

gem::install() {

  package="$1"

  if [[ ${gem_list} = "" ]]; then
    print_status "Fetching installed packages. This could take a while...\\n"
    gem_list=$(gem list)
  fi

  if echo "${gem_list}" | grep -q "${package}"; then
    print_success "$package (already installed)"
  else
    commands::execute "gem install $package" "$package"
  fi
}
