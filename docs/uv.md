# uv Cheatsheet

`uv` is an extremely fast Python package installer and resolver. It can be used as a drop-in replacement for `pip` and `venv`.

### Virtual Environments

| Command | Description |
|---|---|
| `uv venv` | Create a virtual environment in the `.venv` directory. |
| `uv venv my-env` | Create a virtual environment in a specific directory. |
| `source .venv/bin/activate` | Activate the virtual environment (on macOS/Linux). |

### Package Management

| Command | Description |
|---|---|
| `uv pip install <package>` | Install a package. |
| `uv pip install -r reqs.txt` | Install packages from a requirements file. |
| `uv pip uninstall <package>` | Uninstall a package. |
| `uv pip sync reqs.txt` | Synchronize the environment to match `reqs.txt` exactly. |
| `uv pip list` | List installed packages. |
| `uv pip freeze` | Output installed packages in requirements format. |
| `uv pip compile reqs.in -o reqs.txt` | Compile a `requirements.in` file to a locked `requirements.txt`. |