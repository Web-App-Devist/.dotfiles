#!/bin/bash

# Function to print messages
print_message() {
  local message="$1"
  echo "$message"
}

# Function to install packages on Arch Linux
install_arch_packages() {
  print_message "Installing packages on Arch Linux..."
  curl https://mise.run | sh
  echo "eval \"\$(/$HOME/.local/bin/mise activate bash)\"" >>~/.bashrc
  source ~/.bashrc
  $HOME/.local/bin/mise use -g node@latest
  $HOME/.local/bin/mise use -g python@latest
  $HOME/.local/share/mise/installs/python/3.12.6/bin/pip install pipx
  $HOME/.local/bin/pipx install posting
  sudo pacman -S yay ansible
  yay -Syu --noconfirm yaak-app snapd google-chrome-dev archivemount neovim-git tabby-bin ruby-colorls httpie-desktop-appimage
  sudo systemctl enable --now snapd.socket
  sudo ln -s /var/lib/snapd/snap /snap
  # sudo sh -c "echo -e '\n[warpdotdev]\nServer = https://releases.warp.dev/linux/pacman/\$repo/\$arch' >> /etc/pacman.conf"
  # sudo pacman-key -r "linux-maintainers@warp.dev"
  # sudo pacman-key --lsign-key "linux-maintainers@warp.dev"
  # sudo pacman -Sy warp-terminal
  # getent group docker
  # sudo groupadd docker
  # sudo usermod -aG docker $USER
  # newgrp docker
}

# Check if we are running on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  print_message "You are running macOS."
  exit 0
fi

# Check for Debian-based systems (including Ubuntu)
if [ -f /etc/debian_version ]; then
  print_message "You are running a Debian-based system."
  exit 0
fi

# Check for Arch Linux
if [ -f /etc/arch-release ]; then
  print_message "You are running Arch Linux."
  install_arch_packages
  exit 0
fi

# Check for Fedora
if [ -f /etc/fedora-release ]; then
  print_message "You are running Fedora."
  exit 0
fi

# If none of the above
print_message "Your operating system is not recognized by this script."
exit 1
