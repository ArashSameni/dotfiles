#!/bin/bash

set -e

echo "▶️ Installing some cli tools..."
yay -S --noconfirm --needed --answerdiff None --answerclean None \
	jq \
	fzf \
	tmux \
	fd \
	ripgrep \
	bat \
	btop \
	tldr

echo "✅ Fonts installation complete."
