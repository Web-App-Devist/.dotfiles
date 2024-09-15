#!/bin/bash

SOURCE_DIR="$HOME/.dotfiles"
DEST_DIR="$HOME"
BACKUP_DIR="$HOME/backup_$(date +%Y%m%d_%H%M%S)" # Create a unique backup directory

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Copy the contents of DEST_DIR to the backup directory
cp -a "$DEST_DIR/.config/" "$BACKUP_DIR"

# Iterate over all files in DEST_DIR, including dotfiles
shopt -s dotglob # Enable dotfiles to be included in pathname expansion
for file in "$DEST_DIR"/*; do
  filename=$(basename "$file")
  if [ -e "$SOURCE_DIR/$filename" ]; then
    echo "Removing $DEST_DIR/$filename"
    rm -rf "$DEST_DIR/$filename"
  fi
done
shopt -u dotglob # Disable dotfiles from being included in pathname expansion

# Change to SOURCE_DIR and run stow
cd "$SOURCE_DIR" || exit
stow ./

# # Copy content from the backup directory to the destination directory
# cp -a "$BACKUP_DIR/." "$DEST_DIR"

echo "Backup and stow completed. Backup directory: $BACKUP_DIR"
