#!/bin/zsh

# history
HISTFILE="$HOME/.zsh_history"

# source
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/exports.zsh"

export PATH="$HOME/.local/bin":$PATH

if command -v bat &> /dev/null; then
  alias cat="bat --theme gruvbox-dark"
  alias catt="bat -pp --theme gruvbox-dark"
fi

# plugins
if command -v brew >/dev/null 2>&1; then
  HOMEBREW_PREFIX="$(brew --prefix)"
fi

# (Plugins moved to the end of .zshrc for better loading performance)

# keybinds

# Enable vim mode
bindkey -v

# Reduce ESC delay for faster mode switching
export KEYTIMEOUT=1

# Change cursor shape based on vi mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'  # Block cursor for normal mode
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'  # Beam cursor for insert mode
  fi
}
zle -N zle-keymap-select

# Initialize with beam cursor
echo -ne '\e[5 q'

bindkey '^ ' autosuggest-accept 2>/dev/null || true

# Optimized compinit with daily cache rebuilding.
# Uses a zsh glob qualifier (portable across macOS/BSD and Linux/GNU) instead of
# `stat`, whose flags differ between the two: rebuild the dump if it's missing or
# older than 24h, otherwise load the cached version with -C.
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]] || [[ ! -e ${ZDOTDIR}/.zcompdump ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"
#
if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi

# starship prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Run fastfetch in terminal emulators that should show a startup summary.
if [[ -o interactive && ( $TERM == "xterm-256color" || $TERM == "xterm-ghostty" || $TERM_PROGRAM == "ghostty" || $TERM_PROGRAM == "Ghostty" ) ]]; then
  if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
  fi
fi

# fzf options
if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Plugins are sourced at the very end so they hook the line editor correctly
# (syntax-highlighting in particular must be sourced last).
# Search both Homebrew (macOS) and distro paths (Arch/CachyOS use
# /usr/share/zsh/plugins, most other distros use /usr/share).
typeset -a _zsh_plugin_dirs
[[ -n "$HOMEBREW_PREFIX" ]] && _zsh_plugin_dirs+=("$HOMEBREW_PREFIX/share")
_zsh_plugin_dirs+=(/usr/share/zsh/plugins /usr/share)

_load_zsh_plugin() {
  local plugin="$1" dir
  for dir in $_zsh_plugin_dirs; do
    if [[ -r "$dir/$plugin/$plugin.zsh" ]]; then
      source "$dir/$plugin/$plugin.zsh"
      return 0
    fi
  done
  return 1
}

_load_zsh_plugin zsh-autosuggestions
_load_zsh_plugin zsh-syntax-highlighting   # keep last
unset -f _load_zsh_plugin
unset _zsh_plugin_dirs
