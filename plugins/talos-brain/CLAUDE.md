# TALOS Brain Access

Persistent knowledge brain in an Obsidian vault. Run `talos vault` to get vault path.

## Memory Architecture

| System | Storage | Access |
|--------|---------|--------|
| Working | Context + `_brain/crash-buffer.md` | SessionStart loads automatically |
| Episodic | `journal/` daily notes | `talos log "msg"` |
| Semantic | Vault `.md` files (typed frontmatter) | QMD search tools |
| Identity | `_brain/profile.md` | Loaded every session |
| Pinned | `_brain/pinned/*.md` | Loaded every session |

## Vault Structure

| Folder | Contents |
|--------|----------|
| `_brain/` | System files (profile, priorities, schemas, indexes) |
| `journal/` | Daily notes (YYYY/MM/YYYY-MM-DD.md) |
| `projects/` | Project overview notes |
| `references/` | Reference material, facts, how-tos |
| `ideas/` | Brainstorms, proposals, concepts |
| `tags/` | Concept hub pages (languages, tools, domains, methods) |
| `career/contacts/` | People |
| `career/applications/` | Job applications |

## Writing Vault Files — DATA QUALITY RULES

1. Run `talos vault` for path
2. Read `_brain/schemas.yaml` for frontmatter fields
3. Wikilinks auto-inserted on write
4. **Always set `origin:`** — `direct` (user stated), `inferred` (derived), `generated` (Claude wrote)

### Anti-Slop (CRITICAL)
- **Facts = one line.** No wrapping a single fact in headers and sections.
- **Tables/KV pairs over prose.** Extract structured data, not summaries.
- **No empty sections.** If nothing to put there, don't create the heading.
- **No filler.** No "this note covers...", no introductions, no transitions.
- **User's words.** Reformat (bullets, tables) but never rephrase content.
- **Ingested docs:** structured extraction above, original verbatim in `## Source` below.

## CLI Commands

`talos vault` | `talos log` | `talos index --full` | `talos health` | `talos doctor` | `talos sync` | `talos search`

## Retrieval Strategy

1. Well-covered topic (>10 docs): QMD `search` (BM25)
2. Sparse topic (<5 docs): QMD `query` with `vec:` prefix (semantic)
3. Complex question: QMD `query` (hybrid + rerank)
4. 0 results → append query to `_brain/gaps.txt`
