# Weekly Review Command

Facilitates your weekly review process by creating a new review note and helping you reflect on the past week while planning the next.

## Installation
Copy this file to `.claude/commands/weekly.md` in your vault root.

## Usage
```
claude code /weekly
```

## Configuration
Customize these settings for your workflow:

```javascript
// Configuration (customize these)
const WEEKLY_FOLDER = "Goals";
const WEEKLY_TEMPLATE = "Templates/Weekly Review Template.md";
const REVIEW_DAY = 0; // 0=Sunday, 1=Monday, etc.
const TIME_INVESTMENT_TARGET = 30; // minutes for review
```

## What This Command Does

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

The command will guide you through:

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

The command helps you:
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

## Automation Features

### Auto-Archive
Moves daily notes older than 30 days to Archives:
```javascript
const ARCHIVE_AFTER_DAYS = 30;
// Automatically moves old notes to Archives/YYYY/MM/
```

### Project Status Update
Prompts for each active project:
```javascript
// For each project folder:
// - Update completion percentage
// - Note blockers
// - Set next actions
```

### Habit Tracking
Calculates habit success rates:
```javascript
// Counts habit checkboxes from daily notes
// Shows completion percentage
// Identifies patterns
```

## Customization Options

### Different Review Days
```javascript
// For Monday reviews:
const REVIEW_DAY = 1;

// For Friday reviews:
const REVIEW_DAY = 5;
```

### Monthly Reviews
Add monthly review trigger:
```javascript
const today = new Date();
const lastDayOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0).getDate();
if (today.getDate() === lastDayOfMonth) {
  // Trigger monthly review too
}
```

### Sprint-Based Reviews
For agile workflows:
```javascript
const SPRINT_LENGTH = 14; // days
const SPRINT_START = new Date('2024-01-01');
// Calculate sprint number and adjust review
```

## Integration with Goals

The command automatically:
- Links to [[2. Monthly Goals]]
- Updates [[1. Yearly Goals]] progress
- Creates new week entry in review log

## Best Practices

### Consistent Timing
- Same day each week
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

## Troubleshooting

### Review not created?
- Check template exists
- Verify folder structure
- Ensure write permissions

### Links broken?
- Verify file naming
- Check date formats
- Update link syntax

### Too time-consuming?
- Use timer for each section
- Prepare throughout week
- Simplify template

## Related Commands
- `/daily` - Create daily note
- `/push` - Commit to Git
- `/onboard` - Load all context

---

*Command Version: 1.0*
*Optimal Time: Sunday evening or Monday morning*

**Remember:** The best review is the one you actually do. Keep it simple and consistent!