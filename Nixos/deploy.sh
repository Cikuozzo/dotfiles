#!/usr/bin/env bash

set -e

NIXOS_DOTFILES="/home/rocco/Documenti/Github/dotfiles/Nixos"

echo "Deploying NixOS e Home Manager..."

echo "Updating configuration.nix..."
sudo rm -f /etc/nixos/configuration.nix
sudo ln -s "$NIXOS_DOTFILES/configuration.nix" /etc/nixos/configuration.nix

echo "Creating modules symlink..."
sudo ln -sfn "$NIXOS_DOTFILES/modules" /etc/nixos/modules

echo "Creating home-manager symlink..."
ln -sfn "$NIXOS_DOTFILES/home-manager" "$HOME/.config/home-manager"

echo "Dotfiles deploy done."
