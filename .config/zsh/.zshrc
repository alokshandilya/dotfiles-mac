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

if [[ -n "$HOMEBREW_PREFIX" ]]; then
  [[ -r "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  [[ -r "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

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

autoload -Uz compinit && compinit
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
if [[ -o interactive && ( $TERM == "xterm-kitty" || $TERM == "xterm-ghostty" || $TERM_PROGRAM == "ghostty" || $TERM_PROGRAM == "Ghostty" ) ]]; then
  if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
  fi
fi
