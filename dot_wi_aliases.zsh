# My alias (prefix wi)

# --- CONFIGURATION & EDITION ---
alias wi_config="nano ~/.zshrc"
alias wi_aliases="nano ~/dotfiles/wi_aliases.zsh"
alias wi_env_config="nano ~/dotfiles/wi_env_config.zsh"
alias wi_start="nano ~/dotfiles/wi_startup.zsh"
alias wi_reload="source ~/.zshrc"
alias wi_zsh_links='ls -la $ZSH_CUSTOM | grep "\->.*dotfiles"'

# --- Tools & MAINTENANCE ---
alias wi_doctor="brew doctor"
alias wi_code="code ."
alias wi_copy="fc -ln -1 | pbcopy"
alias wi_brew_dump="brew bundle dump --describe --force --file=~/dotfiles/Brewfile"
alias wi_brew_maintain="brew update && brew upgrade && brew cleanup && brew doctor"

alias wi_bluetooth_fix="sudo /usr/sbin/nvram 7C436110-AB2A-4BBB-A880-FE41995C9F82:bluetoothExternalDongleFailed=%00"

#---- Apps ------------------
alias wi_anaconda='anaconda-navigator > /dev/null 2>&1 &'
