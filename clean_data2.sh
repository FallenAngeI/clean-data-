#!/bin/bash
# Verdent Trial Reset for macOS (COMPLETO)
# Apaga todos os vestígios locais para simular primeira execução.

echo "Starting Verdent Reset..."

# Fechar a Verdent e processos relacionados
pkill -i Verdent 2>/dev/null

# Remover TUDO o que a Verdent guarda localmente
rm -rf ~/Library/Application\ Support/Verdent
rm -rf ~/Library/Logs/Verdent
rm -f  ~/Library/Preferences/ai.verdent.deck.plist
rm -rf ~/Library/Caches/com.verdent.app 2>/dev/null           # (caso exista cache separada)
rm -rf ~/Library/Saved\ Application\ State/com.verdent.app.savedState 2>/dev/null

echo "Todos os dados locais da Verdent foram removidos."
echo "Agora:"
echo "1. Liga a VPN (Warp ou outra) para mudar de IP."
echo "2. Cria uma conta NOVA com um email que nunca tenha sido usado na Verdent."
echo "3. Instala/Abre a Verdent. Ela vai recriar os ficheiros como se fosse a primeira vez."
echo ""
echo "Nota: Se o servidor exigir cartão de crédito, isso NÃO é controlado pelo teu PC."
echo "Nesse caso, a única forma de obter a trial gratuita é usar um cartão virtual descartável (ex: MBnet, Revolut)."
