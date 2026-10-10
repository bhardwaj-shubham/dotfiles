# Dotfiles

Personal development environment configurations managed in a plain Git repository.

The goal is to keep the configuration files I maintain in one place, track changes with Git, and apply them to their active locations using a small backup-aware script.

## Managed Configurations

- **Neovim** — editor configuration
- **WezTerm** — terminal configuration
- **Zsh** — shell configuration
- **Starship** — shell prompt configuration

## Repository Structure

```text
dotfiles/
├── .gitignore
├── README.md
├── apply.sh
├── nvim/
│   ├── init.lua
│   ├── lazy-lock.json
│   ├── .stylua.toml
│   ├── .theme
│   └── lua/
│       ├── config/
│       ├── plugins/
│       └── themes/
├── starship/
│   └── starship.toml
├── wezterm/
│   └── wezterm.lua
└── zsh/
    └── .zshrc
```

## Tools

The development environment uses the following tools:

| Category | Tools |
|---|---|
| Terminal | WezTerm, Git Bash |
| Shell | Zsh, Starship |
| Editor | Neovim |
| Command-line utilities | `bat`, `eza`, `fd`, `fnm`, `fzf`, `jq`, `lazygit`, `ripgrep`, `Yazi`, `zoxide` |

These tools are installed separately. This repository stores configuration files; it does not install or manage system packages.

## Apply Configurations

The `apply.sh` script is configured for **Windows Git Bash**. It copies the repository's configurations to their active locations after backing up the existing configurations.

Run it from Git Bash:

```bash
bash ~/dotfiles/apply.sh
```

Review the script before running it on a new machine or in a different environment. Its source and target paths are specific to the current setup.

### Target Paths

| Configuration | Active location |
|---|---|
| Neovim | `~/AppData/Local/nvim` |
| WezTerm | `~/.wezterm.lua` |
| Zsh | `~/.zshrc` |
| Starship | `~/.config/starship.toml` |

### Backups

Before applying changes, the script creates a timestamped backup directory:

```text
~/dotfiles-backup/<timestamp>-<pid>/
```

The backup contains copies of the existing configurations so they can be restored if needed.

The script does not automatically roll back if applying the configurations fails partway through. If that happens, check the output and restore any affected files from the backup directory.

## Configuration Workflow

1. Edit configuration files inside the `dotfiles` repository.
2. Review the changes:

   ```bash
   git diff
   ```

3. Apply the updated configurations:

   ```bash
   bash ~/dotfiles/apply.sh
   ```

4. Reload or reopen the relevant application and verify the changes.
5. Commit the changes when ready:

   ```bash
   git add .
   git commit -m "describe the configuration change"
   ```

The repository is the source of truth for the configurations it manages. Make changes in the repository first, then apply them to the active configuration paths.

## Using Another Environment

The current apply script targets Windows Git Bash paths. For Linux or WSL, adjust the target paths in `apply.sh` to match the environment before running it.

The setup is intentionally explicit. The script does not automatically detect the operating system or manage platform-specific differences.
