#!/bin/bash

set -e

echo "▶️ Installing Hyprland and essential components..."
yay -S --noconfirm --needed --answerdiff None --answerclean None \
    hyprland \
    waybar \
    rofi \
    dunst

echo "✅ Hyprland installation complete."
