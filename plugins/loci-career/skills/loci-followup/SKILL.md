---
name: loci-followup
description: "Career: Scan for overdue follow-ups across contacts and applications"
---

# /loci-followup — Scan for Overdue Follow-ups

## Step 0: Resolve Environment
Run `loci vault` via Bash to get vault path.

## Steps
1. QMD `search` for "followup" to find notes with follow-up dates. Fallback: Glob `career/contacts/*.md` and `career/applications/*.md`.
2. Read frontmatter of results — find notes with `followup` or `followup_date` field
3. Compare to today — flag overdue items
4. Prioritize: days overdue (most first), then importance (applications > contacts)

## Output
Prioritized table:
| Name | Type | Follow-up Date | Days Overdue | Suggested Action |

Offer to draft follow-up messages for selected items.
Log: `loci log "followup: <brief outcome>"`
