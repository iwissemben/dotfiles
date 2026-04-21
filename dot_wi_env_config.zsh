# Give priority to Homebrew's Python 3.13 if installed
if [[ $(uname -m) == "arm64" ]]; then
    BREW_PREFIX="/opt/homebrew"
else
    BREW_PREFIX="/usr/local"
fi

# Configuration du PATH Python 3.13
PYTHON_PATH="$BREW_PREFIX/opt/python@3.13/libexec/bin"

if [[ -d "$PYTHON_PATH" ]]; then
    export PATH="$PYTHON_PATH:$PATH"
fi
# Initializing autocompletion for uv
eval "$(uv generate-shell-completion zsh)"

# Loading zsh config files
[[ -f ~/.wi_env.zsh ]] && source ~/.wi_env.zsh
[[ -f ~/.wi_aliases.zsh ]] && source ~/.wi_aliases.zsh
[[ -f ~/.wi_startup.zsh ]] && source ~/.wi_startup.zsh

