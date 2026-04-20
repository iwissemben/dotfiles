# Give priority to Homebrew's Python 3.13 if installed
PYTHON_PATH="$(brew --prefix)/opt/python@3.13/libexec/bin"
if [ -d "$PYTHON_PATH" ]; then
    export PATH="$PYTHON_PATH:$PATH"
fi
# Initializing autocompletion for uv
eval "$(uv generate-shell-completion zsh)"

# Loading zsh config files
[[ -f ~/.wi_env.zsh ]] && source ~/.wi_env.zsh
[[ -f ~/.wi_aliases.zsh ]] && source ~/.wi_aliases.zsh
[[ -f ~/.wi_startup.zsh ]] && source ~/.wi_startup.zsh