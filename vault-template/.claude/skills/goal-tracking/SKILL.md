---
name: goal-tracking
description: Track progress toward 3-year, yearly, monthly, and weekly goals. Calculate completion percentages, surface stalled goals, connect daily tasks to objectives. Use for goal reviews and progress tracking.
allowed-tools: Read, Grep, Glob, Edit, TaskCreate, TaskUpdate, TaskList, TaskGet
---

# Goal Tracking Skill

Track and manage the cascading goal system from long-term vision to daily tasks.

## Goal Hierarchy

```
Goals/0. Three Year Goals.md   <- Vision (Life areas)
    ↓
Goals/1. Yearly Goals.md       <- Annual objectives
    ↓
Goals/2. Monthly Goals.md      <- Current month focus
    ↓
Goals/3. Weekly Review.md      <- Weekly planning
    ↓
Daily Notes/*.md               <- Daily tasks and actions
```

## Goal File Formats

### Three Year Goals
```markdown
## Life Areas
- Career: [Vision statement]
- Health: [Vision statement]
- Relationships: [Vision statement]
- Financial: [Vision statement]
- Learning: [Vision statement]
- Personal: [Vision statement]
```

### Yearly Goals
```markdown
## 2024 Goals
- [ ] Goal 1 (XX% complete)
- [ ] Goal 2 (XX% complete)
- [x] Goal 3 (100% complete)
```

### Monthly Goals
```markdown
## This Month's Focus
1. **Primary:** [Main focus]
2. **Secondary:** [Supporting goal]
3. **Stretch:** [If time permits]

### Key Results
- [ ] Measurable outcome 1
- [ ] Measurable outcome 2
```

## Progress Calculation

### Checklist-Based Goals
```
Progress = (Completed checkboxes / Total checkboxes) * 100
```

### Metric-Based Goals
```
Progress = (Current value / Target value) * 100
```

### Time-Based Goals
```
Progress = (Days elapsed / Total days) * 100
```

## Common Operations

### View Goal Progress
1. Read all goal files
2. Parse checkbox completion rates
3. Calculate overall and per-goal progress
4. Identify stalled or at-risk goals

### Update Goal Status
1. Find goal in appropriate file
2. Update checkbox or percentage
3. Add date stamp for significant milestones
4. Update related weekly review

### Connect Task to Goal
When adding tasks to daily notes:
1. Identify which goal the task supports
2. Add goal reference: `Supports: [[1. Yearly Goals#Goal Name]]`
3. Use appropriate priority tag

### Surface Stalled Goals
1. Check last activity date for each goal
2. Flag goals with no progress in 14+ days
3. Suggest actions to restart momentum

## Progress Report Format

```markdown
## Goal Progress Report

### Overall: XX%

### By Goal
| Goal | Progress | Last Activity | Status |
|------|----------|---------------|--------|
| Goal 1 | 75% | 2 days ago | On Track |
| Goal 2 | 30% | 14 days ago | Stalled |

### This Week's Contributions
- [Task] -> [[Goal 1]]
- [Task] -> [[Goal 2]]

### Recommended Focus
1. [Stalled goal needs attention]
2. [Nearly complete goal - finish it]
```

## Task-Based Progress Tracking

The goal tracking skill uses session tasks when generating comprehensive progress reports.

### Progress Report Tasks

Create tasks at skill start:

```
TaskCreate:
  subject: "Read three-year goals"
  description: "Load vision statements from Goals/0. Three Year Goals.md"
  activeForm: "Reading three-year goals..."

TaskCreate:
  subject: "Read yearly goals"
  description: "Load annual objectives from Goals/1. Yearly Goals.md"
  activeForm: "Reading yearly goals..."

TaskCreate:
  subject: "Read monthly goals"
  description: "Load current month focus from Goals/2. Monthly Goals.md"
  activeForm: "Reading monthly goals..."

TaskCreate:
  subject: "Scan recent daily notes"
  description: "Find task completions and goal contributions from past week"
  activeForm: "Scanning recent daily notes..."

TaskCreate:
  subject: "Calculate completion percentages"
  description: "Compute progress for each goal based on checkboxes and metrics"
  activeForm: "Calculating completion percentages..."

TaskCreate:
  subject: "Identify stalled goals"
  description: "Flag goals with no progress in 14+ days"
  activeForm: "Identifying stalled goals..."
```

### Dependencies

Goal file reads can run in parallel, but analysis depends on having all data:
```
TaskUpdate: "Scan recent daily notes", addBlockedBy: [read-monthly-goals-id]
TaskUpdate: "Calculate completion percentages", addBlockedBy: [scan-recent-daily-notes-id]
TaskUpdate: "Identify stalled goals", addBlockedBy: [calculate-completion-percentages-id]
```

Mark each task `in_progress` when starting, `completed` when done using TaskUpdate.

Task tools are session-scoped and don't persist—your actual goal progress is tracked through markdown checkboxes and percentages in your goal files.

## Integration Points

- Weekly review: Full progress assessment
- Daily planning: Surface relevant goals
- Monthly review: Adjust goals as needed
- Quarterly review: Cascade from 3-year vision
