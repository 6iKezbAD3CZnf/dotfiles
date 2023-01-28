# PATH
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin

export XDG_CONFIG_HOME=$HOME/.config

# FCITX
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# ZSH
export ZDOTDIR=$HOME/.zsh
export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# FZF
export FZF_DEFAULT_COMMAND="find"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --color 'bg+:white,fg+:black,hl:magenta,hl+:bright-magenta'"
export FZF_CTRL_T_COMMAND="find"
export FZF_ALT_C_COMMAND="find -type d"
