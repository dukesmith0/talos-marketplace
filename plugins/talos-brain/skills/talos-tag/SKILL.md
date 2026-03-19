---
name: talos-tag
description: "Brain: Create or lookup a tag hub page with auto-categorization."
---

# /talos-tag — Create/Lookup Tag

## Step 0
Run `talos vault` via Bash. Glob `tags/**/*.md` to check if tag exists.

## Lookup (tag exists)
Read the hub page. Show description, category, aliases, and linked notes count.

## Create (tag doesn't exist)
1. Infer category from tag name:
   - Programming language → `tags/languages/`
   - Framework/library → `tags/frameworks/`
   - Dev tool → `tags/tools/`
   - Platform/service → `tags/platforms/`
   - Field/discipline → `tags/domains/`
   - Technique/method → `tags/methods/`
   - General concept → `tags/topics/`
2. Generate aliases (e.g., Python → [python, py, Python3])
3. Write one-line description from context or web search
4. Create `tags/<category>/<tag>.md` with frontmatter: type, name, category, aliases
5. Run `talos index --full` to register as linkable entity

## Quality Rules
- **Only create hubs for named entities**: tools, languages, platforms, domains, methods. Not generic words (e.g., no "project" hub, no "brainstorm" hub).
- **Minimum threshold**: tag must appear in 3+ existing notes before getting a hub. Exception: the user explicitly requests it.
- **Description must be factual**: pull from web search or existing context, never invent. Set `origin: direct` if from web, `origin: generated` if Claude-authored.
- **Always add aliases**: common abbreviations, alternate spellings. This drives wikilink matching.
- **After creating**: scan vault for notes using this tag and update the hub's `## Connections` section.

## Activity Log
`talos log "tag: created/found <tag> in <category>"`
