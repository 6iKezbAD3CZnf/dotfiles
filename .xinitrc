#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# set resolution

if [ -x /usr/bin/xrandr ]; then
    xrandr --output Virtual1 --mode 1920x1080 || xrandr --output Virtual-1 --mode 1920x1080 || xrandr --auto
fi

# for window transparency

if [ -x /usr/bin/xcompmgr ]; then
    xcompmgr &
fi

# start fcitx

if [ -x /usr/bin/fcitx ]; then
    fcitx &
fi

# set the wallpaper (downloading from Unsplash.com on boot)

if [ -x /usr/bin/feh ] && [ -x /usr/bin/wget ] && [ -d $HOME/Images/wallpapers ]; then
    wget --quiet -O $HOME/.cache/unsplash_nature_on_boot.jpg "https://source.unsplash.com/3840x2160?nature" &&
    feh --bg-scale $HOME/.cache/unsplash_nature_on_boot.jpg &&
    $HOME/.fehbg &
fi

# start Xorg

if [ -x /usr/bin/xmonad ]; then
    xmonad --recompile;
    xmonad
fi
