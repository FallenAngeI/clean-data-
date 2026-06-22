#!/bin/bash
# Verdent Trial Reset — Estrutura Corrigida (validada pelo Opus 4.8)

echo "Starting Verdent Reset..."

# Fechar a Verdent
pkill -i Verdent 2>/dev/null
sleep 1

# Apagar Application Support (contém storage, sentry, caches, cookies, etc.)
rm -rf ~/Library/Application\ Support/Verdent

# Apagar logs
rm -rf ~/Library/Logs/Verdent

# Apagar preferências
rm -f ~/Library/Preferences/ai.verdent.deck.plist

# Apagar saved state (se existir)
rm -rf ~/Library/Saved\ Application\ State/com.verdent.app.savedState 2>/dev/null

# ⚠️ Pasta oculta descoberta pelo Opus 4.8
rm -rf ~/.verdent

echo ""
echo "✅ Reset completo."
echo "Agora:"
echo "1. Liga a VPN (Warp) para mudar de IP."
echo "2. USA UM EMAIL NOVO (nunca usado no Verdent)."
echo "3. Abre a Verdent — ela vai recriar o anchor e device_id do zero."
echo ""
echo "NOTA: Se o servidor pedir cartão de crédito, não há script local que resolva."
