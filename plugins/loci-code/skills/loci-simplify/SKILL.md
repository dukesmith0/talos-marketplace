---
name: loci-simplify
description: "Code: Refactor code for clarity while preserving behavior"
---

# /loci-simplify — Simplify Code

## Step 0: Resolve Environment
Get vault path: run `loci vault` via Bash, or read `vault_path` from `~/.loci/config.yaml`.

## Steps
1. Read `.loci/decisions.md` for context on why code is structured this way before simplifying.
2. Identify target:
   - If file/function specified: review that
   - If no arg: review recently changed files (`git diff --name-only HEAD~3`)
3. Analyze for complexity:
   - Duplicated logic → extract shared function
   - Deep nesting → early returns, guard clauses
   - Long functions → decompose
   - Unnecessary abstractions → inline
   - Complex conditionals → named booleans or lookup tables
4. Refactor while preserving ALL functionality
5. Dispatch `loci-code:validator` agent to verify no regressions (run tests, check behavior)
6. Commit with descriptive message

## Rules
- Every simplification must preserve behavior
- If unsure about a change, skip it and note it
- Prefer readability over cleverness
- Update `.loci/decisions.md` if refactoring changes architecture decisions

## Activity Log
Run via Bash: `loci log "simplify: <brief outcome>"`
