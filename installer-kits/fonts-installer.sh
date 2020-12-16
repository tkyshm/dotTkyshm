#!/bin/bash
# Fonts Configuration
SCRIPT_DIR=$1
echo -e "\e[34m[INFO] Setting font configuration.\e[39m"
mkdir -p ~/.fonts
cp $SCRIPT_DIR/fonts/Inconsolata+for+Powerline.otf ~/.fonts
cp $SCRIPT_DIR/fonts/PowerlineSymbols.otf ~/.fonts
fc-cache -vf
