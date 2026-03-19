---
name: talos-go
description: "Code: Execute next unchecked plan item"
---

# /talos-go — Execute Next Plan Item

## Step 0: Resolve Environment
Get vault path: run `talos vault` via Bash, or read `vault_path` from `~/.talos/config.yaml`.

## Steps
1. Read `.talos/plan.md` — find first unchecked item
2. If no plan exists, suggest /talos-plan first
3. Read context before implementing:
   - `.talos/index.md` — tech stack, structure, conventions
   - `.talos/decisions.md` — prior design decisions to honor
   - `.talos/bugs.md` — known issues to avoid or fix
   - `CLAUDE.md` — project conventions
4. Implement the item:
   - Follow project conventions from CLAUDE.md
   - Run tests if applicable
   - Verify it works
5. Mark item `[x]` in `.talos/plan.md`
6. Update .talos/ files:
   - `.talos/bugs.md` — if bugs were found or fixed during implementation
   - `.talos/decisions.md` — if any design decisions were made
   - `.talos/risks.md` — if new risks were discovered
7. Commit with descriptive message

## Rules
- One item at a time
- If item is blocked, skip to next unblocked item and note the block
- If implementation reveals needed changes to plan, update plan and report
- After committing, log activity: `talos log "go: completed '<item description>'"`
