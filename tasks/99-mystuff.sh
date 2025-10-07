#!/bin/bash

set -e

echo "▶️ Installing MyStuff..."
yay -S --noconfirm --needed --answerdiff None --answerclean None \
	v2rayn-bin \
	localsend-bin \
	telegram-desktop

echo "✅ MyStuff installation complete."
