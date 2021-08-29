# Alias

alias la='ls -la'
alias v='nvim'
alias c='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vivado='/tools/Xilinx/Vivado/2019.2/bin/vivado -nolog -nojournal'

# Options

setopt share_history

# Plugins

if [ -f "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -f "$HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
    source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
	bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi
if [ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'
fi

if [ -x /usr/bin/fzf ]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

# Tmux

if [ -x "/usr/bin/tmux" ] && [ -z "$TMUX" ] && [ -n "${DISPLAY}" ]; then
    tmux attach-session || tmux
fi

# Starship

if [ -x /usr/bin/starship ]; then
    unsetopt PROMPT_SP # fix first line percent symbol
    eval "$(starship init zsh)"
fi
