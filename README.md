# LOCI Marketplace

A persistent second brain for Claude Code — memory, recall, knowledge management, and structured workflows via Obsidian vault.

## Quick Start

### 1. Install QMD + LOCI Core

```bash
# Search engine (required)
npm install -g @tobilu/qmd
claude mcp add qmd --github tobi/qmd

# LOCI CLI
git clone https://github.com/dukesmith0/loci-core.git
cd loci-core && npm install && npm run build && npm link
loci setup
```

### 2. Add the Marketplace

```bash
claude plugin marketplace add dukesmith0/loci-marketplace
```

### 3. Install Plugins

```
claude plugin install loci-brain@loci-marketplace
claude plugin install loci-code@loci-marketplace
claude plugin install loci-thoughts@loci-marketplace
claude plugin install loci-study@loci-marketplace
claude plugin install loci-career@loci-marketplace
```

**Start with `loci-brain`** — it's the foundation. Install others based on your use case:

| You are a... | Install | Key commands |
|-------------|---------|-------------|
| **Anyone** | `loci-brain` | `/loci-add`, `/loci-query`, `/loci-reflect` |
| **Developer** | + `loci-code` | `/loci-init`, `/loci-plan`, `/loci-go` |
| **Student** | + `loci-study` | `/loci-notes`, `/loci-study`, `/loci-teach` |
| **Strategist** | + `loci-thoughts` | `/loci-brainstorm`, `/loci-ideate`, `/loci-research` |
| **Job Seeker** | + `loci-career` | `/loci-apply`, `/loci-contact`, `/loci-prep` |

### 4. Verify

Start a new Claude Code session. The SessionStart hook loads your brain context. Type `/loci-help` to see all commands and role-based quick starts.

---

## Plugins

### loci-brain (Required)

**Core brain access.** 11 skills, 8 agents, 4 hooks.

| Skill | What it does |
|-------|-------------|
| `/loci-query` | Search vault + project context. Auto-depth, origin-weighted, hub-aware. |
| `/loci-add` | Store knowledge. 5Ws extraction, origin-tracked, conflict detection, hub integration. |
| `/loci-log` | Quick capture — timestamped entry to daily note. |
| `/loci-reflect` | Pattern analysis, hub health, origin audit, memory consolidation. |
| `/loci-maintain` | Diagnose + auto-repair: broken links, stale content, schema compliance, quality audit. |
| `/loci-sync` | Git sync vault. `--status` for brain state report. |
| `/loci-wrapup` | Session close: update .loci, crash-buffer, hub changelog, reindex, sync. |
| `/loci-morning` | Morning briefing: calendar, priorities, open threads, vault health, quality alerts. |
| `/loci-hub` | Create, lookup, or deep-dive a tag hub with quality metrics. |
| `/loci-help` | List all skills by frequency of use. |

**Hooks:** SessionStart (loads brain), SessionEnd (crash-buffer + auto-commit + sync), PostToolUse (tracks access + logs changes).

**Agents:** classifier, hub-analyzer, session-reporter, splitter, researcher, summarizer.

**Data Governance:** Origin tracking (`direct` > `inferred` > `generated`), 5Ws extraction, source preservation, feedback loop defense, hub-aware retrieval with TF-IDF scoring.

---

### loci-code

**Development workflow.** 10 skills, 5 agents.

| Skill | What it does |
|-------|-------------|
| `/loci-init` | Scaffold `.loci/` project framework, register in brain. |
| `/loci-plan` | Task decomposition with hub-aware context, origin-weighted. Asks clarifying questions. |
| `/loci-go` | Execute next plan item. |
| `/loci-ralph` | Iterative execution loop with stuck detection. |
| `/loci-oneshot` | Quick task, no plan needed. |
| `/loci-review` | Code review with severity ratings. |
| `/loci-simplify` | Refactor for clarity. |
| `/loci-risks` | Security + architecture risk analysis. |
| `/loci-diff` | Git history analysis grouped by topic. |
| `/loci-consolidate` | Compress .loci/ files when >200 lines. |

**Agents:** codebase-explorer, planner, reviewer, validator, diff-analyst.

---

### loci-thoughts

**Structured thinking.** 4 skills, 2 agents.

| Skill | What it does |
|-------|-------------|
| `/loci-brainstorm` | SCAMPER brainstorming with scoring. Hub-aware cross-pollination. |
| `/loci-ideate` | Idea generation with 3-perspective scoring. Hub + origin aware. |
| `/loci-research` | Deep research: vault + web. Origin-weighted source ranking. |
| `/loci-think` | Socratic reasoning with vault-backed insights. |

**Agents:** brainstorm-scorer, perspective-reviewer.

---

### loci-study

**Learning workflow.** 4 skills, 1 agent.

| Skill | What it does |
|-------|-------------|
| `/loci-study` | Socratic tutoring calibrated to proficiency level. |
| `/loci-teach` | Feynman technique evaluation. |
| `/loci-notes` | Course notes to vault with cross-references and hub updates. |
| `/loci-learn` | Quick concept lookup by proficiency. |

**Agents:** tutor.

---

### loci-career

**Career workflow.** 4 skills, 1 agent.

| Skill | What it does |
|-------|-------------|
| `/loci-apply` | Job fit scoring (3 dimensions), application tracking with hub integration. |
| `/loci-contact` | Create/lookup contacts with origin tracking and hub updates. |
| `/loci-prep` | Interview/meeting prep with vault context. |
| `/loci-followup` | Scan for overdue follow-ups. |

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
- **LOCI Core CLI** (`loci setup` completed)
- **Obsidian** (recommended: Calendar, Dataview, Git, QuickAdd, Templater)

## License

MIT
