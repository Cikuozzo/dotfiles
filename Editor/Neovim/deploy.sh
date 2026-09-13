#!/usr/bin/env bash

set -e

NEOVIM_DOTFILES="/home/rocco/Documenti/Github/dotfiles/Editor/Neovim"

echo "Deploying Neovim config..."

mkdir -p "$HOME/.config/nvim"

ln -s "$NEOVIM_DOTFILES/init.lua" "$HOME/.config/nvim/init.lua"

echo "Symlink creation done!"
