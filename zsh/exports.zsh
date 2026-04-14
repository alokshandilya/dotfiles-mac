#!/usr/bin/env zsh

HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="wezterm"
export BROWSER="firefox"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH

case "$(uname -s)" in
  Darwin)
    export PATH="/usr/local/bin":$PATH
    eval "$(fnm env --use-on-cd)"
    eval "$(zoxide init zsh)"
    ;;
  Linux)
    export PATH="$HOME/.local/share/fnm":$PATH
    export PATH="$HOME/.local/share/neovim/bin":$PATH
    export PATH="$HOME/development/flutter/bin":$PATH
    eval "$(fnm env)"
    eval "$(zoxide init zsh)"
    ;;
esac
