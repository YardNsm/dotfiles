#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

declare -r pips=(
  'yapf'
  'flake8'
  'jedi'
  'neovim'
  'pypcap'
  'python-language-server[all]'

  'virtualenv'
  'pew'
  'pipenv'

  'scapy'
  'pyx'
)

# ---------------------------------------------

main() {
  print_info "Installing pips"

  for pip in "${pips[@]}"; do
    pip_install "$pip"
  done
}

main "$@"
