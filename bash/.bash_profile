# --------------------------------
# .bash_profile -- raeid-u
# --------------------------------

# Source .bashrc if it exists
if [ -f "$HOME/dotfiles/.bashrc" ]; then
    source "$HOME/dotfiles/.bashrc"
fi

if [[ $XDG_SESSION_TYPE != "wayland" && $(tty) == /dev/tty1 ]]; then
  exec Hyprland
fi
