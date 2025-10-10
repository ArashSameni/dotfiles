#!/bin/bash

set -e

echo "▶️ Installing Hyprland and essential components..."
yay -S --noconfirm --needed --answerdiff None --answerclean None \
    hyprland \
    hyprpaper \
    hypridle \
    hyprlock \
    waybar \
    rofi \
    dunst \
    network-manager-applet

echo "✅ Hyprland installation complete."
