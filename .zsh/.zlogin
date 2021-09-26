# Autostart

# Dump libraries
if [ -d $HOME/System/pacman ]; then
    pacman -Qe > $HOME/System/pacman/$(cat /etc/hostname).packages
fi

# Dump systemctl status
if [ -d $HOME/System/systemctl ]; then
    systemctl list-unit-files > $HOME/System/systemctl/$(cat /etc/hostname).status
fi

# Syncthing
if [ -x $HOME/.local/bin/syncthing ]; then
    $HOME/.local/bin/syncthing serve --no-browser > /dev/null 2>&1 &
fi

# Opam
if [ -f /home/tatsu/.opam/opam-init/init.zsh ]; then
    test -r /home/tatsu/.opam/opam-init/init.zsh && . /home/tatsu/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
fi

# X at login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    startx
fi
