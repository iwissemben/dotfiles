# tmux Cheatsheet

`tmux` is a terminal multiplexer. The default prefix is `Ctrl-b`.

### Sessions

| Command | Description |
|---|---|
| `tmux new -s <name>` | Create a new named session. |
| `tmux ls` | List all running sessions. |
| `tmux attach -t <name>` | Attach to an existing session. |
| `PREFIX + d` | Detach from the current session. |
| `PREFIX + $` | Rename the current session. |

### Windows (Tabs)

| Shortcut | Description |
|---|---|
| `PREFIX + c` | Create a new window. |
| `PREFIX + w` | List all windows. |
| `PREFIX + ,` | Rename the current window. |
| `PREFIX + p` | Switch to the previous window. |
| `PREFIX + n` | Switch to the next window. |
| `PREFIX + <0-9>` | Switch to window by number. |
| `PREFIX + &` | Kill the current window. |

### Panes (Splits)

| Shortcut | Description |
|---|---|
| `PREFIX + %` | Split the current pane vertically. |
| `PREFIX + "` | Split the current pane horizontally. |
| `PREFIX + <arrows>` | Navigate between panes. |
| `PREFIX + z` | Toggle zoom for the current pane. |
| `PREFIX + x` | Kill the current pane. |
| `PREFIX + o` | Cycle through panes. |

### Plugin: tmux-resurrect

| Shortcut | Description |
|---|---|
| `PREFIX + Ctrl-s` | Save the current tmux environment (windows, panes, etc.). |
| `PREFIX + Ctrl-r` | Restore the last saved environment. |