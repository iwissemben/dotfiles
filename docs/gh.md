# GitHub CLI (gh) Cheatsheet

`gh` is the official command-line tool for GitHub.

### Authentication & Config

| Command | Description |
|---|---|
| `gh auth login` | Authenticate with your GitHub account. |
| `gh auth status` | Check authentication status. |
| `gh config list` | List configuration settings. |

### Repositories

| Command | Description |
|---|---|
| `gh repo clone <owner>/<repo>` | Clone a repository. |
| `gh repo create <name>` | Create a new repository. |
| `gh repo view --web` | View the current repository in a web browser. |

### Pull Requests (PRs)

| Command | Description |
|---|---|
| `gh pr list` | List pull requests in the current repository. |
| `gh pr create` | Create a new pull request. |
| `gh pr checkout <number>` | Check out a pull request locally. |
| `gh pr diff <number>` | View the changes in a pull request. |
| `gh pr merge <number>` | Merge a pull request. |
| `gh pr close <number>` | Close a pull request. |