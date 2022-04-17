# Autostart

# Syncthing
if [ -x $HOME/.local/bin/syncthing ]; then
    $HOME/.local/bin/syncthing serve --no-browser > /dev/null 2>&1 &
fi
