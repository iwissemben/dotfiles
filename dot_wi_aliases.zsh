# My aliases (prefix wi)
# Managed by chezmoi

# --- CONFIGURATION & EDITION ---
# Using 'chezmoi edit' ensures changes are tracked and applied instantly
alias wi_config="chezmoi edit ~/.zshrc"
alias wi_aliases="chezmoi edit ~/.wi_aliases.zsh"
alias wi_env_config="chezmoi edit ~/.wi_env_config.zsh"
alias wi_start="chezmoi edit ~/.wi_startup.zsh"
alias wi_reload="source ~/.zshrc"

# --- TOOLS & MAINTENANCE ---
alias wi_doctor="brew doctor"
alias wi_code="code ."
alias wi_copy="fc -ln -1 | pbcopy" # Copies the last command to clipboard
alias wi_brew_maintain="brew update && brew upgrade && brew cleanup && brew doctor"
alias wi_brew_log="cat /tmp/wi_brew_maintain.log" # View background maintenance logs

# Smart Brew Dump: Updates the Brewfile and syncs it with chezmoi automatically
wi_brew_dump() {
    echo "📊 Updating Brewfile inventory..."
    brew bundle dump --describe --force --file=~/Brewfile
    echo "🏠 Syncing Brewfile with chezmoi..."
    chezmoi add ~/Brewfile
    echo "✅ Done. Remember to 'chezmoi cd && git push' to backup online."
}

# --- SYSTEM FIXES ---
alias wi_bluetooth_fix="sudo /usr/sbin/nvram 7C436110-AB2A-4BBB-A880-FE41995C9F82:bluetoothExternalDongleFailed=%00"

# --- APPS ---
alias wi_anaconda='anaconda-navigator > /dev/null 2>&1 &'