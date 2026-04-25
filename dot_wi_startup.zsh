if [[ -o interactive ]]; then
    fastfetch # show software and hardware config

    # Homebrew maintenance in the background (runs only once per boot).
    # macOS clears /tmp on startup, making it perfect for this check.
    if [[ ! -f /tmp/wi_brew_maintain_status ]]; then
        echo "running" > /tmp/wi_brew_maintain_status
        local CURRENT_TTY=$(tty 2>/dev/null)
        (
            # We separate 'brew doctor' because it often throws harmless warnings 
            # that cause a non-zero exit code, triggering a false "error" status.
            if brew update && brew upgrade && brew cleanup; then
                echo "success" > /tmp/wi_brew_maintain_status
                brew doctor || true
                if [[ -w "$CURRENT_TTY" ]]; then
                    print -P "\n%F{green}●%f %F{240}Brew maintenance completed successfully%f" > "$CURRENT_TTY"
                fi
            else
                echo "error" > /tmp/wi_brew_maintain_status
                if [[ -w "$CURRENT_TTY" ]]; then
                    print -P "\n%F{red}●%f %F{240}Brew maintenance failed (run wi_brew_log)%f" > "$CURRENT_TTY"
                fi
            fi
        ) > /tmp/wi_brew_maintain.log 2>&1 &!
    fi

    # Display a discreet status indicator below fastfetch
    local brew_status=$(cat /tmp/wi_brew_maintain_status 2>/dev/null)
    if [[ "$brew_status" == "success" ]]; then
        print -P "%F{green}●%f %F{240}Brew maintenance completed successfully%f"
    elif [[ "$brew_status" == "error" ]]; then
        print -P "%F{red}●%f %F{240}Brew maintenance failed (run wi_brew_log)%f"
    elif [[ "$brew_status" == "running" ]]; then
        print -P "%F{yellow}●%f %F{240}Brew maintenance running in background...%f"
    fi
fi
