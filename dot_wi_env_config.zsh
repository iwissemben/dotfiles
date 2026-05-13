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

# --- DEVELOPER TOOLS MANAGEMENT ---

# Force system to use standalone light tools (Homebrew, uv, standard C++ compilation)
use_standalone_tools() {
    sudo xcode-select -s /Library/Developer/CommandLineTools
    echo "Current Developer Path: $(xcode-select -p)"
}

# Force system to use Xcode (iOS development, xcrun, simctl)
use_xcode_tools() {
    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
    echo "Current Developer Path: $(xcode-select -p)"
}

# Default to use standalone tools at startup
export DEVELOPER_DIR="/Library/Developer/CommandLineTools"