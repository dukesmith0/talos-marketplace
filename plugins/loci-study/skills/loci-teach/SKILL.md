---
name: loci-teach
description: "Study: Feynman technique evaluation of concept explanations"
---

# /loci-teach — Feynman Technique Evaluation

## Step 0: Resolve Environment
Get vault path: run `loci vault` via Bash, or read `vault_path` from `~/.loci/config.yaml`.

## Steps
1. QMD `query` for the concept to find vault reference materials for validation
2. Ask the user to explain a concept in their own words
3. Evaluate their explanation on:
   - **Accuracy**: factually correct? (1-5)
   - **Completeness**: covers key aspects? (1-5)
   - **Clarity**: would a beginner understand? (1-5)
   - **Misconceptions**: any wrong assumptions? (list)
4. Provide specific feedback:
   - What was explained well
   - What was missing or inaccurate
   - Simpler analogies if needed
5. Update proficiency level in course file based on performance

## Rules
- Let them explain FIRST, fully, before evaluating
- Be encouraging but honest
- Point to specific gaps, don't just say "incomplete"

## Activity Log
Run via Bash: `loci log "teach: <brief outcome>"`
