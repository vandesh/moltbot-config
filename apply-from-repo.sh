#!/usr/bin/env bash
set -euo pipefail

# Apply repo config to local Clawdbot/Moltbot config and restart gateway
CONFIG_DIR="${MOLTBOT_CONFIG_DIR:-$HOME/moltbot-config}"
TARGET_CONFIG_DIR="${MOLTBOT_TARGET_CONFIG_DIR:-$HOME/.clawdbot}"

cd "$CONFIG_DIR"

cp ./clawdbot.json "$TARGET_CONFIG_DIR/clawdbot.json"

# Restart gateway
moltbot gateway restart

echo "Applied repo config to $TARGET_CONFIG_DIR/clawdbot.json and restarted gateway."