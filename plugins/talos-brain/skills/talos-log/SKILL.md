---
name: talos-log
description: "Brain: Append timestamped entry to today's daily note"
---

# /talos-log — Append to Daily Note

## Step 0: Resolve Environment
Get vault path: run `talos vault` via Bash, or read `vault_path` from `~/.talos/config.yaml`.

## Steps
1. Run `talos log "<entry content>"` via Bash
2. If CLI unavailable, manually:
   - Determine today's date (YYYY-MM-DD)
   - Find or create daily note at `$VAULT/journal/YYYY/MM/YYYY-MM-DD.md`
   - If new, add frontmatter: `date`, `type: journal`
   - Append timestamped entry under `## Auto-Log` section: `- HH:MM — <entry>`

## Args
The user's message after /talos-log is the entry content. If empty, log a session activity summary.
