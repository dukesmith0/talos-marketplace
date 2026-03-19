---
name: loci-hub
description: "Brain: Create, lookup, or deep-dive a tag hub page with quality metrics."
---

# /loci-hub

## Step 0
Run `loci vault` via Bash. Glob `tags/**/*.md` to check if hub exists.

## If hub exists: Analyze
Run `loci stats --hub <name>` via Bash for computed metrics. Show:
- Health score (5 dimensions), connections by type, gaps, suggestions
- Sibling hubs (same category) for cross-pollination ideas

## If hub doesn't exist: Create
1. Infer category: language → `tags/languages/`, framework → `tags/frameworks/`, tool → `tags/tools/`, platform → `tags/platforms/`, domain → `tags/domains/`, method → `tags/methods/`, other → `tags/topics/`
2. Generate aliases (3+ chars only — **never** 1-2 char aliases like "js", "py")
3. One-line description from web search or context
4. Create file with frontmatter: type, name, category, aliases, description
5. Add `## Live Connections` Dataview query: `` ```dataview LIST FROM [[Name]] WHERE file.name != this.file.name SORT file.mtime DESC ``` ``
6. Run `loci index --full`

## Log
`loci log "hub: <action> <tag>"`
