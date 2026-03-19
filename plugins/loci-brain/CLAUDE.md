# LOCI Brain Access

Persistent knowledge brain in an Obsidian vault. Run `loci vault` to get vault path.

## Memory Architecture

| System | Storage | Access |
|--------|---------|--------|
| Working | Context + `_brain/crash-buffer.md` | SessionStart loads automatically |
| Episodic | `journal/` daily notes | `loci log "msg"` |
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

1. Run `loci vault` for path
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

`loci vault` | `loci log` | `loci index --full` | `loci health` | `loci doctor` | `loci sync` | `loci search` | `loci stats` | `loci update`

## Retrieval Strategy (QMD-first)

**ALWAYS use QMD as primary search.** Only fallback to Grep/Glob if QMD returns 0 results.

1. **Default**: QMD `query` (hybrid BM25 + vector + rerank) — best for most questions
2. **Keyword-heavy**: QMD `search` (BM25 lexical) — exact term matching
3. **Conceptual**: QMD `query` with `vec:` prefix (semantic vector) — finds related concepts
4. **Fallback**: Grep/Glob only if QMD fails or for filesystem operations (listing dirs, checking file existence)
5. **0 results** → append query to `_brain/gaps.txt`

**Keep embeddings fresh**: run `loci update` after writing new vault content. The session-end hook runs this automatically.
