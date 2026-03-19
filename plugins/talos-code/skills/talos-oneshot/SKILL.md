---
name: talos-oneshot
description: "Code: Quick self-contained task without a plan"
---

# /talos-oneshot — Quick Task Execution

## Step 0: Resolve Environment
Get vault path: run `talos vault` via Bash, or read `vault_path` from `~/.talos/config.yaml`.

## Steps
1. Read project context: CLAUDE.md, .talos/decisions.md
2. Implement the requested change directly
3. Run tests if applicable
4. Commit with descriptive message
5. Log via Bash: `talos log "oneshot: <brief outcome>"`

## Rules
- No plan file needed — this is for small, self-contained tasks
- If the task grows beyond ~30 minutes of work, stop and suggest /talos-plan
- Still follow project conventions from CLAUDE.md
- Update relevant .talos/ files after completing:
  - `.talos/decisions.md` — if design decisions were made
  - `.talos/bugs.md` — if bugs were found or fixed
  - `.talos/risks.md` — if new risks were discovered

## Activity Log
Run via Bash: `talos log "oneshot: <brief outcome>"`
