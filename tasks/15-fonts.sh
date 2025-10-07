#!/bin/bash

set -e

echo "▶️ Installing some fonts..."
yay -S --noconfirm --needed --answerdiff None --answerclean None \
	ttf-jetbrains-mono-nerd \
	ttf-iosevka-nerd

echo "✅ Fonts installation complete."
