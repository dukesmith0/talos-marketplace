---
name: talos-hub
description: "Brain: Deep-dive a tag hub — quality metrics, connections, gaps, cross-pollination."
---

# /talos-hub — Hub Analysis

## Step 0
Run `talos vault` via Bash. Glob `tags/` to find the hub page matching the argument.

## Step 1: Analyze
Dispatch `talos-brain:hub-analyzer` agent with the tag name. Agent computes 5 quality dimensions:
- **Accuracy**: avg confidence of linked notes (0-10)
- **Consistency**: % with complete frontmatter (0-10)
- **Completeness**: memory type coverage — projects/references/contacts/facts/ideas (0-10)
- **Timeliness**: days since last linked note modified (0-10)
- **Relevance**: inlink count relative to vault size (0-10)
- **Overall**: average of all 5

## Step 2: Present
Show health table, all connections grouped by type, gaps, and suggestions.

If hub doesn't exist but tag appears 3+ times: offer to create it.

## Step 3: Cross-Pollinate
Read sibling hubs (same `tags/<category>/`). Suggest connections: "Python hub links to pytherm and librerag. FastAPI hub also links to librerag — consider connecting Python learning resources to FastAPI patterns."

## Activity Log
`talos log "hub: <tag> — Q=X.X, gaps: <list>"`
