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
    network-manager-applet \
    grim \
    slurp \
    wl-clipboard \
    qt5ct \
    qt6ct \
    breeze \
	swayimg \
    vlc

echo "✅ Hyprland installation complete."
