#!/bin/bash

set -e

echo "▶️ Installing some fonts..."
yay -S --noconfirm --needed --answerdiff None --answerclean None \
	ttf-jetbrains-mono-nerd \
	ttf-iosevka-nerd \
	ttf-font-awesome \
	noto-fonts \
	noto-fonts-cjk \
	noto-fonts-emoji \
	ttf-font-awesome \
	otf-font-awesome

sudo cp -rf $SCRIPT_DIR/tasks/fonts/FiraCode /usr/share/fonts
sudo cp -rf $SCRIPT_DIR/tasks/fonts/Fira_Sans /usr/share/fonts
sudo cp -rf $SCRIPT_DIR/tasks/fonts/BebasNeue-Regular /usr/share/fonts
sudo cp -rf $SCRIPT_DIR/tasks/fonts/Material-Icons /usr/share/fonts

if [ -d ~/.local/share/icons/Colloid ]; then
    rm -rf ~/.local/share/icons/Colloid
fi

if [ -d ~/.local/share/icons/Colloid-Dark ]; then
    rm -rf ~/.local/share/icons/Colloid-Dark
fi

if [ -d ~/.local/share/icons/Colloid-Light ]; then
    rm -rf ~/.local/share/icons/Colloid-Light
fi

mkdir -p ~/.local/share/icons/
tar -xf $SCRIPT_DIR/tasks/icons/01-Colloid.tar.xz -C ~/.local/share/icons/

if [ -d ~/.local/share/icons/Colloid/actions ]; then
    rm -rf ~/.local/share/icons/Colloid/actions
fi

if [ -f ~/.local/share/icons/Colloid/actions@2x ]; then
    rm ~/.local/share/icons/Colloid/actions@2x
fi

sudo fc-cache -fv

echo "✅ Fonts installation complete."
