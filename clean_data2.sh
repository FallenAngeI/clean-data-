#!/bin/bash
pkill -i Verdent 2>/dev/null
sleep 1
rm -rf ~/Library/Application\ Support/Verdent
rm -rf ~/Library/Logs/Verdent
rm -f ~/Library/Preferences/ai.verdent.deck.plist
sudo rm -rf ~/.verdent

# Impedir recriação de pastas que o servidor usa para fingerprinting
mkdir -p ~/Library/Application\ Support/Verdent
chmod 000 ~/Library/Application\ Support/Verdent
