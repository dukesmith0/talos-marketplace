---
name: talos-ideate
description: "Ideas: Idea generation with multi-perspective evaluation"
---

# /talos-ideate — Idea Generation with Perspective Review

## Step 0: Resolve Environment
Get vault path: run `talos vault` via Bash, or read `vault_path` from `~/.talos/config.yaml`.

## Step 1: Search Context
Search vault via QMD query for existing brainstorms/ideas on this topic. Read `_brain/profile.md` to understand user's background and tailor evaluation perspectives.

## Phase 1: Generate
1. Read relevant vault results for background
2. Generate 5-10 distinct ideas/approaches
3. Each idea: 2-3 sentence description + key differentiator

## Phase 2: Evaluate
Dispatch `talos-thoughts:perspective-reviewer` agent with the ideas to score from 3 perspectives (1-10 each):

| # | Idea | User | Technical | Strategic | Avg |
|---|------|------|-----------|-----------|-----|

- **User**: ease of use, learning curve, value delivered
- **Technical**: feasibility, maintainability, performance
- **Strategic**: alignment with goals, scalability, competitive advantage

## Phase 3: Recommend
- Top pick with reasoning
- Runner-up as alternative
- What to avoid and why

## Save
Save to vault as `type: idea`, `origin: generated`, tags from topic. Use `_brain/link-index.yaml` entities for wikilinks.

**Hub update**: for each tag with a hub page in `tags/`, append new idea to hub's `## Connections`. If a tag appears 3+ times with no hub → auto-create via `/talos-hub`.

## Activity Log
Run via Bash: `talos log "ideate: <brief outcome>"`
