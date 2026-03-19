---
name: loci-diff
description: "Code: Project git history analysis grouped by topic"
---

# /loci-diff — Project Git History Analysis

## Step 0: Resolve Environment
Get vault path: run `loci vault` via Bash, or read `vault_path` from `~/.loci/config.yaml`.

## Steps
1. Run `git log --oneline -20` in current project directory
2. Run `git diff --stat HEAD~10` for file-level changes
3. Dispatch `loci-code:diff-analyst` agent with the git log and diff output to:
   - Group changes by area (features, bugs, refactoring, config/infra)
   - Identify patterns: hot files, active areas, neglected areas

## Output
Narrative summary of recent project changes grouped by topic. Not raw git output.

## Activity Log
Run via Bash: `loci log "diff: <brief outcome>"`
