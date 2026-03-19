---
name: talos-sync
description: "Brain: Git sync vault (pull/push). Use --status for brain state report."
---

# /talos-sync — Sync Vault

## Step 0: Resolve Environment
Run `talos vault` via Bash to get vault path.

## Default: Sync
1. Run `talos sync` via Bash
2. Report files pulled/pushed and commits synced
3. If merge conflicts: list them and suggest resolution

## --status: Brain State Report
1. Run `talos health` via Bash
2. Show: vault path, file count, last sync, index age, priorities, open threads from crash-buffer
3. Show active projects from `_brain/config.yaml`

## Activity Log
Run `talos log "sync: <brief outcome>"` via Bash.
