#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_ROOT="$HOME/dotfiles-backup"
BACKUP_DIR="$BACKUP_ROOT/$(date +%Y%m%d-%H%M%S)-$$"

NVIM_SOURCE="$DOTFILES_DIR/nvim"
WEZTERM_SOURCE="$DOTFILES_DIR/wezterm/wezterm.lua"
ZSH_SOURCE="$DOTFILES_DIR/zsh/.zshrc"
STARSHIP_SOURCE="$DOTFILES_DIR/starship/starship.toml"

NVIM_TARGET="$HOME/AppData/Local/nvim"
WEZTERM_TARGET="$HOME/.wezterm.lua"
ZSH_TARGET="$HOME/.zshrc"
STARSHIP_TARGET="$HOME/.config/starship.toml"

# Validate every source and target before making changes.
for path in \
  "$NVIM_SOURCE" \
  "$WEZTERM_SOURCE" \
  "$ZSH_SOURCE" \
  "$STARSHIP_SOURCE" \
  "$NVIM_TARGET" \
  "$WEZTERM_TARGET" \
  "$ZSH_TARGET" \
  "$STARSHIP_TARGET"; do
  if [[ ! -e "$path" ]]; then
    echo "ERROR: Required path does not exist: $path" >&2
    exit 1
  fi
done

# Refuse to reuse a backup directory.
if [[ -e "$BACKUP_DIR" ]]; then
  echo "ERROR: Backup directory already exists: $BACKUP_DIR" >&2
  exit 1
fi

mkdir -p "$BACKUP_DIR/nvim" "$BACKUP_DIR/starship"

echo "Backing up current configurations..."

cp -a "$NVIM_TARGET/." "$BACKUP_DIR/nvim/"
cp -a "$WEZTERM_TARGET" "$BACKUP_DIR/wezterm.lua"
cp -a "$ZSH_TARGET" "$BACKUP_DIR/.zshrc"
cp -a "$STARSHIP_TARGET" "$BACKUP_DIR/starship/starship.toml"

echo "Applying dotfiles..."

cp -a "$NVIM_SOURCE/." "$NVIM_TARGET/"
cp -a "$WEZTERM_SOURCE" "$WEZTERM_TARGET"
cp -a "$ZSH_SOURCE" "$ZSH_TARGET"
cp -a "$STARSHIP_SOURCE" "$STARSHIP_TARGET"

echo "Configurations applied successfully."
echo "Backup location: $BACKUP_DIR"
