# Environment Variables & Core Exports {{{
export EDITOR=nvim
export FZF_DEFAULT_OPTS='--no-color'
export SSL_CERT_FILE="/opt/homebrew/etc/ca-certificates/cert.pem"
# }}}

# System Completion Base & FPATH Extensions {{{
# Register custom completion definitions before executing compinit initialization
if [[ -d ~/.zsh/zsh-completions/src ]]; then
    fpath=(~/.zsh/zsh-completions/src $fpath)
fi

# Inject Docker CLI completions safely into the system path vector
if [[ -d /Users/george/.docker/completions ]]; then
    fpath=(/Users/george/.docker/completions $fpath)
fi

# Initialize Zsh Completion Engine
autoload -Uz compinit
compinit
# }}}

# Compiler & Runtime Managers {{{
if [[ -f /opt/homebrew/opt/chruby/share/chruby/chruby.sh ]]; then
    source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
    source /opt/homebrew/opt/chruby/share/chruby/auto.sh
    chruby ruby-3.4.0
fi

# Initialize Zoxide (Smarter directory jumping engine)
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi
# }}}

# Asynchronous Inputs & Plugins {{{

# Advanced Fuzzy Tab Completion Layout (Must be loaded immediately after compinit)
if [[ -f ~/.zsh/fzf-tab/fzf-tab.plugin.zsh ]]; then
    source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
fi

# Inline Fish-like History Suggestions
if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Pure binary evaluation (Executed once)
if command -v fzf &>/dev/null; then
    source <(fzf --zsh)
fi

# Real-time Auto-completion Menu Engine
# if [[ -f ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]]; then
#     source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# fi

# ABSOLUTE LAST: Highlighting wraps all previously bound ZLE widgets
if [[ -f ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]]; then
    source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
elif [[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# }}}

# vim:foldmethod=marker:foldlevel=0
