# chezmoi Cheatsheet

`chezmoi` is a tool for managing your dotfiles across multiple machines.

### Core Commands

| Command | Description |
|---|---|
| `chezmoi init <repo>` | Initialize a new `chezmoi` repository. |
| `chezmoi add <path>` | Add a file or directory to be managed by `chezmoi`. |
| `chezmoi apply` | Apply changes from the source state to the destination. |
| `chezmoi update` | Pull changes from the git remote and apply them. |
| `chezmoi edit <path>` | Edit a managed file using `$EDITOR`. |
| `chezmoi diff` | Show the differences between the source and destination. |
| `chezmoi forget <path>` | Stop managing a file (does not delete it). |
| `chezmoi managed` | List all files and directories managed by `chezmoi`. |
| `chezmoi source-path` | Print the path to the source directory. |

### Custom Aliases (`wi_` prefix)

Your local environment includes custom aliases to quickly edit managed files without typing the full `chezmoi edit` command:

| Alias | Command Executed | Description |
|---|---|---|
| `wi_config` | `chezmoi edit ~/.zshrc` | Edit the main Zsh configuration. |
| `wi_aliases` | `chezmoi edit ~/.wi_aliases.zsh` | Edit the custom aliases file. |
| `wi_env_config` | `chezmoi edit ~/.wi_env_config.zsh` | Edit the environment variables configuration. |
| `wi_start` | `chezmoi edit ~/.wi_startup.zsh` | Edit the startup script. |
| `wi_reload` | `source ~/.zshrc` | Reload the Zsh configuration in the current session. |

### Custom Workflows

- **`wi_brew_dump`**: This custom function runs `brew bundle dump` to update your local inventory and automatically syncs it using `chezmoi add ~/Brewfile`. *Don't forget to commit and push the changes afterwards.*

### Typical Workflow

1.  **Modify a config file directly:**
    ```sh
    # e.g., edit your Zsh configuration
    code ~/.zshrc
    ```

2.  **Apply the changes back to `chezmoi`'s source directory:**
    ```sh
    # This updates the source file to match the destination
    chezmoi add ~/.zshrc
    ```

3.  **Commit and push your changes:**
    ```sh
    cd "$(chezmoi source-path)"
    git add .
    git commit -m "Update Zsh configuration"
    git push
    ```