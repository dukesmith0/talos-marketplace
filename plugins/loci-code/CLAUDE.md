# LOCI Code — Development Workflow

## Agent Rules

- Use agents for **reading and analysis only** (exploring, reviewing, validating)
- Do NOT use agents for **writing code** — agents lack sufficient project context for safe edits
- All code writes happen in the main context where CLAUDE.md and .loci/ files are loaded
- Prefer `loci` CLI commands over manual file operations when available

## .loci/ File Updates

Update these files throughout development, not just at init:

| File | When to Update |
|------|----------------|
| `.loci/plan.md` | Mark items `[x]` after completing, add new items if scope changes |
| `.loci/bugs.md` | When bugs are found or fixed during any task |
| `.loci/decisions.md` | When design decisions are made during implementation |
| `.loci/risks.md` | When new risks are discovered or existing risks are mitigated |
| `.loci/index.md` | When project structure, tech stack, or components change significantly |

## Workflow

1. **Before coding**: read `.loci/index.md`, `.loci/decisions.md`, `CLAUDE.md` for context
2. **During coding**: follow project conventions, run tests after changes
3. **After coding**: update relevant `.loci/` files, commit, log activity via `loci log`

## Documentation Review

When reviewing code, also check README.md and .md documentation files. If code changes invalidate documented behavior, update the docs or flag as a review finding.
