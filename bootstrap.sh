#!/bin/bash
#
# bootstrap.sh - Sets up a new Arch Linux machine.
# This script installs Git, clones the dotfiles repository, and runs the main installer.

# --- Configuration ---
GITHUB_USERNAME="ArashSameni"
REPO_NAME="dotfiles"

# --- Script ---
set -e # Exit immediately if a command exits with a non-zero status.

# Define the repository URL and the destination directory
# git@github.com:ArashSameni/dotfiles.git
DOTFILES_REPO="git@github.com:$GITHUB_USERNAME/$REPO_NAME.git"
DOTFILES_DIR="$HOME/$REPO_NAME"

echo "🚀 Starting bootstrap process for a new Arch Linux machine..."

if ! command -v git &> /dev/null; then
    echo "Git not found. Installing..."
    sudo pacman -Syu --noconfirm git
fi

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning your dotfiles repository from GitHub..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "Dotfiles repository already exists at $DOTFILES_DIR. Skipping clone."
fi

INSTALL_SCRIPT="$DOTFILES_DIR/install.sh"
if [ -f "$INSTALL_SCRIPT" ]; then
    echo "Executing the main installation script..."
    cd "$DOTFILES_DIR"
    bash "$INSTALL_SCRIPT"
else
    echo "❌ Error: Main installation script not found at '$INSTALL_SCRIPT'."
    exit 1
fi

echo ""
echo "✅ Bootstrap complete! Welcome to your new Arch setup."
