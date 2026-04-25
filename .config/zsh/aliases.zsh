#!/bin/zsh

[[ -r "$HOME/.local/bin/scripts/ai_enhanced.py" ]] &&
  alias ai="python \"$HOME/.local/bin/scripts/ai_enhanced.py\""

if command -v gfind >/dev/null 2>&1; then
  alias sortsize='gfind . -type f -printf "%s %p\n" | awk '\''{size_bytes = $1; filename = ""; for (i = 2; i <= NF; i++) {filename = filename " " $i;} sub(/^ /, "", filename); printf "%d %s\n", size_bytes, filename;}'\'' | sort -nr | awk '\''{size_bytes = $1; filename = ""; for (i = 2; i <= NF; i++) {filename = filename " " $i;} sub(/^ /, "", filename); if (size_bytes < 1024) {printf "%d bytes %s\n", size_bytes, filename;} else if (size_bytes < 1024*1024) {printf "%.2f KB %s\n", size_bytes/1024, filename;} else if (size_bytes < 1024*1024*1024) {printf "%.2f MB %s\n", size_bytes/(1024*1024), filename;} else {printf "%.2f GB %s\n", size_bytes/(1024*1024*1024), filename;}}'\'''
fi

alias ..='cd ..'
alias ...='cd ../..'
alias j='z'
alias f='zi'
alias g='lazygit'
alias zsh-update-plugins='find "$ZDOTDIR/plugins" -type d -exec test -e "{}/.git" ";" -print0 2>/dev/null | xargs -I {} -0 git -C {} pull -q'
alias nvimrc='nvim ~/.config/nvim/'
alias nman='bob'
alias sshk="kitty +kitten ssh"

if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons'
  alias la='eza --icons -la'
fi

alias mdtopdf="pandoc --pdf-engine=xelatex -V 'mainfont:DejaVuSerif' -V 'mainfontoptions:Extension=.ttf, UprightFont=*, BoldFont=*-Bold, ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic' -V 'sansfont:DejaVuSans.ttf' -V 'monofont:DejaVuSansMono.ttf' -V 'geometry:margin=1in' --highlight-style=zenburn"
alias vim='nvim'

# yt-dlp
# alias ytbv='yt-dlp -f bestaudio+bestvideo --verbose --no-playlist'
alias ytbv='yt-dlp -f "bestvideo[height<=1080]+bestaudio" --merge-output-format mp4 --verbose --no-playlist'
alias ytba='yt-dlp -f bestaudio -x --audio-format mp3 --verbose --no-playlist'
# alias ytp='yt-dlp --yes-playlist -o "%(playlist_index)s-%(title)s.%(ext)s"'
alias ytp='yt-dlp -f "bestvideo[height<=720]+bestaudio" --merge-output-format mp4 --yes-playlist -o "%(playlist_index)s-%(title)s.%(ext)s"'
alias ytfzf='ytfzf --rii -t'

alias ssh='TERM=xterm-256color ssh'

# Remarkable
alias remarkable_ssh='ssh root@10.11.99.1'
alias restream='restream -p'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'

# get top process eating memory
alias psmem='ps aux | sort -nr -k 4 | head -5'

# get top process eating cpu
alias pscpu='ps aux | sort -nr -k 3 | head -5'

# pgadmin4
# alias pgadmin4='cd ~/Desktop && source .venv/bin/activate && pgadmin4'
alias pytesta='pytest -v --disable-warnings -x'
