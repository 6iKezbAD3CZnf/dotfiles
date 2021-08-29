export PATH=$HOME/.local/bin:$PATH

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

export ZDOTDIR=$HOME/.zsh
export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# FZF
export FZF_DEFAULT_COMMAND="find"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --color 'bg+:white,fg+:black,hl:magenta,hl+:bright-magenta'"
export FZF_CTRL_T_COMMAND="find"
export FZF_ALT_C_COMMAND="find -type d"

# GnuPG
export GNUPGHOME=$HOME/System/gnugp

# pass
export PASSWORD_STORE_DIR=$HOME/System/pass

# Vivado
export _JAVA_AWT_WM_NONREPARENTING=1
