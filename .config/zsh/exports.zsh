#!/bin/zsh

HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="wezterm"
unset BROWSER
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.docker/bin":$PATH
export PATH="$HOME/.antigravity/antigravity/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export GOPATH=$HOME/.local/share/go
export PATH=$HOME/.local/share/fnm:$PATH
export PATH=$HOME/.config/emacs/bin:$PATH
export PATH="$HOME/.local/share/neovim/bin":$PATH
export PATH="$HOME/development/flutter/bin":$PATH
export SPARK_HOME="/opt/apache-spark"
export GEMINI_API_KEY="your_api_key_here"

if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi



# if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
#   # ~/.local/bin/wayland-start.sh
# fi
