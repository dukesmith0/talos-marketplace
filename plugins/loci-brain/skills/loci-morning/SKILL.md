---
name: loci-morning
description: "Brain: Morning briefing — calendar, priorities, open threads, vault health."
---

# /loci-morning — Morning Brief

## Step 0
Run `loci vault` via Bash.

## Steps
1. **Calendar** — if Google Calendar MCP available, fetch today's events. Write to daily note `## TODO`:
   ```
   - [ ] 09:00–10:15 — MAE 154B Lecture
   - [ ] 14:00–16:00 — FSAE Team Meeting
   ```
2. **Open threads** — read `_brain/crash-buffer.md`
3. **Priorities** — read `_brain/priorities.md`
4. **Emails** — if Gmail MCP available, scan last 24h for high-importance (known contacts, job-related, deadlines)
5. **Vault health** — quick stats:
   - Total notes, total hubs, total tags
   - Top 3 strongest hubs (by inlink count)
   - Top 3 gaps (hubs missing memory types)
   - Origin distribution: N direct, N generated (flag if generated > 50%)

## Output
```
## Morning Brief — YYYY-MM-DD
### Schedule (N events)
### Open Threads
### Priorities
### Vault Health (N notes, N hubs, top gaps)
### Flagged Emails (if any)
```
### Quality Alerts (if any)
- Stale facts (>30 days, confidence: medium)
- Generated content ratio warning (>40%)
- Hub pages with 0 inlinks (orphan hubs)

When summarizing open threads and priorities, prefer `origin: direct` notes. Flag generated summaries as "(AI-generated)" so user knows provenance.

Log: `loci log "morning: briefing generated"`
