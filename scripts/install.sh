#!/bin/bash

# Cores para o terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # Sem cor

echo -e "${BLUE}[*] Iniciando a instalação dos Lain-Dotfiles...${NC}"

# 1. Criar diretórios de configuração caso não existam
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/fish
mkdir -p ~/.config/tmux
mkdir -p ~/.local/share/fonts

# 2. Copiar os arquivos de configuração (dotfiles)
echo -e "${BLUE}[*] Copiando configurações...${NC}"
cp alacritty/alacritty.toml ~/.config/alacritty/
cp fish/config.fish ~/.config/fish/
cp -r fish/functions ~/.config/fish/
cp tmux/tmux.conf ~/.config/tmux/

# 3. Copiar as configurações do KDE Plasma
echo -e "${BLUE}[*] Aplicando configurações do KDE Plasma...${NC}"
cp config/kdeglobals ~/.config/
cp config/kwinrc ~/.config/
cp config/plasma-org.kde.plasma.desktop-appletsrc ~/.config/
cp config/plasmarc ~/.config/

# 4. Instalar as fontes no sistema
echo -e "${BLUE}[*] Instalando fontes...${NC}"
cp -r fonts/* ~/.local/share/fonts/
fc-cache -fv > /dev/null

echo -e "${GREEN}[+] Instalação concluída com sucesso! Present Day, Present Time! HAHAHA!${NC}"
