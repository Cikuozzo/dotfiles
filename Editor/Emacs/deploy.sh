#!/usr/bin/env bash

set -e

EMACS_DOTFILES="/home/rocco/Documenti/Github/dotfiles/Editor/Emacs"

echo "Deploying Emacs config..."

mkdir -p "$HOME/.emacs.d"

ln -s "$EMACS_DOTFILES/init.el" "$HOME/.emacs.d/init.el"

echo "Symlink creation done!"
