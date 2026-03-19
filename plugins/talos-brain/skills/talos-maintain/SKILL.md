---
name: talos-maintain
description: "Brain: Diagnose and repair vault issues — broken links, bad frontmatter, orphan files, stale content."
---

# /talos-maintain

## Step 0
Run `talos vault` via Bash.

## Pipeline

### 1. System Check
Run `talos health` then `talos doctor` via Bash.

### 2. Auto-Fix
- Missing frontmatter → add defaults from `_brain/schemas.yaml`
- Broken wikilinks → find rename targets, update
- Stale locks → remove

### 3. Reindex
Run `talos index --full` to rebuild link graph.

### 4. Quality Audit
Run `talos stats` via Bash for computed metrics. Then:
- Orphan files: 0 incoming links, 90+ days old → flag
- Origin ratio: warn if `generated` >40% of vault
- Schema compliance: check required fields per type
- Hub coverage: flag hubs with <2 memory types
- Feedback loop: `origin: generated` notes with 3+ inlinks → flag

### 5. Report
| Category | Count | Action |
|----------|-------|--------|
| Auto-fixed | N | Done |
| Orphans | N | Review list |
| Quality alerts | N | Integrity issues |

Do NOT auto-delete. Present recommendations.

## Log
`talos log "maintain: <brief outcome>"`
