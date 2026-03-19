---
name: talos-followup
description: "Career: Scan for overdue follow-ups across contacts and applications"
---

# /talos-followup — Scan for Overdue Follow-ups

## Step 0: Resolve Environment
Run `talos vault` via Bash to get vault path.

## Steps
1. Glob `$VAULT/career/contacts/*.md` and `$VAULT/career/applications/*.md`
2. Read frontmatter — find notes with `followup` or `followup_date` field
3. Compare to today — flag overdue items
4. Prioritize: days overdue (most first), then importance (applications > contacts)

## Output
Prioritized table:
| Name | Type | Follow-up Date | Days Overdue | Suggested Action |

Offer to draft follow-up messages for selected items.
Log: `talos log "followup: <brief outcome>"`
