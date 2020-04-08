# Homebrew env stuff
if [[ -n $IS_MACOS ]]; then

  # Homebrew path
  export PATH=/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:$PATH

  # Cask installs dir
  export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
fi