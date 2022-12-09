# Alias

alias sudo='sudo ' # https://linuxhandbook.com/run-alias-as-sudo/
alias ll='ls -l'
alias la='ls -la'
alias v='nvim'

# Options

setopt share_history

# Key Bindings

function clear-scrollback-screen {
    # Behavior of clear:
    # 1. clear scrollback if E3 cap is supported (terminal, platform specific)
    # 2. then clear visible screen
    # For some terminal 'e[3J' need to be sent explicitly to clear scrollback
    clear && printf '\e[3J'
    # .reset-prompt: bypass the zsh-syntax-highlighting wrapper
    # https://github.com/sorin-ionescu/prezto/issues/1026
    # https://github.com/zsh-users/zsh-autosuggestions/issues/107#issuecomment-183824034
    # -R: redisplay the prompt to avoid old prompts being eaten up
    # https://github.com/Powerlevel9k/powerlevel9k/pull/1176#discussion_r299303453
    zle && zle .reset-prompt && zle -R
}
zle -N clear-scrollback-screen
bindkey '^L' clear-scrollback-screen

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

# Rust
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Starship

if [ -x /usr/bin/starship ]; then
    unsetopt PROMPT_SP # fix first line percent symbol
    eval "$(starship init zsh)"
fi
