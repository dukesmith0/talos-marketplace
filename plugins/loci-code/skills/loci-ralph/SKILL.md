---
name: loci-ralph
description: "Code: Iterative execution loop with stuck detection"
---

# /loci-ralph — Iterative Execution Loop

## Step 0: Resolve Environment
Get vault path: run `loci vault` via Bash, or read `vault_path` from `~/.loci/config.yaml`.

## Setup
1. Clarify with user: What are the completion criteria?
2. Set max iterations (default: 10, ask user to confirm)
3. Read `.loci/index.md` and `CLAUDE.md` for project context

## Loop (each iteration)
1. **Assess**: What is the current state? What's left to do?
2. **Act**: Implement one concrete change — write code, fix a bug, add a test, update config. Run tests after each change.
3. **Check**: Are completion criteria met?
   - Yes → exit loop, report done
   - No → continue

## Stuck Detection
If same issue persists for 3+ iterations:
- Stop current approach
- Log what was tried to `.loci/bugs.md`
- Try a fundamentally different approach
- If still stuck after 2 different approaches, stop and ask user

## End
- Update `.loci/` files if bugs found or decisions made
- Log via Bash: `loci log "ralph: <iterations> iterations, <outcome>"`
- Report: iterations used, approach taken, outcome
