---
name: daily-workflow
description: Morning routine, midday check-in, and evening shutdown workflows. Structure daily planning, task review, and end-of-day reflection. Use for daily productivity routines.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# Daily Workflow Skill

Structured workflows for morning planning, midday check-ins, and evening shutdowns.

## Morning Routine (5-10 minutes)

### Automated Steps
1. Create today's daily note (if not exists)
2. Pull incomplete tasks from yesterday
3. Review weekly goals for today's priority
4. Surface any calendar events or deadlines

### Interactive Prompts
- "What's your ONE thing for today?"
- "What might get in the way?"
- "How do you want to feel at end of day?"

### Morning Checklist
- [ ] Daily note created
- [ ] Yesterday's incomplete tasks reviewed
- [ ] ONE priority identified
- [ ] Time blocks set
- [ ] Potential obstacles identified

## Midday Check-in (2-3 minutes)

### Quick Review
1. Check morning task completion
2. Compare actual vs planned time use
3. Assess energy level
4. Identify afternoon priorities

### Adjustments
- Reschedule incomplete morning tasks
- Add urgent items that emerged
- Reorder by current energy level
- Note any blockers

### Midday Questions
- "How's your energy right now?"
- "What's the most important thing for this afternoon?"
- "What can you let go of today?"

## Evening Shutdown (5 minutes)

### Capture
1. Mark completed tasks with [x]
2. Add notes and learnings
3. Log energy levels (1-10)
4. Record gratitude items

### Reflect
- What went well today?
- What could be better?
- What did I learn?
- What am I grateful for?

### Prepare
1. Identify tomorrow's priority (preview)
2. Move incomplete tasks to tomorrow or delete
3. Commit changes to git (`/push`)

### Shutdown Checklist
- [ ] All tasks updated (done/moved/deleted)
- [ ] Reflection completed
- [ ] Tomorrow's priority identified
- [ ] Changes committed

## Daily Note Sections

Standard daily note structure:

```markdown
# {{date}}

## Focus
> What's the ONE thing that would make today successful?

## Time Blocks
- 🌅 Morning (9-12):
- ☀️ Afternoon (12-5):
- 🌙 Evening (5+):

## Tasks
### Must Do Today
- [ ]

### Work
- [ ]

### Personal
- [ ]

## Notes
[Capture thoughts, meeting notes, ideas]

## Reflection
- **Wins:**
- **Challenges:**
- **Learned:**
- **Grateful for:**
- **Energy:** /10
- **Tomorrow's priority:**
```

## Time Block Strategies

### Energy-Based
- High energy tasks in morning
- Administrative work after lunch
- Creative work when naturally alert

### Context-Based
- Batch similar tasks together
- Minimize context switching
- Protect deep work blocks

## Integration

Works with:
- `/daily` command for note creation
- `/push` command for end-of-day commit
- Productivity Coach for accountability
- Goal Tracking skill for alignment
