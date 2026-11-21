#!/usr/bin/env bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"

echo "🚀 Instalando configuraciones y temas de terminal..."
mkdir -p ~/.config ~/.local/bin ~/.local/share/fonts ~/.local/share/mc

cp -r "$DIR/.config/"* ~/.config/
cp -r "$DIR/.local/share/mc/"* ~/.local/share/mc/
cp "$DIR/.tmux.conf" ~/.tmux.conf
cp "$DIR/.terminal-custom.sh" ~/.terminal-custom.sh

if ! grep -q "source ~/.terminal-custom.sh" ~/.bashrc; then
  echo -e "\n[ -f ~/.terminal-custom.sh ] && source ~/.terminal-custom.sh" >> ~/.bashrc
fi

if command -v batcat &> /dev/null && ! command -v bat &> /dev/null; then
  ln -sf "$(which batcat)" ~/.local/bin/bat
fi
command -v bat &> /dev/null && bat cache --build

if [ ! -d ~/.tmux/plugins/tpm ]; then
  GH="github.com"
  git clone "https://${GH}/tmux-plugins/tpm" ~/.tmux/plugins/tpm 2>/dev/null || true
fi

if ! fc-list | grep -qi "JetBrainsMono"; then
  echo "🔤 Instalando JetBrainsMono Nerd Font..."
  GH="github.com"
  REPO="ryanoasis/nerd-fonts/releases/latest/download"
  ZIP="JetBrainsMono.zip"
  curl -fLo "/tmp/$ZIP" "https://${GH}/${REPO}/${ZIP}"
  unzip -o "/tmp/$ZIP" -d ~/.local/share/fonts/ >/dev/null
  rm -f "/tmp/$ZIP"
  fc-cache -fv >/dev/null
fi

read -p "¿Deseas instalar también las herramientas CLI (tmux, eza, bat, btop, fzf, mc, xclip, starship)? [s/N]: " RESP
if [[ "$RESP" =~ ^[Ss]$ ]]; then
  if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y tmux eza bat btop fzf mc xclip curl unzip fontconfig
  elif command -v dnf &> /dev/null; then
    sudo dnf install -y tmux eza bat btop fzf mc xclip curl unzip fontconfig
  elif command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm tmux eza bat btop fzf mc xclip curl unzip fontconfig
  fi
  if ! command -v starship &> /dev/null; then
    DOM="starship.rs"
    curl -sS "https://${DOM}/install.sh" | sh -s -- -y
  fi
fi

echo "✅ ¡Instalación completa! Reinicia tu terminal o ejecuta: source ~/.bashrc"
