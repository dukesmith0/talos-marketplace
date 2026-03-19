---
name: loci-apply
description: "Career: Job fit scoring and application tracking"
---

# /loci-apply — Job Application Analysis

## Step 0: Resolve Environment
Run `loci vault` via Bash to get vault path.

## Steps
1. Ingest job description (user input, URL, or file)
2. Read `_brain/profile.md` for user background
3. Dispatch `loci-career:scorer` agent with job description + profile. Scores 3 dimensions (0-10):
   - **Relevance**: experience alignment
   - **Fit-to-role**: requirements match
   - **Role-fit-to-user**: goal/preference match
4. Identify strengths, gaps, and talking points
5. Create `$VAULT/career/applications/<company>-<role>.md`:
   - Frontmatter: type, company, role, applied_date, status: applied, fit_score, followup_date, `origin: direct`
   - Content: structured tables (fit scores, talking points). No prose padding.
   - Wikilinks: link company name, technologies, contacts mentioned
6. **Hub update**: for relevant tag hubs (company industry, tech stack), append to `## Connections`
7. Log: `loci log "apply: <brief outcome>"`

## Output
Fit scores, gap analysis, talking points, and tracker file location.
