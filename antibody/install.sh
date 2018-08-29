#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

main() {
  print_info "Installing Antibody"

  if ! cmd_exists 'antibody'; then
    execute "curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s" \
      "Installing Antibody"
  else
    print_success 'Antibody is already installed'
  fi
}

main "$@"
