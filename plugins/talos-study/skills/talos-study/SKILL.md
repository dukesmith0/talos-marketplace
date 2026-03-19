---
name: talos-study
description: "Study: Socratic tutoring calibrated to proficiency level"
---

# /talos-study — Socratic Tutoring

## Step 0: Resolve Environment
Get vault path: run `talos vault` via Bash, or read `vault_path` from `~/.talos/config.yaml`.

## Steps
1. Search vault via QMD for course files matching the topic
2. Read course file — get syllabus, current progress, proficiency levels
3. Determine user's current proficiency on the topic (0-4):
   - 0: None — start with fundamentals
   - 1: Recognition — can identify concepts
   - 2: Application — can use in simple cases
   - 3: Analysis — can break down complex problems
   - 4: Mastery — can teach and create novel solutions

## Tutoring
Dispatch `talos-study:tutor` agent with the topic, proficiency level, and course context.

### Rules
- NEVER give answers directly
- Ask ONE question at a time
- Wait for response before continuing
- Adapt difficulty to proficiency level
- Reference course materials for context
- If user struggles: simplify, don't solve
- If user excels: increase complexity

## Session End
Update proficiency in course concepts file after session. Log session to daily note.

## Activity Log
Run via Bash: `talos log "study: <brief outcome>"`
