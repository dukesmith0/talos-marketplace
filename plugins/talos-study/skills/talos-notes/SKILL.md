---
name: talos-notes
description: "Study: Capture course notes to vault with cross-references"
---

# /talos-notes — Capture Course Notes

## Step 0: Resolve Environment
Get vault path: run `talos vault` via Bash, or read `vault_path` from `~/.talos/config.yaml`.

## Steps
1. Take the user's notes content
2. Search vault for related course materials and existing notes
3. Create note in vault:
   - Frontmatter: `type: reference`, `origin: direct` (user's own notes), `tags: [study-note, <course>]`, `date`, `topic`
   - Content: structured tables and bullets. **User's words** — reformat but never rephrase.
   - Wikilinks to course materials and related vault notes
4. Cross-reference: link to existing notes on overlapping concepts

**Hub update**: for each tag with a hub in `tags/`, append new note to `## Connections`.

## Output
Confirm note saved with path, origin, and cross-references created.

## Activity Log
Run via Bash: `talos log "notes: <brief outcome>"`
