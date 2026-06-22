#!/bin/bash
# Verdent Trial Reset for macOS
# Baseado nos caminhos reais encontrados em ~/Library

echo "Starting Verdent Reset..."

# Fechar a app Verdent (se estiver a correr)
pkill -i Verdent

# Remover Application Support (contém o storage principal)
rm -rf ~/Library/Application\ Support/Verdent

# Remover preferências
rm -f ~/Library/Preferences/ai.verdent.deck.plist

# Remover logs
rm -rf ~/Library/Logs/Verdent

# Gerar novos IDs (para o ficheiro de storage)
ID1=$(uuidgen | tr '[:upper:]' '[:lower:]')
ID2=$(uuidgen | tr '[:upper:]' '[:lower:]')
ID3=$(uuidgen)

# Recriar a pasta de Application Support
mkdir -p ~/Library/Application\ Support/Verdent

# Criar novo verdent-storage.json com IDs frescos
echo "{\"telemetry.macMachineId\":\"$ID1\",\"telemetry.machineId\":\"$ID2\",\"telemetry.devDeviceId\":\"$ID3\"}" > ~/Library/Application\ Support/Verdent/verdent-storage.json

# Tornar o ficheiro de storage read-only (para evitar reescrita)
chmod 444 ~/Library/Application\ Support/Verdent/verdent-storage.json

echo "Done! Verdent local data cleaned. Change IP/VPN and use a new email."
