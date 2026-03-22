#!/usr/bin/env bash
set -euo pipefail

PLIST_NAME="com.davidjbeveridge.openclaw-daemon.plist"
PLIST_SRC="$(cd "$(dirname "$0")" && pwd)/$PLIST_NAME"
PLIST_DEST="$HOME/Library/LaunchAgents/$PLIST_NAME"

echo "Installing openclaw-daemon..."

cp "$PLIST_SRC" "$PLIST_DEST"
launchctl load "$PLIST_DEST"

echo "Installed and started. Logs: $(dirname "$0")/daemon.log"
