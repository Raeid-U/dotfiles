# --------------------------------
# .bashrc -- raeid-u
# --------------------------------

# Aliases for navigation
alias ll='ls -alF'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'

# Function to fetch the current Git branch
get_git_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Custom shell prompt with Git branch, using the current username (\u)
export PS1="۩ \[\033[01;34m\]\u: \[\033[01;32m\]\W \[\033[01;33m\]\$(get_git_branch)\[\033[00m\] $ "
