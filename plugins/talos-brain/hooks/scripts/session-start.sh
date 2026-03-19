#!/bin/bash
CONFIG="$HOME/.talos/config.yaml"
[ ! -f "$CONFIG" ] && exit 0
VAULT=$(grep 'vault_path:' "$CONFIG" | sed 's/vault_path: *//' | tr -d '"' | tr -d "'")
[ ! -d "$VAULT" ] && exit 0

echo "=== TALOS Brain ==="
echo "Vault: $VAULT"

# Profile and priorities — always load fully (these should be small)
[ -f "$VAULT/_brain/profile.md" ] && echo "--- Profile ---" && cat "$VAULT/_brain/profile.md"
[ -f "$VAULT/_brain/priorities.md" ] && echo "--- Priorities ---" && cat "$VAULT/_brain/priorities.md"

# Pinned memories — cap at 5 files, 10 lines each
if [ -d "$VAULT/_brain/pinned" ]; then
  count=0
  for f in "$VAULT/_brain/pinned"/*.md; do
    [ ! -f "$f" ] && continue
    [ $count -ge 5 ] && echo "--- (+more pinned files, use /talos-status to see all) ---" && break
    echo "--- Pinned: $(basename "$f" .md) ---"
    head -10 "$f"
    count=$((count + 1))
  done
fi

# Crash buffer — last 20 lines only
[ -f "$VAULT/_brain/crash-buffer.md" ] && echo "--- Open Threads ---" && tail -20 "$VAULT/_brain/crash-buffer.md"

# Brain index status (lightweight)
[ -f "$VAULT/_brain/link-index.yaml" ] && echo "--- Link Index: $(wc -l < "$VAULT/_brain/link-index.yaml") lines ---"
[ -f "$VAULT/_brain/word-freq.txt" ] && echo "--- Word Freq: $(wc -l < "$VAULT/_brain/word-freq.txt") terms ---"
[ -f "$VAULT/_brain/gaps.txt" ] && echo "--- Knowledge Gaps ---" && tail -5 "$VAULT/_brain/gaps.txt"
[ -f "$VAULT/_brain/conflicts.md" ] && grep -c "^###" "$VAULT/_brain/conflicts.md" 2>/dev/null | xargs -I{} echo "--- {} unresolved conflicts ---"

echo "=== End Brain ==="
