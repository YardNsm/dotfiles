# vim: set foldmethod=marker foldlevel=0:

# ---[ Prompt setup ]-------------------------------------------------------------------------------

# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f $ZDOTDIR/.p10k.zsh ]] \
  || source $ZDOTDIR/.p10k.zsh

source $ZDOTDIR/.zinit/plugins/romkatv---powerlevel10k/powerlevel10k.zsh-theme

# ---[ Base ]---------------------------------------------------------------------------------------

# Setting fpath
fpath=(
  $ZDOTDIR/completions
  $ZDOTDIR/functions
  $fpath
)

# Zinit setup {{{

# Configuration
declare -A ZINIT

ZINIT[BIN_DIR]=$ZDOTDIR/.zinit/bin
ZINIT[HOME_DIR]=$ZDOTDIR/.zinit

# Sourcing
source ${ZINIT[BIN_DIR]}/zinit.zsh

# Pluginz
zinit light rupa/z
zinit light zsh-users/zsh-completions

# Only clone, do not source
# Sourcing of the prompt happens on top
zinit ice depth=1 pick=" "; zinit light romkatv/powerlevel10k

# Plugins to use when *not* inside an ssh session
if [[ -z $SSH_CONNECTION ]]; then
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light zsh-users/zsh-autosuggestions
fi

# }}}
# Autoloading {{{

# Load colors and setup promptinit
autoload -U colors && colors
autoload -U promptinit && promptinit

# Initialize completion
autoload -U compinit \
  && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

autoload -U edit-command-line

# }}}

# ---[ Program-specific setups ]--------------------------------------------------------------------

# pywal {{{

if [[ -d "$PYWAL_HOME" ]]; then
  (cat "$PYWAL_HOME/sequences" &)
fi

# }}}
# fnm {{{

eval "$(fnm env --multi --fnm-dir "$FNM_DIR")"

_fnm_autoload_hook() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    echo "fnm: Found .nvmrc"
    fnm use
  fi
}

add-zsh-hook chpwd _fnm_autoload_hook \
  && _fnm_autoload_hook

# }}}
# fzf {{{

# Autocompletion
[[ $- == *i* ]] \
  && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
[[ -f "/usr/local/opt/fzf/shell/key-bindings.zsh" ]] && \
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# }}}
# tmux {{{

# Change window name to the current git dir
_tmux_update_window_name() {
  [[ -z $TMUX ]] && return;

  if git rev-parse 2> /dev/null; then
    tmux rename-window "$(basename `git rev-parse --show-toplevel`)"
  else
    tmux setw automatic-rename
  fi
}

add-zsh-hook chpwd _tmux_update_window_name \
  && _tmux_update_window_name

# }}}

# ---[ Misc ]---------------------------------------------------------------------------------------

# Lazy load commands {{{

# Lazy load phpbrew
if command -v "phpbrew" &> /dev/null; then
  function phpbrew() {
    unset phpbrew

    source $PHPBREW_HOME/bashrc
    phpbrew $@
  }
fi

# Lazy load pyenv
if command -v "pyenv" &> /dev/null; then
  function pyenv() {
    unset pyenv

    eval "$(command pyenv init -)"
    pyenv $@
  }
fi

# Lazy load rbenv
if command -v "rbenv" &> /dev/null; then
  function rbenv() {
    unset rbenv

    eval "$(command rbenv init -)"
    rbenv $@
  }
fi

# }}}

# Sourcing
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/config.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/syntax.zsh
