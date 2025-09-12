#!/bin/bash

set -e

echo "▶️ Installing Zsh and Ghostty..."
sudo pacman -S --noconfirm --needed zsh ghostty

echo "▶️ Installing Oh My Posh from AUR..."
if command -v yay &> /dev/null; then
    yay -S --noconfirm --needed --answerdiff None --answerclean None oh-my-posh-bin
else
    echo "❌ Error: yay is not installed. Cannot install AUR packages."
    exit 1
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "▶️ Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

if [ "$SHELL" != "/bin/zsh" ]; then
    echo "▶️ Setting Zsh as the default shell..."
    chsh -s $(which zsh)
else
    echo "Zsh is already the default shell."
fi

echo "✅ Shell and prompt setup complete."


