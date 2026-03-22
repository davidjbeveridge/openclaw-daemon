#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="${HOME}/src/openclaw-daemon/daemon.log"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

log "Starting openclaw-daemon"

while true; do
  log "Running: openclaw --fix"
  if openclaw --fix >> "$LOG_FILE" 2>&1; then
    log "openclaw --fix completed successfully"
  else
    log "openclaw --fix exited with code $?"
  fi
  log "Sleeping 1 hour..."
  sleep 3600
done
