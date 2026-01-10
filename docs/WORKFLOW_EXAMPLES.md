# Workflow Examples

Real-world scenarios showing how to use your PKM system effectively throughout your day, week, and projects.

## Daily Workflows

### Morning Routine (15 minutes)

#### 6:00 AM - Wake Up
```bash
# First, load your context
claude code /onboard

# Create today's daily note
claude code /daily-workflow
```

#### 6:05 AM - Review and Plan
Claude helps you:
1. Review yesterday's incomplete tasks
2. Check calendar for fixed commitments
3. Identify ONE big priority
4. Set realistic time blocks

#### 6:10 AM - Set Intentions
```markdown
## Today's Focus
**ONE Thing:** Complete project proposal

## Intentions
- Be present in meetings
- Take breaks every 90 minutes
- End work by 6 PM
```

#### 6:15 AM - Ready to Start
```bash
# Optional: Get motivation
claude code "Give me a motivational quote related to my current goals"
```

### Midday Check-in (5 minutes)

#### 12:00 PM - Progress Review
```markdown
## Midday Check
- ✅ Completed: 4/8 tasks
- 🔄 In Progress: Project proposal (70%)
- ⚡ Energy Level: 7/10
- 🎯 Afternoon Focus: Client meeting prep
```

### Evening Shutdown (10 minutes)

#### 5:30 PM - Wrap Up
1. Check off completed tasks
2. Note incomplete items and why
3. Capture any loose thoughts

#### 5:35 PM - Reflect
```markdown
## End of Day Reflection
### What Went Well?
- Finished proposal ahead of schedule
- Great breakthrough on design problem

### What Could Be Better?
- Too many context switches
- Skipped lunch break

### Tomorrow's #1 Priority
- Review proposal with team
```

#### 5:40 PM - Save and Sync
```bash
claude code /push "Daily work complete - {{date}}"
```

## Weekly Workflows

### Sunday Weekly Review (30 minutes)

#### Step 1: Create Review (5 min)
```bash
claude code /weekly-review
```

#### Step 2: Review Last Week (10 min)
Go through each daily note:
```bash
claude code "Summarize my accomplishments from the past week's daily notes"
```

Look for patterns:
- What times was I most productive?
- What derailed my plans?
- What victories can I celebrate?

#### Step 3: Plan Next Week (10 min)
```markdown
## Next Week's Plan
### ONE Big Thing
If nothing else, I will: [Complete Q1 report]

### Key Projects
1. **Project Alpha** - Milestone: Design review
2. **Learning Spanish** - Goal: Complete Chapter 4
3. **Health** - Target: 4 workouts

### Calendar Blocks
- Mon 9-11 AM: Deep work on report
- Wed 2-4 PM: Team planning
- Fri 3-5 PM: Weekly review & planning
```

#### Step 4: Clean Up (5 min)
```bash
# Archive old notes
claude code "Move daily notes older than 30 days to Archives"

# Update project statuses
claude code "Review all active projects and update their status"

# Commit everything
claude code /push "Weekly review complete - Week {{week_number}}"
```

### Monthly Review (1 hour)

#### First Sunday of Month
```bash
# Load full context
claude code /onboard all

# Create monthly review
claude code "Create a monthly review analyzing my progress toward yearly goals"
```

Review Process:
1. **Quantitative Analysis** (20 min)
   - Count completed tasks
   - Measure goal progress
   - Track habit consistency

2. **Qualitative Reflection** (20 min)
   - What themes emerged?
   - What surprised you?
   - What patterns need attention?

3. **Planning Adjustment** (20 min)
   - Update monthly goals
   - Revise project priorities
   - Adjust daily routines

## Project Workflows

### Starting a New Project

#### Step 1: Create Structure
```bash
claude code "Create a new project called 'Website Redesign' with standard structure"
```

#### Step 2: Define Success
```markdown
# Project: Website Redesign

## Success Criteria
1. New design live by March 1
2. Page load time < 2 seconds
3. Mobile-first responsive design
4. Accessibility score > 95

## Milestones
- [ ] Week 1: Requirements gathered
- [ ] Week 2: Wireframes complete
- [ ] Week 3: Design approved
- [ ] Week 4: Development started
```

#### Step 3: Create Project CLAUDE.md
```markdown
# Context for Claude: Website Redesign

## Project Status
Currently in planning phase

## Key Decisions
- Using React + Next.js
- Hosting on Vercel
- Design system: Tailwind

## When Helping
- Remind me about accessibility
- Suggest performance optimizations
- Keep mobile-first in mind
```

### Daily Project Work

#### Starting Project Time
```bash
# Load project context
claude code /onboard Projects/WebsiteRedesign

# Get oriented
claude code "What should I focus on for this project today?"
```

#### During Work
```markdown
## Project Log - {{date}}
### What I Did
- Completed wireframes for homepage
- Reviewed competitor sites
- Met with stakeholder

### Decisions Made
- Go with single-page design
- Use system fonts for speed

### Next Steps
- Get design feedback
- Start component library
```

#### Project Check-in
```bash
claude code "Review my project progress and suggest next priorities"
```

### Completing a Project

