#!/usr/bin/env bash
set -euo pipefail

OS="$(uname -s)"

case "$OS" in
  Linux*)
    if ! command -v loginctl >/dev/null 2>&1; then
      echo "loginctl not found. This script is for Linux systemd only." >&2
      exit 1
    fi
    sudo loginctl enable-linger "$USER"
    echo "Linger enabled for $USER."
    ;;
  Darwin*)
    echo "Linger is a Linux systemd feature; not applicable on macOS." >&2
    ;;
  MINGW*|MSYS*|CYGWIN*)
    echo "Linger is a Linux systemd feature; not applicable on Windows." >&2
    ;;
  *)
    echo "Unknown OS: $OS" >&2
    ;;
esac
