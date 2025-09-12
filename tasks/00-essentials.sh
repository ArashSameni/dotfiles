#!/bin/bash

set -e

echo "▶️ Updating package database and upgrading system..."
sudo pacman -Syu --noconfirm

echo "▶️ Installing base development tools and helpers..."
# --needed: Don't reinstall packages that are already up-to-date
sudo pacman -S --noconfirm --needed \
    base-devel \
    wget \
    curl \
    unzip

echo "✅ System essentials installed."

