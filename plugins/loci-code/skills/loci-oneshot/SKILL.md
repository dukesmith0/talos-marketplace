---
name: loci-oneshot
description: "Code: Quick self-contained task without a plan"
---

# /loci-oneshot — Quick Task Execution

## Step 0: Resolve Environment
Get vault path: run `loci vault` via Bash, or read `vault_path` from `~/.loci/config.yaml`.

## Steps
1. Read project context: CLAUDE.md, .loci/decisions.md
2. Implement the requested change directly
3. Run tests if applicable
4. Commit with descriptive message
5. Log via Bash: `loci log "oneshot: <brief outcome>"`

## Rules
- No plan file needed — this is for small, self-contained tasks
- If the task grows beyond ~30 minutes of work, stop and suggest /loci-plan
- Still follow project conventions from CLAUDE.md
- Update relevant .loci/ files after completing:
  - `.loci/decisions.md` — if design decisions were made
  - `.loci/bugs.md` — if bugs were found or fixed
  - `.loci/risks.md` — if new risks were discovered

## Activity Log
Run via Bash: `loci log "oneshot: <brief outcome>"`
