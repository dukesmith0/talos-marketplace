---
name: loci-wrapup
description: "Brain: Session close — update .loci, crash-buffer, hub changelog, reindex, sync."
---

# /loci-wrapup — Session Close

## Step 0
Run `loci vault` via Bash.

## Pipeline (12 steps)

1. **Update .loci/** — mark completed plan items, add new bugs/decisions/risks
2. **Crash buffer** — write open threads + "what's next" to `_brain/crash-buffer.md`
3. **Priorities** — update `_brain/priorities.md` if focus shifted
4. **Daily reflection** — dispatch `loci-brain:session-reporter` agent → append to `## Reflection`
5. **Knowledge gaps** — 0-result queries → `_brain/gaps.txt`
6. **Doctor** — `loci doctor` via Bash
7. **Consolidate** — if any `.loci/` file >200 lines, compress (collapse completed, archive old bugs)
8. **Hub changelog** — report hub health changes: new hubs created, connections added, gaps filled
9. **Origin audit** — count notes by origin (direct/inferred/generated). Flag if generated >50%.
10. **Reindex** — `loci index --full` + `loci wordfreq` via Bash
11. **Sync** — `loci sync` via Bash
12. **Log** — `loci log "wrapup: <session summary>"`

## Output
Session summary: items completed, knowledge stored, hub changes, origin distribution, open threads.
