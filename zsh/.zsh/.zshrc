# Alias
alias sudo='sudo ' # https://linuxhandbook.com/run-alias-as-sudo/
alias ll='ls -l'
alias la='ls -la'
alias v='nvim'

# Options
setopt share_history

# Use vi mode
bindkey -v
export KEYTIMEOUT=1

# # Key Bindings
# function clear-scrollback-screen {
#     # Behavior of clear:
#     # 1. clear scrollback if E3 cap is supported (terminal, platform specific)
#     # 2. then clear visible screen
#     # For some terminal 'e[3J' need to be sent explicitly to clear scrollback
#     clear && printf '\e[3J'
#     # .reset-prompt: bypass the zsh-syntax-highlighting wrapper
#     # https://github.com/sorin-ionescu/prezto/issues/1026
#     # https://github.com/zsh-users/zsh-autosuggestions/issues/107#issuecomment-183824034
#     # -R: redisplay the prompt to avoid old prompts being eaten up
#     # https://github.com/Powerlevel9k/powerlevel9k/pull/1176#discussion_r299303453
#     zle && zle .reset-prompt && zle -R
# }
# zle -N clear-scrollback-screen
# bindkey '^L' clear-scrollback-screen

# Plugins
if [ -f "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -f "$HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
    source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
	bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
	bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi
if [ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'
    bindkey '^ ' autosuggest-accept
fi

# Homebrew
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# FZF
if [ -x /usr/bin/fzf ]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
elif [ -x /opt/homebrew/bin/fzf ]; then
    source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
    source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# Zoxide
if [ -x /usr/bin/zoxide ] || [ -x /opt/homebrew/bin/zoxide ]; then
    export _ZO_ECHO=1
    eval "$(zoxide init zsh)"
fi

# # Zellij
# if [ -x /opt/homebrew/bin/zellij ]; then
#     ZELLIJ_AUTO_ATTACH=true eval "$(zellij setup --generate-auto-start zsh)"
# fi

# Starship
if [ -x /usr/bin/starship ] || [ -x /opt/homebrew/bin/starship ]; then
    unsetopt PROMPT_SP # fix first line percent symbol
    eval "$(starship init zsh)"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
