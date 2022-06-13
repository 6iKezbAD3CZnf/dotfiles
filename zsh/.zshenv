# PATH
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin

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
