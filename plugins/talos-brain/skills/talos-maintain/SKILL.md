---
name: talos-maintain
description: "Brain: Diagnose and repair vault issues — broken links, bad frontmatter, orphan files, stale content."
---

# /talos-maintain — Brain Maintenance

## Step 0: Resolve Environment
Run `talos vault` via Bash to get vault path.

## Pipeline (runs in order)

### 1. Diagnose
- Run `talos health` via Bash for system status
- Run `talos doctor` via Bash for auto-fixable issues

### 2. Fix (auto)
- Missing frontmatter fields → add defaults from schemas.yaml
- Broken wikilinks → find likely rename targets, update
- Missing brain files → create from defaults
- Stale locks → remove

### 3. Clean
- Run `talos index` to refresh link graph
- Find orphans (0 incoming links) and stale files (90+ days unmodified)
- Dispatch `talos-brain:archivist` agent for cleanup recommendations

### 4. Data Quality Audit
- **Origin distribution**: count notes by `origin` (direct/inferred/generated). Warn if generated >40%.
- **Confidence decay**: find `confidence: medium` notes with no `last_verified` or last verified >30 days → flag as stale.
- **Schema compliance**: check every note's frontmatter against `_brain/schemas.yaml`. Missing required fields → add defaults.
- **Hub health**: for each tag hub, check coverage (projects? references? contacts?). Flag hubs with <2 memory types.
- **Feedback loop check**: find any note where `origin: generated` that is linked from 3+ other notes → potential AI slop becoming ground truth. Flag for review.
- **Duplicate detection**: notes with >80% title overlap → flag for merge.

### 5. Report
Present summary:
| Category | Count | Action |
|----------|-------|--------|
| Auto-fixed | N | Done |
| Orphans | N | Review list |
| Stale | N | Archive candidates |
| Conflicts | N | Manual review needed |
| Quality alerts | N | Data integrity issues |
| Schema violations | N | Missing fields fixed |

Do NOT auto-delete files. Present recommendations with quality tier labels.

## Activity Log
Run `talos log "maintain: <brief outcome>"` via Bash.
