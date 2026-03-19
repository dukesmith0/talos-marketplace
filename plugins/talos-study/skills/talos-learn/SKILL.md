---
name: talos-learn
description: "Study: Quick concept lookup calibrated to proficiency level"
---

# /talos-learn — Quick Concept Lookup

## Step 0: Resolve Environment
Get vault path: run `talos vault` via Bash, or read `vault_path` from `~/.talos/config.yaml`.

## Steps
1. Search vault via QMD for the concept
2. Check course files for proficiency context
3. Explain at the user's proficiency level:
   - Level 0-1: Simple analogy + core definition
   - Level 2: Definition + how to apply + example
   - Level 3-4: Nuances, edge cases, connections to other concepts
4. Cite vault sources with [[wikilinks]]
5. If concept not in vault: explain from knowledge, suggest saving via /talos-remember

## Output
Concise explanation calibrated to user's level. Not a lecture — a quick reference.

## Activity Log
Run via Bash: `talos log "learn: <brief outcome>"`
