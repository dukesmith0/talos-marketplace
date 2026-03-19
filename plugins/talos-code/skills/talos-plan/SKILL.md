---
name: talos-plan
description: "Code: Decompose task into checkable plan. Hub-aware, asks clarifying questions."
---

# /talos-plan — Decompose Task into Plan

## Step 0
Run `talos vault` via Bash.

## Step 1: Gather Context
1. Read `.talos/index.md`, `.talos/plan.md`, `.talos/decisions.md`, `.talos/bugs.md`, `CLAUDE.md`
2. Recent `git log --oneline -10`
3. **Hub check**: glob `tags/` for hubs matching task keywords. Read matching hubs for existing project patterns, tools used, gaps. Cross-pollinate from prior work.

## Step 2: Clarify (BEFORE planning)
Ask if unclear:
- What does "done" look like?
- Constraints? (timeline, tech, backwards compat)
- Scope? (MVP vs full, in/out)
- Dependencies on external systems/people?

## Step 3: Plan
Dispatch `talos-code:planner` agent with task + context + hub insights.

When referencing vault knowledge for planning context, prioritize by origin:
1. `origin: direct` — user-stated facts, requirements, constraints (highest trust)
2. `origin: inferred` — derived from code/context (medium trust)
3. `origin: generated` — AI-written summaries (lowest trust, verify before relying on)

Write to `.talos/plan.md`:
- Items completable in one sitting
- Dependencies between items
- Complexity: [simple], [moderate], [complex]

## Output
Display plan. Ask for approval. Log: `talos log "plan: <brief outcome>"`
