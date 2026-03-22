#!/usr/bin/env bash
set -euo pipefail

PLIST_NAME="com.davidjbeveridge.openclaw-daemon.plist"
PLIST_DEST="$HOME/Library/LaunchAgents/$PLIST_NAME"

echo "Uninstalling openclaw-daemon..."

if launchctl list | grep -q "com.davidjbeveridge.openclaw-daemon"; then
  launchctl unload "$PLIST_DEST"
fi

rm -f "$PLIST_DEST"

echo "Uninstalled."
