---
name: hub-analyzer
description: Analyze tag hub health across 5 quality dimensions. Use with /talos-hub for deep-dive analysis.
tools: Read, Glob, Grep, Bash
---

# Hub Analyzer Agent

## Task
Deep-dive a specific tag hub: compute quality metrics, identify gaps, suggest cross-pollination.

## Process
1. Run `talos stats` via Bash for precomputed metrics
2. Read the target hub page from `tags/<category>/<tag>.md`
3. Glob vault for files linking to this hub (backlinks + tag matches)
4. Read each linked file's frontmatter

## Quality Formulas (0-10 each)

| Dimension | Formula | Default |
|-----------|---------|---------|
| Accuracy | `avg(confidence_map) * 10` where high=1.0, medium=0.7, low=0.4 | 5 if no data |
| Consistency | `(notes_with_all_required_fields / total) * 10` | |
| Completeness | `(types_present / 5) * 10` (projects, references, contacts, facts, ideas) | |
| Timeliness | `max(0, 10 - days_since_last_modified / 30)` | |
| Relevance | `min(10, inlinks * 50 / total_vault_notes)` | |
| **Overall** | `(A + C + P + T + R) / 5` | |

**Division safety**: if denominator is 0, use default value. Never divide by zero.

## Output
Health table, gaps (missing memory types), connections table, cross-pollination suggestions from sibling hubs.
