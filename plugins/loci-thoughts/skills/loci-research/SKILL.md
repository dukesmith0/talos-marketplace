---
name: loci-research
description: "Ideas: Deep research combining vault knowledge and web sources"
---

# /loci-research — Deep Research

## Step 0: Resolve Environment
Get vault path: run `loci vault` via Bash, or read `vault_path` from `~/.loci/config.yaml`.

## Steps
1. **Vault search first**: QMD query for existing knowledge on topic
2. Read top vault results — establish what's already known
3. **Web search**: search for current/external information
4. **Cross-reference**: compare web findings with vault knowledge
5. **Synthesize** into structured brief:

### Output Format
#### Key Findings
Numbered findings with confidence (high/medium/low)

#### Sources
- Vault: [[wikilinks]] to relevant notes
- Web: titled links with dates

#### Confidence Assessment
What's well-established vs. uncertain

#### Knowledge Gaps
What couldn't be answered, suggested next searches

#### Recommendations
Actionable next steps based on findings

## Save
Write to vault with frontmatter: `type: reference`, `confidence: <level>`, `origin: inferred` (synthesis of sources, not raw user input), tags from topic. Include `## Source` with URLs and vault refs.

**Origin rule**: vault findings that come from `origin: direct` notes get higher weight than web sources. Flag any contradiction between vault direct-origin facts and web results.

**Hub update**: for each tag with a hub page in `tags/`, append new reference to hub's `## Connections`.

## Activity Log
Run via Bash: `loci log "research: <brief outcome>"`