#### Project Closure
```bash
# Generate project summary
claude code "Create a project completion summary with lessons learned"

# Archive project
claude code "Move 'Website Redesign' project to Archives with completion date"

# Update goals
claude code "Update my monthly and yearly goals to reflect project completion"
```

## Learning Workflows

### Daily Learning Routine

#### Morning Learning (30 min)
```markdown
## Today's Learning
### Topic: Spanish Subjunctive
### Resource: Chapter 4, pages 45-50
### Practice: 10 exercises

### Notes
- Subjunctive used for doubts/emotions
- Trigger phrases: "Es posible que..."
- Common mistake: Using indicative instead

### Anki Cards Created: 5
```

#### Evening Review (15 min)
```bash
claude code "Quiz me on what I learned today about Spanish subjunctive"
```

### Book Reading Workflow

#### Starting a Book
```bash
claude code "Create a literature note for 'Atomic Habits' by James Clear"
```

#### While Reading
```markdown
## Atomic Habits - Reading Notes

### Chapter 2: How Habits Shape Identity
**Key Idea**: Focus on who you want to become, not what you want to achieve

**Quote**: "Every action is a vote for the type of person you wish to become"

**Personal Application**: Instead of "I want to write", say "I am a writer"

**Questions**:
- How does this apply to my Spanish learning?
- What identity am I reinforcing with daily notes?
```

#### After Finishing
```bash
claude code "Create a book summary and extract actionable insights from my Atomic Habits notes"
```

## Mobile Workflows

### On-the-Go Task Capture

#### Via GitHub Issues
1. Open GitHub mobile app
2. Create issue with title: "Task: [Description]"
3. Add label: "task"
4. Claude automatically adds to daily note

#### Via Voice Note
1. Record voice memo
2. Share to GitHub as issue
3. Claude transcribes and processes

### Mobile Weekly Review

#### From Phone
1. Open GitHub mobile
2. Review recent commits
3. Create issue: "Weekly review needed"
4. Claude generates review template

### Emergency Access

#### When Desktop Unavailable
```
1. Access GitHub.com from any browser
2. Navigate to your vault repository  
3. Edit files directly in browser
4. Changes sync when back at desktop
```

## Integration Workflows

### Email to Tasks

#### Morning Email Processing
```markdown
## Inbox Processing - {{time}}
- [ ] Reply: John re: Project timeline
- [ ] Action: Submit expense report (attachment)
- [ ] Read: Newsletter from industry blog
- [ ] Archive: 15 promotional emails
```

### Meeting Notes

#### Before Meeting
```bash
claude code "Create meeting note for 'Design Review' with standard agenda"
```

#### During Meeting
```markdown
## Design Review - {{date}} 2:00 PM

### Attendees
- Me, Sarah, Tom, Lisa

### Agenda
1. Review current designs ✅
2. Discuss feedback ✅
3. Next steps ⏸️

### Notes
- Sarah: Likes color scheme, worried about contrast
- Tom: Performance concerns with animations
- Lisa: Accessibility audit needed

### Action Items
- [ ] @Me: Update color contrast
- [ ] @Tom: Performance testing
- [ ] @Lisa: Schedule accessibility review
```

#### After Meeting
```bash
claude code "Extract action items from meeting notes and add to my task list"
```

## Advanced Workflows

### Goal Cascade Review

#### Quarterly Alignment
```bash
claude code "Analyze how my daily tasks over the past quarter aligned with my yearly goals"
```

Output shows:
- Time spent per goal area
- Progress metrics
- Misalignment areas
- Recommendations

### Habit Tracking Analysis

#### Monthly Habit Review
```bash
claude code "Analyze my habit completion rates and identify patterns"
```

Shows:
- Completion percentages
- Best/worst days
- Correlation with energy levels
- Suggested adjustments

### Knowledge Graph Building

#### Connecting Ideas
```bash
claude code "Find connections between my recent learning notes and suggest knowledge links"
```

Creates:
- Concept maps
- Related note suggestions
- Knowledge gaps identified
- Learning path recommendations

## Troubleshooting Workflows

### When Overwhelmed

```bash
claude code "I'm overwhelmed. Help me identify my top 3 priorities from all my commitments"
```

### When Stuck

```bash
claude code "I'm stuck on [problem]. Review my notes and suggest approaches"
```

### When Behind

```bash
claude code "I'm behind on my goals. Create a recovery plan for the next 2 weeks"
```

## Seasonal Workflows

### Year-End Review
```bash
# December 31
claude code "Generate comprehensive year in review from all my daily notes"
```

### New Year Planning
```bash
# January 1
claude code "Based on last year's patterns, help me set realistic goals for this year"
```

### Spring Cleaning
```bash
# Quarterly
claude code "Identify and archive inactive projects and outdated notes"
```

---

## Tips for Workflow Success

1. **Start Small**: Master daily notes before adding complexity
2. **Be Consistent**: Same time, same process, every day
3. **Iterate Weekly**: Adjust what's not working
4. **Track Patterns**: Notice what helps or hinders
5. **Automate Gradually**: Add automation as patterns stabilize

Remember: Workflows should reduce friction, not add it. If something feels heavy, simplify it.