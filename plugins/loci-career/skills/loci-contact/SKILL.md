---
name: loci-contact
description: "Career: Create or lookup contacts in the vault"
---

# /loci-contact — Create/Lookup Contact

## Step 0: Resolve Environment
Run `loci vault` via Bash to get vault path.

## Steps
1. Search for existing contact via QMD `search` for the person's name. Fallback: Glob `career/contacts/*.md` if QMD returns 0 results.
2. If found: display contact card and recent interactions
3. If not found: create `$VAULT/career/contacts/<name>.md`:
   - Frontmatter: type, name, company, role, met, followup, aliases, `origin: direct`
   - Content: structured table (name, company, role, context). User's words — no embellishment.
   - Wikilinks auto-inserted for company names, technologies, locations
4. **Hub update**: for relevant tag hubs (company, industry), append contact to `## Connections`
5. Log: `loci log "contact: <brief outcome>"`

## Output
Contact card with key details and linked interactions.
