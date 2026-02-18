---
name: wipe
description: Generate a context handoff summary of the current session, then clear for a fresh start. Use when approaching context limits or switching to a different task.
allowed-tools: Read, Glob, Grep, Bash
user-invocable: true
---

# Wipe Skill

Generates a session summary for context handoff, then signals the user to start a fresh session.

## Usage

```
/wipe
```

Or ask:
- "Wrap up this session"
- "I'm running low on context, save state"
- "Hand off to a new session"

## How to Execute

### Step 1: Summarise the session

Review the conversation and identify:
- **What was accomplished** — files created, edited, or deleted
- **Decisions made** — any choices or trade-offs discussed
- **Open items** — unfinished work, pending questions, next steps
- **Key context** — important details a new session would need

### Step 2: Check for uncommitted changes

Run:

```bash
git status
```

If there are uncommitted changes, warn the user:

```
⚠️  Uncommitted changes detected. Run /push first to save your work.
```

If the user confirms they want to continue without committing, proceed.

### Step 3: Write the handoff summary

Write the summary to the current daily note (append to the end). If no daily note exists, output the summary directly.

Format:

```markdown
## Session Handoff — HH:MM

### Completed
- Created daily note for 2024-01-15
- Updated Project Alpha task list
- Reviewed weekly goals

### Decisions
- Decided to postpone quarterly review to next week
- Chose to use tag-based priority over folder-based

### Open Items
- [ ] Finish reviewing Project Beta milestones
- [ ] Update monthly goals with new targets
- [ ] Schedule meeting with team lead

### Context for Next Session
Key files touched: `Daily Notes/2024-01-15.md`, `Projects/Alpha/CLAUDE.md`
Current focus: Quarterly goal alignment
```

### Step 4: Signal completion

Tell the user:

```
Session summary saved to today's daily note.

To continue in a new session, start with:
  "I'm picking up from a previous session — check today's daily note for the handoff summary."
```

## Tips

- Run `/wipe` before you hit context limits, not after
- The handoff summary helps a fresh Claude session resume seamlessly
- Always `/push` before `/wipe` to avoid losing uncommitted work
- Pair with `/daily` in the new session to see the full context
