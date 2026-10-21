#!/usr/bin/env bash
# ==============================================================================
# Smart Zoom & Zoom Generator - Script d'installation automatique pour DaVinci Resolve
# Compatible macOS & Linux
# ==============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}======================================================${NC}"
echo -e "${BLUE}  Installation de Smart Zoom & Zoom Generator          ${NC}"
echo -e "${BLUE}======================================================${NC}"

# Détection de l'OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    RESOLVE_DIR="$HOME/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion"
else
    RESOLVE_DIR="$HOME/.local/share/DaVinciResolve/Fusion"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FUSES_DIR="$RESOLVE_DIR/Fuses"
TEMPLATES_DIR="$RESOLVE_DIR/Templates/Edit/Effects/Smart Zoom"

echo -e "📂 Répertoire cible Resolve : ${YELLOW}$RESOLVE_DIR${NC}"

# Création des dossiers cibles s'ils n'existent pas
mkdir -p "$FUSES_DIR"
mkdir -p "$TEMPLATES_DIR"

# Copie du Fuse
echo -e "⚙️  Installation du moteur Fuse (SmartZoom.fuse)..."
cp "$SCRIPT_DIR/src/Fuses/SmartZoom.fuse" "$FUSES_DIR/SmartZoom.fuse"

# Copie des Templates d'Effets et des icônes
echo -e "🎨 Installation des templates d'effets (Smart Zoom & Zoom Generator)..."
cp -R "$SCRIPT_DIR/src/Templates/Edit/Effects/Smart Zoom/"* "$TEMPLATES_DIR/"

echo -e "${GREEN}======================================================${NC}"
echo -e "${GREEN}  ✅ Installation terminée avec succès !              ${NC}"
echo -e "${GREEN}======================================================${NC}"
echo -e "👉 Ouvre ou redémarre DaVinci Resolve."
echo -e "👉 Va sur la ${YELLOW}Page Montage${NC} -> ${YELLOW}Boîte à outils${NC} -> ${YELLOW}Effets${NC} -> ${YELLOW}Smart Zoom${NC}."
echo ""
