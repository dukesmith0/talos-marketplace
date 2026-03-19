---
name: loci-reflect
description: "Brain: Reflection, pattern analysis, and hub health assessment."
---

# /loci-reflect — Reflection & Pattern Analysis

## Step 0
Run `loci vault` via Bash.

## Step 1: Activity Analysis
1. Read last 7 daily notes from `journal/`
2. `git log --oneline -30` in vault
3. Read `_brain/gaps.txt` for knowledge gaps

## Step 2: Hub Health Analysis
Glob `tags/**/*.md`. For each hub, quick-assess:
- Count inlinks (how connected?)
- Check memory type coverage (projects? references? contacts? facts?)
- Flag hubs with gaps: "Python: 3 projects, 0 references — consider adding learning resources"
- Flag hubs with low relevance: 0 inlinks = orphan hub

## Step 3: Generate Reflection
- **Themes**: what dominated this period
- **Progress**: what moved forward
- **Hub health**: strongest hubs, biggest gaps, suggested actions
- **Knowledge gaps**: queries with 0 results from gaps.txt
- **Origin distribution**: how many notes are `direct` vs `generated`? High `generated` ratio = feedback loop risk.

## Weekly mode ("weekly" arg)
Compress 7 daily notes → `journal/weekly/YYYY-WNN.md`. Preserve key facts/decisions.

## Step 4: Quality Audit
- Count notes by `origin`: direct vs inferred vs generated. If generated >40% of total vault, warn: **feedback loop risk**.
- Check `confidence` fields: any `low` confidence notes older than 14 days → flag for re-verification or removal.
- Check `last_verified` on facts: any fact not verified in 30+ days and `confidence: medium` → flag as stale.
- Prioritize `origin: direct` sources when summarizing themes — never let generated content dominate the reflection.

## Memory Consolidation
Topic in 3+ daily notes without dedicated note → ask: "Create a knowledge note?"
Tag in 3+ notes with no hub page → offer: "Create a hub for [[tag]]?"

## Output
Write to today's daily note `## Reflection`. Include origin distribution stats. Log: `loci log "reflect: <brief outcome>"`
