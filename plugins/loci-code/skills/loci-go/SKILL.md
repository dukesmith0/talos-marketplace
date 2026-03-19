---
name: loci-go
description: "Code: Execute next unchecked plan item"
---

# /loci-go — Execute Next Plan Item

## Step 0: Resolve Environment
Get vault path: run `loci vault` via Bash, or read `vault_path` from `~/.loci/config.yaml`.

## Steps
1. Read `.loci/plan.md` — find first unchecked item
2. If no plan exists, suggest /loci-plan first
3. Read context before implementing:
   - `.loci/index.md` — tech stack, structure, conventions
   - `.loci/decisions.md` — prior design decisions to honor
   - `.loci/bugs.md` — known issues to avoid or fix
   - `CLAUDE.md` — project conventions
4. Implement the item:
   - Follow project conventions from CLAUDE.md
   - Run tests if applicable
   - Verify it works
5. Mark item `[x]` in `.loci/plan.md`
6. Update .loci/ files:
   - `.loci/bugs.md` — if bugs were found or fixed during implementation
   - `.loci/decisions.md` — if any design decisions were made
   - `.loci/risks.md` — if new risks were discovered
7. Commit with descriptive message

## Rules
- One item at a time
- If item is blocked, skip to next unblocked item and note the block
- If implementation reveals needed changes to plan, update plan and report
- After committing, log activity: `loci log "go: completed '<item description>'"`
