#!/bin/sh
#
alias ai="python /Users/aloks/.local/bin/scripts/ai_enhanced.py"
alias sortsize='find . -type f -printf "%s %p\n" | awk '\''{size_bytes = $1; filename = ""; for (i = 2; i <= NF; i++) {filename = filename " " $i;} sub(/^ /, "", filename); printf "%d %s\n", size_bytes, filename;}'\'' | sort -nr | awk '\''{size_bytes = $1; filename = ""; for (i = 2; i <= NF; i++) {filename = filename " " $i;} sub(/^ /, "", filename); if (size_bytes < 1024) {printf "%d bytes %s\n", size_bytes, filename;} else if (size_bytes < 1024*1024) {printf "%.2f KB %s\n", size_bytes/1024, filename;} else if (size_bytes < 1024*1024*1024) {printf "%.2f MB %s\n", size_bytes/(1024*1024), filename;} else {printf "%.2f GB %s\n", size_bytes/(1024*1024*1024), filename;}}'\'''
alias ..='cd ..'
alias ...='cd ../..'
alias j='z'
alias f='zi'
alias g='lazygit'
alias nvimrc='nvim ~/.config/nvim/'
alias sshk="kitty +kitten ssh"
alias ls='eza --icons'
alias la='eza --icons -la'
alias mdtopdf="pandoc --pdf-engine=xelatex -V 'mainfont:DejaVuSerif' -V 'mainfontoptions:Extension=.ttf, UprightFont=*, BoldFont=*-Bold, ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic' -V 'sansfont:DejaVuSans.ttf' -V 'monofont:DejaVuSansMono.ttf' -V "geometry:margin=1in" --highlight-style=zenburn"
alias vim='nvim'

# yt-dlp
alias ytbv='yt-dlp -f "bestvideo[height<=1080]+bestaudio" --merge-output-format mp4 --verbose --no-playlist'
alias ytba='yt-dlp -f bestaudio -x --audio-format mp3 --verbose --no-playlist'
alias ytp='yt-dlp -f "bestvideo[height<=720]+bestaudio" --merge-output-format mp4 --yes-playlist -o "%(playlist_index)s-%(title)s.%(ext)s"'
alias ytfzf='ytfzf --rii -t'

alias ssh='TERM=xterm-256color ssh'

# Colorize grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'
alias free='free -m'

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

alias pytesta='pytest -v --disable-warnings -x'
