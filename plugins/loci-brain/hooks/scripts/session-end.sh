#!/bin/bash
CONFIG="$HOME/.loci/config.yaml"
[ ! -f "$CONFIG" ] && exit 0
VAULT=$(grep 'vault_path:' "$CONFIG" | sed 's/vault_path: *//' | tr -d '"' | tr -d "'")
[ ! -d "$VAULT" ] && exit 0

# Write session timestamp to crash-buffer for next session recovery
CRASH="$VAULT/_brain/crash-buffer.md"
if [ -f "$CRASH" ]; then
  echo "" >> "$CRASH"
  echo "## Session ended: $(date +%Y-%m-%d\ %H:%M)" >> "$CRASH"
fi

# Log session end to daily note
if command -v loci >/dev/null 2>&1; then
  loci log "session-end: auto-save and sync" 2>/dev/null
fi

# Git commit vault changes
cd "$VAULT"
if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
  git add -A -- '*.md' '*.yaml' '*.txt' '*.gitkeep' 2>/dev/null
  git commit -m "session auto-save $(date +%Y-%m-%d_%H:%M)" 2>/dev/null
fi

# Sync and background update
if command -v loci >/dev/null 2>&1; then
  loci sync 2>/dev/null
  loci update --background 2>/dev/null || loci update 2>/dev/null &
fi
