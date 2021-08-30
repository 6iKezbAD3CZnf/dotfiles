dotfiles
========
My dotfiles.

Installation
------------
```
$ alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ echo ".dotfiles" >> .gitignore
$ git clone --bare <url> $HOME/.dotfiles
$ config config --local status.showUntrackedFiles no
$ config checkout
$ config submodule update --init --recursive
```
