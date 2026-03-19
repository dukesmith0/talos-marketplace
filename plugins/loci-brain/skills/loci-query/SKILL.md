---
name: loci-query
description: "Brain: Search vault and project context for answers. Auto-selects depth. Hub-aware. Origin-weighted."
---

# /loci-query — Ask the Brain

## Step 0: Resolve Environment
Run `loci vault` via Bash to get vault path.

## Step 1: Hub Check
Glob `tags/` for hub pages matching query keywords. If a hub matches, read it first — it provides: connected projects, references, contacts, gaps, and cross-pollination context.

## Step 2: Determine Scope
- **Vault question** (knowledge, people, facts): search vault via QMD
- **Project question** (code, bugs, architecture): read `.loci/` files
- **Both**: search vault first, then project context

## Step 3: Auto-Depth
- **Simple** (who/what/when): QMD query, top 3 results → direct answer
- **Broad** ("everything about X"): QMD + link-index + journal → brief by memory type
- **Deep** ("recall everything"): QMD + link-index + word-freq → full picture + gaps

## Step 4: Origin-Weighted Ranking
When presenting results from multiple sources, rank by provenance:
1. `origin: direct` (user stated) — highest trust, present first
2. `origin: inferred` (derived from context) — medium trust
3. `origin: generated` (Claude wrote) — lowest trust, flag as "AI-generated"

**Why**: prevents synthetic feedback loop — Claude's own summaries should not be treated as ground truth.

## Step 5: Answer
- Synthesize answer from sources, citing `[vault]`, `[project]`, or `[both]`
- Cite with [[wikilinks]] for vault files or `file:line` for code
- If hub gaps found: mention them ("Note: no references on this topic in vault")
- If 0 results: "No knowledge found" → log to `_brain/gaps.txt`

## Activity Log
Run `loci log "query: <brief outcome>"` via Bash.
