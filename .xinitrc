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

# set resolution in VirtualBox

if cat /etc/hostname | grep -q "VM" && [ -x /usr/bin/xrandr ]; then
    xrandr --output Virtual1 --mode 1920x1080
    xrandr --output Virtual-1 --mode 1920x1080
fi

# set the wallpaper (downloading from Unsplash.com on boot)

if [ -x /usr/bin/feh ] && [ -x /usr/bin/wget ] && [ -d $HOME/Images/wallpapers ]; then
    wget --quiet -O $HOME/.cache/unsplash_nature_on_boot.jpg "https://source.unsplash.com/1920x1080?nature"
    feh --bg-scale $HOME/.cache/unsplash_nature_on_boot.jpg
    $HOME/.fehbg &
fi

# for window transparency

if [ -x /usr/bin/xcompmgr ]; then
    xcompmgr &
fi

# start ibus

if [ -x /usr/bin/ibus-daemon ]; then
    ibus-daemon -drx
fi

# start xmonad

if cat /etc/hostname | grep -q "VM"; then
    if [ -x /usr/bin/xmonad ]; then
        xmonad --recompile
        xmonad
    fi
else
    if [ -x /usr/bin/VBoxManage ]; then
        virtualbox
    fi
fi
