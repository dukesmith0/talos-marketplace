---
name: talos-brainstorm
description: "Ideas: SCAMPER brainstorming with scoring. Hub-aware cross-pollination."
---

# /talos-brainstorm — SCAMPER Brainstorm

## Step 0
Run `talos vault` via Bash.

## Step 1: Context + Hub Seeds
1. Search vault for existing brainstorms on topic
2. **Hub check**: glob `tags/` for matching hubs + sibling hubs (same category). Read connections for cross-pollination seed material. E.g., brainstorming for rp2040 → read embedded hub + sensor-fusion hub → connected projects spark ideas.

## Phase 1: Generate (SCAMPER, 10+ ideas)
**S**ubstitute | **C**ombine | **A**dapt | **M**odify | **P**ut to other use | **E**liminate | **R**everse

## Phase 2: Score
Dispatch `talos-thoughts:brainstorm-scorer` agent:
| # | Idea | Feasibility | Impact | Novelty | Effort | Total |
Each 1-5. Total = sum.

## Phase 3: Refine top 3
Implementation approach, risks, timeline.

## Save
Save to vault as `type: idea`, `origin: generated`. Wikilinks auto-inserted.

**Hub update**: for each tag on the saved note that has a hub page in `tags/`, append the new idea to that hub's `## Connections` section. This keeps hubs dynamically current.

Log: `talos log "brainstorm: <brief outcome>"`
