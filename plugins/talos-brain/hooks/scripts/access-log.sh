#!/bin/bash
# Log vault file reads to _brain/access-log.txt
CONFIG="$HOME/.talos/config.yaml"
[ ! -f "$CONFIG" ] && exit 0
VAULT=$(grep 'vault_path:' "$CONFIG" | sed 's/vault_path: *//' | tr -d '"' | tr -d "'")
[ ! -d "$VAULT" ] && exit 0
FILE="${CLAUDE_TOOL_INPUT_FILE_PATH:-}"
[ -z "$FILE" ] && exit 0

# Normalize paths for comparison (handle Windows backslashes)
NORM_VAULT=$(echo "$VAULT" | tr '\\' '/')
NORM_FILE=$(echo "$FILE" | tr '\\' '/')

# Check if file is in vault
case "$NORM_FILE" in "$NORM_VAULT"*) ;; *) exit 0 ;; esac

# Get relative path
RELPATH="${NORM_FILE#$NORM_VAULT/}"

# Skip _brain/ system files
case "$RELPATH" in _brain/*|_templates/*) exit 0 ;; esac

# Append access record
echo "$(date +%Y-%m-%d_%H:%M) $RELPATH" >> "$VAULT/_brain/access-log.txt"
