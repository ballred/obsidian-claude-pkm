---
name: weekly
description: Facilitate weekly review process with reflection, goal alignment, and planning. Create review notes, analyze past week, plan next week. Use on Sundays or whenever doing weekly planning.
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# Weekly Review Skill

Facilitates your weekly review process by creating a review note and guiding reflection on the past week while planning the next.

## Usage

Invoke with `/weekly` or ask Claude to help with your weekly review.

```
/weekly
```

## What This Skill Does

1. **Creates Weekly Review Note**
   - Uses weekly review template
   - Names it with current week's date
   - Places in Goals folder

2. **Guides Review Process**
   - Reviews last week's accomplishments
   - Identifies incomplete tasks
   - Plans upcoming week
   - Aligns with monthly goals

3. **Automates Housekeeping**
   - Archives old daily notes
   - Updates project statuses
   - Cleans up completed tasks

## Review Process Steps

### Step 1: Reflection (10 minutes)
- Review daily notes from past week
- Identify wins and challenges
- Capture lessons learned

### Step 2: Goal Alignment (10 minutes)
- Check monthly goal progress
- Adjust weekly priorities
- Ensure alignment with yearly goals

### Step 3: Planning (10 minutes)
- Set ONE big thing for the week
- Schedule important tasks
- Block time for deep work

## Interactive Prompts

The skill guides you through:

1. **"What were your top 3 wins this week?"**
   - Celebrates progress
   - Builds momentum
   - Documents achievements

2. **"What were your main challenges?"**
   - Identifies obstacles
   - Plans solutions
   - Learns from difficulties

3. **"What's your ONE big thing next week?"**
   - Forces prioritization
   - Creates focus
   - Drives meaningful progress

## Weekly Review Checklist

- [ ] Review all daily notes
- [ ] Process inbox items
- [ ] Update project statuses
- [ ] Check upcoming calendar
- [ ] Review monthly goals
- [ ] Plan next week's priorities
- [ ] Block time for important work
- [ ] Clean digital workspace
- [ ] Archive completed items
- [ ] Commit changes to Git

## Weekly Review Note Format

```markdown
# Weekly Review: YYYY-MM-DD

## Last Week's Wins
1.
2.
3.

## Challenges & Lessons
- Challenge:
- Lesson:

## Goal Progress
### Monthly Goals
- [ ] Goal 1 (XX%)
- [ ] Goal 2 (XX%)

### This Week's Contribution
- [Task] -> [[Goal]]

## Next Week Planning

### ONE Big Thing
>

### Key Tasks
- [ ]
- [ ]
- [ ]

### Time Blocks
- Monday:
- Tuesday:
- Wednesday:
- Thursday:
- Friday:

## Notes
```

## Automation Features

### Auto-Archive
Suggest moving daily notes older than 30 days to Archives.

### Project Status Update
For each active project:
- Update completion percentage
- Note blockers
- Set next actions

### Habit Tracking
Calculate habit success rates from daily notes:
- Count habit checkboxes
- Show completion percentage
- Identify patterns

## Best Practices

### Consistent Timing
- Same day each week (Sunday recommended)
- Same time if possible
- Block calendar time
- Treat as non-negotiable

### Preparation
- Clean inbox before review
- Have calendar ready
- Gather project updates
- Review any feedback

### Follow-through
- Share highlights with team/family
- Update external systems
- Communicate changes
- Celebrate wins

## Task-Based Progress Tracking

The weekly skill uses session tasks to show progress through the 3-phase review.

### Phase Tasks

Create tasks at skill start:

```
TaskCreate:
  subject: "Phase 1: Collect"
  description: "Gather daily notes from past week, extract wins and challenges"
  activeForm: "Collecting daily notes and extracting highlights..."

TaskCreate:
  subject: "Phase 2: Reflect"
  description: "Calculate goal progress, analyze alignment gaps"
  activeForm: "Calculating goal progress and alignment..."

TaskCreate:
  subject: "Phase 3: Plan"
  description: "Identify ONE Big Thing, plan daily focus areas for next week"
  activeForm: "Planning next week's focus..."
```

### Dependencies

Phases must run in order:
```
TaskUpdate: "Phase 2: Reflect", addBlockedBy: [phase-1-collect-id]
TaskUpdate: "Phase 3: Plan", addBlockedBy: [phase-2-reflect-id]
```

Reflect is blocked until Collect completes. Plan is blocked until Reflect completes. This provides visibility into the 30-minute review process.

Mark each task `in_progress` when starting, `completed` when done using TaskUpdate.

Task tools are session-scoped and don't persist between Claude sessions—your actual weekly review content is saved in the review note.

## Integration

Works with:
- `/daily` - Reviews daily notes from the week
- `/push` - Commit after completing review
- `/onboard` - Load context for informed review
- Goal tracking skill - Progress calculations
- `/daily` skill - Plan next week's routines
