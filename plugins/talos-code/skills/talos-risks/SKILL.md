---
name: talos-risks
description: "Code: Security and architecture risk analysis with cross-project awareness"
---

# /talos-risks — Security & Architecture Risk Analysis

## Step 0: Resolve Environment
Get vault path: run `talos vault` via Bash, or read `vault_path` from `~/.talos/config.yaml`.

## Steps
1. Search vault via QMD for prior risk assessments (query: 'risk security vulnerability'). Reference patterns from past analyses.
2. Read project structure and CLAUDE.md for context
3. Scan for security risks (OWASP top 10):
   - Injection vulnerabilities
   - Broken authentication/authorization
   - Sensitive data exposure
   - Missing input validation
   - Hardcoded secrets/credentials
4. Scan for architecture risks:
   - Single points of failure
   - Missing error handling
   - Data integrity gaps
   - Scale/performance bottlenecks
5. Check dependencies for known CVEs:
   - Node.js: `npm audit`
   - Python: `pip audit` or `safety check`
   - Rust: `cargo audit`
   - Go: `govulncheck ./...`
6. Write findings to `.talos/risks.md`
7. Offer to save findings to vault for cross-project reference

## Output Format
| Risk | Severity | Likelihood | Impact | Mitigation |
|------|----------|------------|--------|------------|

Severities: critical, high, medium, low

## Activity Log
Run via Bash: `talos log "risks: <brief outcome>"`
