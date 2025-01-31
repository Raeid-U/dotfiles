# --------------------------------
# .bashrc -- Raeid-U
# --------------------------------

export BASH_SILENCE_DEPRECATION_WARNING=1

~/dotfiles/scripts/ascii_welcome.sh

# Aliases for navigation
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias gotoob='cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Omashu'

# Git Aliases
alias gs='git status'
alias gp='git push'
alias ga='git add .'
alias gcm='git commit -m'

# Function to fetch the current Git branch
get_git_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Custom shell prompt with Git branch
export PS1="۩ \[\033[01;34m\]Raeid-U: \[\033[01;32m\]\W \[\033[01;33m\]\$(get_git_branch)\[\033[00m\] $ "

# Environment variables (add any interactive-specific environment variables here)
export EDITOR="code"
export VISUAL="code"
