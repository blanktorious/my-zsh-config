#!/usr/bin/env bash
set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()    { echo -e "${GREEN}[+]${NC} $1"; }
warn()    { echo -e "${YELLOW}[!]${NC} $1"; }

REPO_URL="https://github.com/blanktorious/my-zsh-config.git"
REPO_DIR="$HOME/my-zsh-config"

# 1. Install zsh
if ! command -v zsh &>/dev/null; then
  info "Installing zsh..."
  sudo apt update && sudo apt install -y zsh
else
  info "zsh already installed: $(zsh --version)"
fi

# 2. Set zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  info "Setting zsh as default shell..."
  chsh -s "$(which zsh)"
  warn "Shell changed. You may need to log out and back in for this to take effect."
else
  info "zsh is already the default shell."
fi

# 3. Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  info "Installing oh-my-zsh..."
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  info "oh-my-zsh already installed."
fi

# 4. Install powerlevel10k
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
  info "Installing powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
  info "powerlevel10k already installed."
fi

# 5. Clone this repo (if not already present or running from it)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/.zshrc" ]; then
  # Running directly from the cloned repo
  REPO_DIR="$SCRIPT_DIR"
  info "Using existing repo at $REPO_DIR"
else
  if [ ! -d "$REPO_DIR" ]; then
    info "Cloning my-zsh-config repo..."
    git clone "$REPO_URL" "$REPO_DIR"
  else
    info "Repo already cloned at $REPO_DIR, pulling latest..."
    git -C "$REPO_DIR" pull
  fi
fi

# 6. Copy config files
info "Copying config files..."
cp "$REPO_DIR/.zshrc" "$HOME/.zshrc"
cp -r "$REPO_DIR/custom" "$HOME/.oh-my-zsh/"
cp "$REPO_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

info "Done! Run 'exec zsh' or open a new terminal to apply the config."
