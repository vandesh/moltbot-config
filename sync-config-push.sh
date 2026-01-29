#!/usr/bin/env bash
set -euo pipefail

# Sync config and push to remote (requires git creds)
CONFIG_DIR="${MOLTBOT_CONFIG_DIR:-$HOME/moltbot-config}"

bash "$CONFIG_DIR/sync-config.sh"

cd "$CONFIG_DIR"
# Push only if there are new commits
if git log --oneline -1 >/dev/null 2>&1; then
  git push
fi
