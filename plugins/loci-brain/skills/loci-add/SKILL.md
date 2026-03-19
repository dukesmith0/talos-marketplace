---
name: loci-add
description: "Brain: Store knowledge to vault. 5Ws extraction, origin-tracked, hub-integrated."
---

# /loci-add — Store Knowledge

## Step 0
Run `loci vault` via Bash. Read `_brain/schemas.yaml`.

## Step 1: Input Mode
- **Short text** → remember mode
- **Document/URL/file** → ingest mode (5 Ws extraction)
- **"Extract X from Y"** → extract mode
- **`--pin <name>`** → pin to `_brain/pinned/<name>.md`
- **`--unpin <name>`** → remove pin

## Step 2: Classify
Dispatch `loci-brain:classifier` agent → type, confidence, folder.
- ≥0.8 confidence: auto-place
- 0.5-0.8: show extraction, ask user to confirm
- <0.5: ask user to choose type

## Step 3: Extract (5 Ws Framework)

### Remember mode (short text)
One-line fact or KV pair. `origin: direct`.

### Ingest mode (documents)
Extract into structured table — NOT prose summary:

| Field | Value |
|-------|-------|
| **Who** | people, organizations, authors |
| **What** | core finding, concept, or fact |
| **When** | dates, time periods, deadlines |
| **Where** | locations, contexts, platforms |
| **Why** | motivation, significance, implications |
| **Source** | URL, author, publication |
| **Confidence** | high/medium/low (based on source quality) |

Then add `## Source` section with original verbatim text.

If confidence <0.8: present extraction table to user for review before writing. "Here's what I extracted — confirm or edit."

### Extract mode
Pull topic from existing note → new standalone note with backlink.

## Step 4: Quality Gates

### Multi-Topic Split
3+ distinct topics → dispatch `loci-brain:splitter` agent → separate notes, each with own 5 Ws, cross-linked.

### Conflict Detection (facts only)
QMD `query` for the topic. If existing fact contradicts new one: show both, ask user. Log unresolved to `_brain/conflicts.md`.

### Tag Quality
Prefer existing hub tags over inventing new ones. Hub-worthy: named tools/languages/domains. Skip: generic (`project`, `brainstorm`).

## Step 5: Write

### Rules (no AI slop)
- Facts = one line. Tables over prose. No empty sections. No filler.
- Reformat user's words (bullets, tables) but never rephrase.

### Frontmatter
- All required fields per schema + `origin: direct|inferred|generated` + `aliases`

### Hub Update (MANDATORY on every write)
After writing the note:
1. Glob `tags/**/*.md`. For each tag on the new note that matches a hub (by name or alias):
   - Read the hub's `## Connections` section
   - If new note is NOT already listed: append `- [[new-note-filename]] — one-line description`
   - This keeps hub pages as **live indexes** that grow with every vault write
2. If a tag appears on 3+ notes but has no hub → auto-create via `/loci-hub`
3. Run `loci update` via Bash to reindex + embed new content for search

### Log
`loci log "add: <type> <filename> (origin: <origin>)"`

## Output
What stored, where, type, origin, hub updates.
