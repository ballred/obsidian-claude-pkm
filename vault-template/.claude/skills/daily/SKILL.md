---
name: daily
description: Create daily notes and manage morning, midday, and evening routines. Structure daily planning, task review, and end-of-day reflection. Use for daily productivity routines or when asked to create today's note.
allowed-tools: Read, Write, Edit, Glob, Grep
user-invocable: true
---

# Daily Workflow Skill

Creates daily notes and provides structured workflows for morning planning, midday check-ins, and evening shutdowns.

## Usage

Invoke with `/daily` or ask Claude to create today's note or help with daily routines.

### Create Today's Note
```
/daily
```

Or simply ask:
- "Create today's daily note"
- "Start my morning routine"
- "Help me with evening shutdown"

## Daily Note Creation

### What Happens
1. **Checks if today's note exists**
   - If yes: Opens the existing note
   - If no: Creates new note from template

2. **Template Processing**
   - Replaces `{{date}}` with today's date
   - Replaces `{{date:format}}` with formatted dates
   - Handles date arithmetic (e.g., `{{date-1}}` for yesterday)

3. **Automatic Organization**
   - Places note in `Daily Notes/` folder
   - Names file with today's date (YYYY-MM-DD.md)
   - Preserves template structure

### Template Variables
Your daily template can use:
- `{{date}}` - Today's date in default format
- `{{date:dddd}}` - Day name (e.g., Monday)
- `{{date:MMMM DD, YYYY}}` - Formatted date
- `{{date-1:YYYY-MM-DD}}` - Yesterday's date
- `{{date+1:YYYY-MM-DD}}` - Tomorrow's date
- `{{time}}` - Current time

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

## Daily Note Structure

Standard daily note template:

```markdown
# {{date}}

## Focus
> What's the ONE thing that would make today successful?

## Time Blocks
- Morning (9-12):
- Afternoon (12-5):
- Evening (5+):

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

## Configuration

Customize paths to match your vault:
- Daily notes folder: `Daily Notes/`
- Template location: `Templates/Daily Template.md`
- Date format: `YYYY-MM-DD`

### Different Date Formats
- `YYYY-MM-DD` - Standard ISO format (recommended)
- `MM-DD-YYYY` - US format
- `DD-MM-YYYY` - European format
- `YYYY-MM-DD-ddd` - Include day abbreviation

### Folder Organization by Month
Organize daily notes by month/year:
```
Daily Notes/2024/01/2024-01-15.md
```

## Integration

Works with:
- `/push` - Commit end-of-day changes
- `/weekly` - Weekly planning uses daily notes
- `/onboard` - Load context before planning
- Goal tracking skill - Align daily tasks to goals
- Productivity Coach - Accountability for daily routines
