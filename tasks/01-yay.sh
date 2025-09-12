#!/bin/bash

set -e

if command -v yay &> /dev/null; then
    echo "✅ yay is already installed."
    exit 0
fi

echo "▶️ Installing yay AUR helper..."

TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

cd ~
rm -rf "$TEMP_DIR"

echo "✅ yay installation complete."

