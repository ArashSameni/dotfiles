#!/bin/bash

set -e

echo "▶️ Installing some cli tools..."
yay -S --noconfirm --needed --answerdiff None --answerclean None \
	jq

echo "✅ Fonts installation complete."
