#!/bin/bash

set -e

CURRENT_USER=$(logname)
USER_HOME=$(eval echo "~$CURRENT_USER")

run_as_user() {
    sudo -u "$CURRENT_USER" env PATH="$USER_HOME/.bun/bin:$USER_HOME/.local/bin:$USER_HOME/.cargo/bin:$PATH" "$@"
}

echo "▶️ Installing Go, Zig, and Pyenv from AUR..."
if command -v yay &> /dev/null; then
    yay -S --noconfirm --needed --answerdiff None --answerclean None \
        go \
        zig \
        pyenv
else
    echo "❌ Error: yay is not installed. Cannot install AUR packages."
    exit 1
fi

echo "▶️ Configuring Bun..."
if run_as_user bun --version &> /dev/null; then
    echo "✅ Bun already installed: $(run_as_user bun --version)"
    run_as_user bun upgrade
else
    echo "⬇️ Installing Bun via official script..."
    curl -fsSL https://bun.sh/install | run_as_user bash
fi

echo "▶️ Configuring UV..."
if run_as_user uv --version &> /dev/null; then
    echo "✅ UV already installed: $(run_as_user uv --version)"
    run_as_user uv self update
else
    echo "⬇️ Installing UV via official script..."
    curl -LsSf https://astral.sh/uv/install.sh | run_as_user sh
fi

echo "▶️ Configuring Python..."
LATEST_PYTHON=$(pyenv install --list | sed 's/^[[:space:]]*//' | grep '^3' | grep -v '[a-zA-Z]' | tail -n 1)
echo "⬇️ Installing latest Python version: $LATEST_PYTHON"
run_as_user pyenv install -s "$LATEST_PYTHON"
run_as_user pyenv global "$LATEST_PYTHON"

echo "▶️ Configuring Rust..."
if run_as_user rustup --version &> /dev/null; then
    echo "✅ Rust already installed: $(run_as_user rustc --version)"
else
    echo "⬇️ Installing Rust via rustup.rs..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | run_as_user sh -s -- -y
fi

run_as_user bash -c 'source "$HOME/.cargo/env" && rustup default stable'

echo "✅ Development tools setup complete."
echo "IMPORTANT: Add these to your ~/.zshrc if missing:"
echo '  export PATH="$HOME/.bun/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"'
echo '  eval "$(pyenv init -)"'
