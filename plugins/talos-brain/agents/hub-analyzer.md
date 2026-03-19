---
name: hub-analyzer
description: Analyze tag hub health across 5 quality dimensions. Use with /talos-hub for deep-dive analysis.
tools: Read, Glob, Grep, Bash
---

# Hub Analyzer Agent

## Task
Read a tag hub page, scan all inlinked files, compute quality metrics, identify gaps.

## Process
1. Run `talos vault` to get vault path
2. Read the target tag hub file from `tags/<category>/<tag>.md`
3. Glob vault for all `.md` files that contain `[[<tag-name>]]` or have the tag in frontmatter tags
4. Read each linked file's frontmatter (type, origin, confidence, tags, date/created)
5. Compute 5 quality dimensions (see formulas below)
6. Identify gaps and cross-pollination opportunities from sibling hubs (same category)

## Quality Dimensions (scored 0-10)

### 1. Accuracy (A)
Average confidence of linked notes. Only notes with `confidence` field contribute.
```
A = (sum of confidence values / count of notes with confidence) * 10
Map: high=1.0, medium=0.7, low=0.4
If no notes have confidence: A = 5 (neutral)
```

### 2. Consistency (C)
Percentage of linked notes with complete frontmatter per their schema type.
```
C = (notes with all required fields / total linked notes) * 10
```

### 3. Completeness (P)
Coverage across 5 memory types: projects, references, contacts, facts, ideas.
```
P = (types present / 5) * 10
e.g., 3 projects + 1 idea = 2/5 types = 4.0
```

### 4. Timeliness (T)
Freshness of the most recently modified linked note.
```
T = max(0, 10 - (days_since_last_modified / 30))
e.g., modified 2 days ago = 10 - 0.07 = 9.93
e.g., modified 60 days ago = 10 - 2.0 = 8.0
```

### 5. Relevance (R)
Inlink count relative to vault size.
```
R = min(10, inlink_count * (50 / total_vault_notes))
e.g., 5 inlinks out of 60 notes = 5 * 0.83 = 4.17
```

### Overall Quality Score
```
Q = (A + C + P + T + R) / 5
```

## Output
```markdown
## Hub Health: <tag name>
| Dimension | Score | Detail |
|-----------|-------|--------|
| Accuracy | X.X | avg confidence of N notes |
| Consistency | X.X | N/M notes have complete frontmatter |
| Completeness | X.X | types present: projects, ideas (missing: references, contacts, facts) |
| Timeliness | X.X | last modified N days ago |
| Relevance | X.X | N inlinks across M vault notes |
| **Overall** | **X.X** | |

## Gaps
- Missing: references (0), contacts (0), facts (0)
- Suggestion: add a Python tutorial reference, connect with Python-using contacts

## Connections (N total)
| Note | Type | Origin | Confidence |
|------|------|--------|------------|
```
