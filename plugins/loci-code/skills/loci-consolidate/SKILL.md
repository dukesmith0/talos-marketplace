---
name: loci-consolidate
description: "Code: Compress .loci/ project files for token efficiency. Run manually when files exceed ~200 lines."
---

# /loci-consolidate — Compress .loci Files

## Steps
1. Read all `.loci/` files: index.md, plan.md, bugs.md, decisions.md, risks.md
2. Check line counts — report files over 200 lines
3. Compress each file while retaining ALL information:

### plan.md
- Collapse completed items: `12 items completed (2026-03-18 to 2026-03-19)` instead of listing each
- Keep active/unchecked items verbose
- Keep open decisions verbose

### bugs.md
- Active bugs: keep verbose with full description
- Resolved bugs: compress to `| ID | Fix | Date |` rows (one line each)

### decisions.md
- Active decisions: keep full rationale
- Superseded: mark `[superseded by D-XX]` and compress to one line

### risks.md
- Active risks: keep full description + mitigation
- Mitigated: remove entirely (the mitigation is in the code)

### index.md
- Refresh component counts, tech stack versions from current codebase
- Remove stale entries for deleted files/components

4. Report: "Consolidated N files, reduced ~M lines"

## Output
Summary of compression applied per file. No information lost.
