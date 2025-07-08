#!/bin/bash

CMD="code serve-web --host 127.0.0.1 --port 8099"

export XDG_CACHE_HOME="$HOME/.vscode-cache"
export XDG_DATA_HOME="$HOME/.vscode-data"
export XDG_CONFIG_HOME="$HOME/.vscode-config"


log() {
  echo "$(date): $1"
}

while true; do
  log "Launching VS Code Tunnel..."
  $CMD

  EXIT_CODE=$?
  log "Tunnel exited with code $EXIT_CODE"

  if [ $EXIT_CODE -eq 0 ]; then
    log "Tunnel exited normally."
    break
  else
    log "Tunnel crashed. Restarting in 5 seconds..."
    sleep 5
  fi
done
