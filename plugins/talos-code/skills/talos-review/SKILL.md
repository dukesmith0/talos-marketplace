---
name: talos-review
description: "Code: Code review with severity ratings and brain-aware standards"
---

# /talos-review — Code Review

## Step 0: Resolve Environment
Get vault path: run `talos vault` via Bash, or read `vault_path` from `~/.talos/config.yaml`.

## Steps
1. Read coding preferences:
   - `_brain/profile.md` for personal coding preferences (if exists)
   - If `_brain/profile.md` doesn't exist, fall back to `CLAUDE.md` conventions only
   - Search vault via QMD for 'code standards' and reference any found
2. Get changes to review:
   - If PR/branch specified: `git diff main...HEAD`
   - If no arg: `git diff HEAD~1` (last commit)
   - If file specified: review that file
3. Read `.talos/index.md` for tech stack context and `.talos/decisions.md` for prior decisions
4. Dispatch `talos-code:reviewer` agent with the diff/file content, coding standards, and .talos context to analyze for:
   - **Bugs**: logic errors, off-by-one, null handling, race conditions
   - **Security**: injection, auth bypass, data exposure, OWASP top 10
   - **Performance**: N+1 queries, unnecessary allocations, missing indexes
   - **Style**: naming, dead code, complexity, readability
   - **Tests**: missing coverage, edge cases, assertions
   - **Documentation**: check README.md and any .md docs for accuracy — if code changes invalidate docs, flag as WARNING
5. Check `.talos/debug/` scripts — flag if they don't cover the reviewed changes
6. After review, save critical/warning findings to `.talos/bugs.md`

## Output Format
| Severity | File:Line | Issue | Suggestion |
|----------|-----------|-------|------------|

Severities: CRITICAL, WARNING, SUGGESTION

End with summary: X critical, Y warnings, Z suggestions.

## Activity Log
Run via Bash: `talos log "review: <brief outcome>"`
