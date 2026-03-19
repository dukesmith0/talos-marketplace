---
name: talos-init
description: "Code: Scaffold .talos/ project framework with brain registration"
---

# /talos-init — Scaffold Project Framework

Idempotent — if `.talos/` exists, update and fill gaps. If new, create everything.

## Step 0: Resolve Environment
Run `talos vault` via Bash to get vault path. Read `~/.talos/config.yaml` for full config.

## Step 1: Analyze Codebase (read-only)

**This step runs EVERY time**, even if `.talos/` exists. The analysis feeds all subsequent steps.

Dispatch the `talos-code:codebase-explorer` agent with this prompt:

> Analyze the project at `{{PROJECT_PATH}}`. Map: tech stack with versions, directory structure (3 levels), all entry points, key components and responsibilities, build/test/lint commands, coding conventions, dependencies. Grep for `TODO`, `FIXME`, `HACK`, `BUG`, `XXX`. Note architectural decisions and risks. Also read README.md and any other .md documentation files for project context. Return everything as structured data.

Wait for the agent to complete. Its output feeds Steps 2-6.

## Step 2: Create/Update .talos/ Files

Use `talos template` CLI to get template list if available. Otherwise create from scratch.

**If `.talos/` does NOT exist**: Create all files populated with agent data.

**If `.talos/` ALREADY exists**: Read each file. If tables are empty or content is placeholder, populate from agent data. If real user content exists, preserve it and add missing sections only.

### Files to create/update:

- **`.talos/index.md`** — Full project overview. MUST include: Overview, Tech Stack table, Structure table, Entry Points, Key Components, Dependencies, Conventions, Architecture Notes. Populate every section from agent output.
- **`.talos/plan.md`** — Create from template if missing. Don't overwrite if it has items.
- **`.talos/bugs.md`** — Populate with TODOs/FIXMEs/HACKs found by agent. Preserve existing entries.
- **`.talos/decisions.md`** — Populate with architectural decisions found by agent. Preserve existing entries.
- **`.talos/risks.md`** — Populate with risks found by agent. Preserve existing entries.

**CRITICAL**: Every file must have real content after init. No empty tables.

## Step 3: Merge CLAUDE.md

This step requires explicit user interaction for safety.

**If CLAUDE.md exists:**
1. Read existing CLAUDE.md fully
2. Check if it has a `## TALOS Project Files` section
3. If no TALOS section: **show the user exactly what you plan to append** and ask "Add TALOS section to existing CLAUDE.md?" — wait for explicit yes/no
4. If TALOS section exists but is outdated: show the diff and ask to update
5. If there are conflicts between existing conventions and TALOS conventions: **present both versions and ask the user to choose** — never silently override
6. Do NOT modify any existing content without user approval

**If no CLAUDE.md exists:** Create one with project info from agent output + TALOS section.

The TALOS section to append/create:
```markdown
## Git Commits
- **NEVER add Co-Authored-By lines** to commit messages. All commits are authored solely by the user.

## TALOS Project Files
- `.talos/index.md` — project overview, architecture, components
- `.talos/bugs.md` — bug tracking
- `.talos/decisions.md` — decision log
- `.talos/risks.md` — risk register
- `.talos/plan.md` — active plan (use /talos-plan)
```

## Step 4: Register Project in Brain

Read `$VAULT/_brain/config.yaml`. Add under `projects:` if not already registered:
```yaml
projects:
  {{PROJECT_NAME}}:
    path: {{absolute path}}
    vault_entry: projects/{{name}}.md
```

## Step 5: Create Vault Project Entry

Create `$VAULT/projects/{{PROJECT_NAME}}.md` (skip if exists). Read `_brain/link-index.yaml` for entities and **insert wikilinks inline as you write**.

Include: frontmatter (type: project, tags, status, created, repo), Overview, Tech Stack table, Key Components (top 5), Architecture summary, Active Risks (top 3).

## Step 6: Log

Run via Bash: `talos log "init: {{PROJECT_NAME}} at {{path}}"`
