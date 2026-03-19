# TALOS Marketplace

A persistent second brain for Claude Code — memory, recall, knowledge management, and structured workflows via Obsidian vault.

## Quick Start

### 1. Install TALOS Core (CLI)

```bash
git clone https://github.com/dukesmith0/talos-core.git
cd talos-core && npm install && npm run build && npm link
talos setup
```

### 2. Add the Marketplace

```bash
claude plugin marketplace add dukesmith0/talos-marketplace
```

### 3. Install Plugins

```
claude plugin install talos-brain@talos-marketplace
claude plugin install talos-code@talos-marketplace
claude plugin install talos-thoughts@talos-marketplace
claude plugin install talos-study@talos-marketplace
claude plugin install talos-career@talos-marketplace
```

**Start with `talos-brain`** — it's the foundation. All other plugins build on top of it.

### 4. Verify

Start a new Claude Code session. The SessionStart hook loads your brain context. Type `/talos-help` to see all commands.

---

## Plugins

### talos-brain (Required)

**Core brain access.** 11 skills, 8 agents, 4 hooks.

| Skill | What it does |
|-------|-------------|
| `/talos-query` | Search vault + project context. Auto-depth, origin-weighted, hub-aware. |
| `/talos-add` | Store knowledge. 5Ws extraction, origin-tracked, conflict detection, hub integration. |
| `/talos-log` | Quick capture — timestamped entry to daily note. |
| `/talos-reflect` | Pattern analysis, hub health, origin audit, memory consolidation. |
| `/talos-maintain` | Diagnose + auto-repair: broken links, stale content, schema compliance, quality audit. |
| `/talos-sync` | Git sync vault. `--status` for brain state report. |
| `/talos-wrapup` | Session close: update .talos, crash-buffer, hub changelog, reindex, sync. |
| `/talos-morning` | Morning briefing: calendar, priorities, open threads, vault health, quality alerts. |
| `/talos-hub` | Create, lookup, or deep-dive a tag hub with quality metrics. |
| `/talos-help` | List all skills by frequency of use. |

**Hooks:** SessionStart (loads brain), SessionEnd (crash-buffer + auto-commit + sync), PostToolUse (tracks access + logs changes).

**Agents:** classifier, hub-analyzer, session-reporter, splitter, researcher, summarizer.

**Data Governance:** Origin tracking (`direct` > `inferred` > `generated`), 5Ws extraction, source preservation, feedback loop defense, hub-aware retrieval with TF-IDF scoring.

---

### talos-code

**Development workflow.** 10 skills, 5 agents.

| Skill | What it does |
|-------|-------------|
| `/talos-init` | Scaffold `.talos/` project framework, register in brain. |
| `/talos-plan` | Task decomposition with hub-aware context, origin-weighted. Asks clarifying questions. |
| `/talos-go` | Execute next plan item. |
| `/talos-ralph` | Iterative execution loop with stuck detection. |
| `/talos-oneshot` | Quick task, no plan needed. |
| `/talos-review` | Code review with severity ratings. |
| `/talos-simplify` | Refactor for clarity. |
| `/talos-risks` | Security + architecture risk analysis. |
| `/talos-diff` | Git history analysis grouped by topic. |
| `/talos-consolidate` | Compress .talos/ files when >200 lines. |

**Agents:** codebase-explorer, planner, reviewer, validator, diff-analyst.

---

### talos-thoughts

**Structured thinking.** 4 skills, 2 agents.

| Skill | What it does |
|-------|-------------|
| `/talos-brainstorm` | SCAMPER brainstorming with scoring. Hub-aware cross-pollination. |
| `/talos-ideate` | Idea generation with 3-perspective scoring. Hub + origin aware. |
| `/talos-research` | Deep research: vault + web. Origin-weighted source ranking. |
| `/talos-think` | Socratic reasoning with vault-backed insights. |

**Agents:** brainstorm-scorer, perspective-reviewer.

---

### talos-study

**Learning workflow.** 4 skills, 1 agent.

| Skill | What it does |
|-------|-------------|
| `/talos-study` | Socratic tutoring calibrated to proficiency level. |
| `/talos-teach` | Feynman technique evaluation. |
| `/talos-notes` | Course notes to vault with cross-references and hub updates. |
| `/talos-learn` | Quick concept lookup by proficiency. |

**Agents:** tutor.

---

### talos-career

**Career workflow.** 4 skills, 1 agent.

| Skill | What it does |
|-------|-------------|
| `/talos-apply` | Job fit scoring (3 dimensions), application tracking with hub integration. |
| `/talos-contact` | Create/lookup contacts with origin tracking and hub updates. |
| `/talos-prep` | Interview/meeting prep with vault context. |
| `/talos-followup` | Scan for overdue follow-ups. |

**Agents:** scorer.

---

## Architecture

### Data Quality (GIGO Prevention)

Every vault write enforces:
- **Origin tracking**: `direct` (user stated) > `inferred` (derived) > `generated` (AI wrote)
- **5Ws extraction**: Who, What, When, Where, Why for ingested documents
- **Source preservation**: Original verbatim in `## Source` section
- **Structured output**: Tables and KV pairs over prose. No filler.
- **Confidence gating**: ≥0.8 auto-place, 0.5-0.8 confirm, <0.5 ask user
- **Hub dynamic updates**: Every write appends to relevant tag hub `## Connections`

### Tag Hub System

29 tag hub pages across 7 categories (languages, frameworks, tools, platforms, domains, methods, topics). Each hub has:
- Factual one-line description
- Aliases for wikilink matching
- Live Dataview query for self-maintaining connections
- Quality metrics (coverage, freshness, depth, gaps)

### Retrieval Strategy

| Scenario | Method |
|----------|--------|
| Well-covered topic (>10 docs) | QMD BM25 search |
| Sparse topic (<5 docs) | QMD semantic vector search |
| Complex question | QMD hybrid + rerank |
| Hub exploration | Read hub page → follow connections |
| 0 results | Log to `_brain/gaps.txt` |

Results ranked by origin: `direct` first, `generated` flagged.

## Requirements

- **Claude Code** (CLI or VS Code extension)
- **TALOS Core CLI** (`talos setup` completed)
- **Obsidian** (recommended: Calendar, Dataview, Git, QuickAdd, Templater)

## License

MIT
