# Autostart

# Dump libraries
if [ -d $HOME/Notes/pacman ]; then
    if cat /etc/hostname | grep -q "ISpc-Arch"; then
        pacman -Qe > $HOME/Notes/pacman/ISpc-Arch.packages
    elif cat /etc/hostname | grep -q "Kodaira-HP-Arch"; then
        pacman -Qe > $HOME/Notes/pacman/Kodaira-HP-Arch.packages
    fi
fi

# Syncthing
if [ -x $HOME/.local/bin/syncthing ]; then
    $HOME/.local/bin/syncthing -no-browser &
fi

# Opam
if [ -f /home/tatsu/.opam/opam-init/init.zsh ]; then
    test -r /home/tatsu/.opam/opam-init/init.zsh && . /home/tatsu/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
fi

# X at login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi
