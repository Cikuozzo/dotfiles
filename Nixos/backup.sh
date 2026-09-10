#!/usr/bin/env bash

set -e

USER_HOME="/home/rocco"
DEST_DIR="$USER_HOME/Documenti/Codeberg/dotfiles/Nixos"

# Ricrea le cartelle di destinazione da zero per pulizia
mkdir -p "$DEST_DIR"
mkdir -p "$DEST_DIR/home-manager"

echo "Copia in corso..."

# Copia file di sistema
sudo cp /etc/nixos/configuration.nix "$DEST_DIR/"
sudo cp -r /etc/nixos/modules "$DEST_DIR/"

# Copia file utente
cp "$USER_HOME/.config/home-manager/home.nix" "$DEST_DIR/home-manager/"

# Sistemazione permessi
sudo chown -R rocco:users "$DEST_DIR"

echo "Copia completata con successo!"
