---
name: loci-maintain
description: "Brain: Diagnose and repair vault issues — broken links, bad frontmatter, orphan files, stale content."
---

# /loci-maintain

## Step 0
Run `loci vault` via Bash.

## Pipeline

### 1. System Check
Run `loci health` then `loci doctor` via Bash.

### 2. Auto-Fix
- Missing frontmatter → add defaults from `_brain/schemas.yaml`
- Broken wikilinks → find rename targets, update
- Stale locks → remove

### 3. Reindex
Run `loci index --full` to rebuild link graph.

### 4. Quality Audit
Run `loci stats` via Bash for computed metrics. Then:
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
`loci log "maintain: <brief outcome>"`
