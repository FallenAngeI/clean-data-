#!/bin/bash
# Verdent Trial Reset — Completo e corrigido (macOS)
# Apaga todos os vestígios locais conhecidos do Verdent.

echo "=== Verdent Reset ==="

# 1. Fechar a aplicação (se estiver a correr)
pkill -i Verdent 2>/dev/null
sleep 1

# 2. Remover a pasta principal de suporte (Application Support)
rm -rf ~/Library/Application\ Support/Verdent

# 3. Remover logs
rm -rf ~/Library/Logs/Verdent

# 4. Remover preferências
rm -f ~/Library/Preferences/ai.verdent.deck.plist

# 5. Remover saved state (se existir)
rm -rf ~/Library/Saved\ Application\ State/com.verdent.app.savedState 2>/dev/null

# 6. ⚠️ Pasta oculta descoberta pelo Opus 4.8 e confirmada pelo teu find
# Contém workspaces, base de dados de sessões, config e o "lastLoggedInUserId"
if [ -d ~/.verdent ]; then
    echo "A remover ~/.verdent (pode pedir password para sudo)..."
    sudo rm -rf ~/.verdent
fi

echo ""
echo "✅ Reset completo. Todos os dados locais do Verdent foram apagados."
echo ""
echo "Agora:"
echo "1. Liga a VPN (Warp) para mudar de IP público."
echo "2. Usa um email NOVO (nunca usado no Verdent)."
echo "3. Abre o Verdent — ele vai gerar um novo anchor e device_id."
echo ""
echo "NOTA: Se o servidor pedir cartão de crédito, isso é uma verificação server‑side"
echo "      e não pode ser contornada com scripts locais."
echo "      Nesse caso, usa um cartão virtual descartável (ex: MBnet, Revolut)."
