#!/bin/bash
pkill -i Verdent 2>/dev/null
sleep 1
rm -rf ~/Library/Application\ Support/Verdent
rm -rf ~/Library/Logs/Verdent
rm -f ~/Library/Preferences/ai.verdent.deck.plist
sudo rm -rf ~/.verdent

mkdir -p ~/Library/Application\ Support/Verdent/sentry/queue

NEW_DEVICE_ID=$(uuidgen | tr '[:upper:]' '[:lower:]')

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

echo "{}" > ~/Library/Application\ Support/Verdent/sentry/queue/queue-v2.json

echo '{"firstActive": true, "anchor": ""}' > ~/Library/Application\ Support/Verdent/verdent-storage.json
