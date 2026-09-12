#!/usr/bin/env bash

set -e # Interrompe lo script in caso di errore

NIXOS_DOTFILES="/home/rocco/Documenti/Github/dotfiles/Nixos"

echo "==> Deploying NixOS e Home Manager..."

# 1. Rimuove configuration.nix e lo sostituisce con il symlink
echo "--> Updating configuration.nix..."
sudo rm -f /etc/nixos/configuration.nix
sudo ln -s "$NIXOS_DOTFILES/configuration.nix" /etc/nixos/configuration.nix

# 2. Symlink della cartella modules in /etc/nixos/
echo "--> Creating modules symlink..."
sudo ln -sfn "$NIXOS_DOTFILES/modules" /etc/nixos/modules

# 3. Symlink della cartella home-manager in ~/.config/
echo "--> Creating home-manager symlink..."
ln -sfn "$NIXOS_DOTFILES/home-manager" "$HOME/.config/home-manager"

echo "✓ Symlink created."

echo "==> Deploy done!"
