---
name: talos-wrapup
description: "Brain: Session close — update .talos, crash-buffer, hub changelog, reindex, sync."
---

# /talos-wrapup — Session Close

## Step 0
Run `talos vault` via Bash.

## Pipeline (12 steps)

1. **Update .talos/** — mark completed plan items, add new bugs/decisions/risks
2. **Crash buffer** — write open threads + "what's next" to `_brain/crash-buffer.md`
3. **Priorities** — update `_brain/priorities.md` if focus shifted
4. **Daily reflection** — dispatch `talos-brain:session-reporter` agent → append to `## Reflection`
5. **Knowledge gaps** — 0-result queries → `_brain/gaps.txt`
6. **Doctor** — `talos doctor` via Bash
7. **Consolidate** — if any `.talos/` file >200 lines, compress (collapse completed, archive old bugs)
8. **Hub changelog** — report hub health changes: new hubs created, connections added, gaps filled
9. **Origin audit** — count notes by origin (direct/inferred/generated). Flag if generated >50%.
10. **Reindex** — `talos index --full` + `talos wordfreq` via Bash
11. **Sync** — `talos sync` via Bash
12. **Log** — `talos log "wrapup: <session summary>"`

## Output
Session summary: items completed, knowledge stored, hub changes, origin distribution, open threads.
