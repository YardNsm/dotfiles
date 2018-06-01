# Core variables
export DOTFILES=$HOME/dotfiles
export DOTFILES_LOCAL=$HOME/dotfiles-local
export ZSH=$DOTFILES/zsh
export SUBMODULES_PATH=$DOTFILES/_submodules

# ---------------------------------------------

# Setting fpath
fpath=($ZSH/functions $fpath)

# ---------------------------------------------

# Initialize completion
autoload -U compinit && compinit

# Load Colors
autoload -U colors && colors
autoload -U promptinit && promptinit

# ---------------------------------------------

# Source all .zsh files within the dotfiles repo
# within one level
for config ($DOTFILES/*/*.zsh-before) source $config
for config ($DOTFILES/*/*.zsh) source $config
for config ($DOTFILES/zsh/prompt/*.zsh) source $config

# Source .zsh files from ~/dotfiles-local
[[ -d "$DOTFILES_LOCAL" ]] \
  && for config ($DOTFILES_LOCAL/**/*.zsh) source $config

# ---------------------------------------------
# Setup base6-shell

# BASE16_SHELL=$SUBMODULES_PATH/base16-shell/

# [[ -n "$PS1" ]] && \
#   [[ -s $BASE16_SHELL/profile_helper.sh ]] && \
#   eval "$($BASE16_SHELL/profile_helper.sh)"