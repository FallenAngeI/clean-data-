#!/bin/bash
# Verdent Trial Reset - gera novos IDs de dispositivo (macOS)

echo "=== Verdent Trial Reset ==="

# Fechar a app
pkill -i Verdent 2>/dev/null
sleep 1

# Apagar todos os dados locais
rm -rf ~/Library/Application\ Support/Verdent
rm -rf ~/Library/Logs/Verdent
rm -f  ~/Library/Preferences/ai.verdent.deck.plist
rm -rf ~/Library/Saved\ Application\ State/com.verdent.app.savedState 2>/dev/null
sudo rm -rf ~/.verdent

# Criar a pasta de Application Support
mkdir -p ~/Library/Application\ Support/Verdent/sentry/queue

# Gerar um novo device_id (UUID fresco)
NEW_DEVICE_ID=$(uuidgen | tr '[:upper:]' '[:lower:]')

# Escrever o scope_v3.json com o novo device_id e firstActive: true
cat > ~/Library/Application\ Support/Verdent/sentry/scope_v3.json <<EOF
{
  "scope": {
    "tags": {
      "device_id": "${NEW_DEVICE_ID}"
    }
  },
  "event": {}
}
EOF

# Criar o ficheiro verdent-storage.json com firstActive: true
echo '{"firstActive": true, "anchor": ""}' > ~/Library/Application\ Support/Verdent/verdent-storage.json

# Tornar ambos os ficheiros só de leitura (como o Cursor faz)
chmod 444 ~/Library/Application\ Support/Verdent/verdent-storage.json
chmod 444 ~/Library/Application\ Support/Verdent/sentry/scope_v3.json

echo "Novo device_id: ${NEW_DEVICE_ID}"
echo "firstActive: true"
echo ""
echo "Agora: liga a VPN (Warp), usa um email NOVO e abre o Verdent."
