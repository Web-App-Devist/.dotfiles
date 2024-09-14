#!/bin/bash

SOURCE_DIR="$HOME/.dotfiles"
DEST_DIR="$HOME"

# Iterate over all files in DEST_DIR, including dotfiles
shopt -s dotglob # Enable dotfiles to be included in pathname expansion
for file in "$DEST_DIR"/*; do
  filename=$(basename "$file")
  if [ -e "$SOURCE_DIR/$filename" ]; then
    echo "$DEST_DIR/$filename"
    rm -rf "$DEST_DIR/$filename"
  fi
done
shopt -u dotglob # Disable dotfiles from being included in pathname expansion

cd $SOURCE_DIR
stow ./
