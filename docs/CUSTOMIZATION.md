# Customization Guide

Make this PKM system truly yours. This guide covers everything from simple tweaks to advanced modifications.

## Table of Contents
1. [Quick Customizations](#quick-customizations)
2. [Template Modifications](#template-modifications)
3. [Folder Structure](#folder-structure)
4. [Tag System](#tag-system)
5. [Claude Commands](#claude-commands)
6. [Workflow Automation](#workflow-automation)
7. [Theme and Appearance](#theme-and-appearance)
8. [Advanced Configurations](#advanced-configurations)

## Quick Customizations

### Personal Mission Statement
Location: `CLAUDE.md` and `Templates/Daily Template.md`

Replace the placeholder with your actual mission:
```markdown
_"Your personal mission or daily affirmation here"_
```

Examples:
- "Build with purpose, live with intention, grow with courage"
- "Create value, nurture relationships, embrace learning"
- "Simplify complexity, amplify impact, multiply joy"

### Time Blocks
Location: `Templates/Daily Template.md`

Adjust to your schedule:
```markdown
## ⏰ Time Blocks
- **Early Morning (5-7am):** Meditation & Exercise
- **Morning (7-10am):** Deep work
- **Midday (10am-1pm):** Meetings & Collaboration
- **Afternoon (1-4pm):** Administrative tasks
- **Late Afternoon (4-6pm):** Learning & Development
- **Evening (6-9pm):** Family & Personal time
```

### Goal Percentages
Location: `Goals/1. Yearly Goals.md`

Adjust effort allocation:
```markdown
### 💼 Career (40% of effort)  <!-- Increase if career-focused -->
### 🏃 Health (30% of effort)   <!-- Increase if health is priority -->
### ❤️ Relationships (20% of effort)
### 🌱 Personal Growth (10% of effort)
```

## Template Modifications

### Daily Template Variations

#### Minimalist Version
```markdown
# {{date:dddd, MMMM DD, YYYY}}

## Focus
- 

## Tasks
- [ ] 
- [ ] 
- [ ] 

## Notes


## Reflection
- Win: 
- Learn: 
- Tomorrow: 
```

#### Detailed Version
```markdown
# {{date:dddd, MMMM DD, YYYY}}

## Morning Intention
### Gratitude
### Affirmation
### Priority

## Schedule
### Time Blocks
### Meetings
### Deadlines

## Tasks by Context
### @Office
### @Home
### @Computer
### @Phone

## Project Updates
### [Project 1]
### [Project 2]

## Learning Log
### What I Learned
### Resources Consumed
### Questions Raised

## Health Tracking
### Exercise
### Nutrition
### Sleep
### Mood

## Detailed Reflection
### Successes
### Challenges
### Insights
### Improvements
```

### Weekly Review Variations

#### Sprint-Based Review
```markdown
# Sprint Review - Sprint {{sprint_number}}

## Sprint Goals
- [ ] Goal 1
- [ ] Goal 2

## Velocity
- Points Planned: 
- Points Completed: 
- Carry Over: 

## Retrospective
### What Went Well
### What Didn't Work
### Action Items
```

#### OKR-Based Review
```markdown
# Weekly OKR Check-in

## Objective 1: [Title]
### Key Result 1: [Metric]
- Progress: [X]%
- This Week's Contribution:

### Key Result 2: [Metric]
- Progress: [X]%
- This Week's Contribution:
```

## Folder Structure

### Alternative Structures

#### GTD-Based
```
vault/
├── Inbox/          # Capture everything
├── Next Actions/   # Immediate tasks
├── Projects/       # Multi-step outcomes
├── Someday Maybe/  # Future possibilities
├── Reference/      # Information storage
└── Contexts/       # @home, @office, @errands
```

#### PARA Method
```
vault/
├── Projects/       # Things with deadlines
├── Areas/          # Ongoing responsibilities
├── Resources/      # Future reference
└── Archives/       # Inactive items
```

#### Zettelkasten-Inspired
```
vault/
├── Permanent Notes/  # Atomic ideas
├── Literature Notes/ # From sources
├── Daily Notes/      # Journal entries
├── Index/           # Entry points
└── References/      # Sources
```

### Adding Custom Folders

Create specialized folders for your needs:
```
vault/
├── Finances/        # Budget, investments
├── Learning/        # Courses, books, skills
├── Health/          # Medical, fitness, nutrition
├── Creative/        # Writing, art, music
└── Relationships/   # People, interactions
```

## Tag System

### Creating Your Tag Taxonomy

#### Hierarchical Tags
```markdown
#work/project/clientA
#work/project/clientB
#work/admin/expenses
#work/admin/planning

#personal/health/exercise
#personal/health/nutrition
#personal/finance/budget
#personal/finance/investing
```

#### Status-Based Tags
```markdown
#status/active
#status/waiting
#status/delegated
#status/complete
#status/cancelled
```

#### Energy-Based Tags
```markdown
#energy/high  # Requires focus
#energy/medium
#energy/low   # Can do when tired
```

#### Context Tags
```markdown
#context/home
#context/office
#context/online
#context/phone
#context/errands
```

### Tag Combinations
Use multiple tags for powerful filtering:
```markdown
#work #priority/high #energy/high #context/office
```

## Claude Commands

### Creating Custom Commands

#### Example: Book Notes Command
Create `.claude/commands/book.md`:
```markdown
# Book Notes Creator

Creates a new book note with metadata and structure.

## Usage
claude code /book "Book Title" "Author"

## What it does
1. Creates note in Resources/Books/
2. Adds metadata (title, author, date started)
3. Includes template for notes
4. Links to reading list
```

#### Example: Meeting Notes Command
Create `.claude/commands/meeting.md`:
```markdown
# Meeting Notes

Creates formatted meeting notes with action items.

## Usage
claude code /meeting "Meeting Title"

## Template
- Date/Time
- Attendees
- Agenda
- Discussion
- Action Items
- Follow-up
```

### Modifying Existing Commands

#### Daily Command for Different Schedules
Edit `.claude/commands/daily.md`:
```javascript
// For night shift workers
const DAILY_NOTES_TIME = "18:00"; // 6 PM start

// For early risers
const MORNING_ROUTINE_START = "05:00";

// For parents
const INCLUDE_FAMILY_SECTION = true;
```

## Workflow Automation

### Morning Routine Automation

Create `.claude/commands/morning.md`:
```markdown
# Morning Routine

Executes complete morning workflow.

## Steps
1. Create daily note
2. Review yesterday's uncomplete tasks
3. Check calendar for today
4. Pull priority from weekly goals
5. Set time blocks
6. Generate motivation quote
```

### End-of-Day Automation

Create `.claude/commands/evening.md`:
```markdown
# Evening Shutdown

Complete end-of-day routine.

## Steps
1. Mark task completion
2. Write reflection
3. Move incomplete tasks
4. Set tomorrow's priority
5. Commit to git
6. Generate daily summary
```

### Project Kickoff Automation

Create `.claude/commands/kickoff.md`:
```markdown
# Project Kickoff

Initialize new project with structure.

## Steps
1. Create project folder
2. Add CLAUDE.md with template
3. Create project plan
4. Set up project board
5. Add to active projects list
6. Create first milestone
```

## Theme and Appearance

### Obsidian Theme Customization

#### CSS Snippets
Create `.obsidian/snippets/custom.css`:
```css
/* Custom colors */
.theme-dark {
  --text-accent: #7c3aed; /* Purple accent */
  --interactive-accent: #7c3aed;
}

/* Larger headings */
.markdown-preview-view h1 {
  font-size: 2.5em;
  color: var(--text-accent);
}

/* Checkbox styling */
input[type=checkbox]:checked {
  background-color: #10b981; /* Green */
}

/* Tag colors */
.tag[href="#priority/high"] {
  background-color: #ef4444;
  color: white;
}

.tag[href="#energy/low"] {
  background-color: #3b82f6;
  color: white;
}
```

### Daily Note Styling

Add to your daily template:
```markdown
<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 20px; border-radius: 10px; color: white; margin-bottom: 20px;">
  <h2 style="margin: 0;">{{date:dddd, MMMM DD, YYYY}}</h2>
  <p style="margin: 5px 0; font-style: italic;">Your daily mission statement here</p>
</div>
```

## Advanced Configurations

### Dataview Queries

If using Dataview plugin:

#### Task Dashboard
````markdown
```dataview
TABLE 
  file.link AS "Note",
  filter(file.tasks, (t) => !t.completed) AS "Open Tasks"
FROM "Daily Notes"
WHERE file.day >= date(today) - dur(7 days)
SORT file.day DESC
```
````

#### Habit Tracker
````markdown
```dataview
TABLE 
  exercise AS "🏃",
  meditation AS "🧘",
  reading AS "📚",
  water AS "💧"
FROM "Daily Notes"
WHERE file.day >= date(today) - dur(30 days)
```
````

### Templater Scripts

If using Templater plugin:

#### Auto-weather
```javascript
<%* 
const response = await fetch('http://wttr.in/?format=3');
const weather = await response.text();
tR += weather;
%>
```

#### Random Quote
```javascript
<%* 
const quotes = [
  "The way to get started is to quit talking and begin doing.",
  "The future belongs to those who believe in the beauty of their dreams.",
  "It is during our darkest moments that we must focus to see the light."
];
const randomQuote = quotes[Math.floor(Math.random() * quotes.length)];
tR += randomQuote;
%>
```

### Git Hooks

Create `.git/hooks/pre-commit`:
```bash
#!/bin/bash
# Auto-format markdown files before commit

# Format all markdown files
find . -name "*.md" -type f -exec prettier --write {} \;

# Add formatted files back
git add -A
```

### Mobile Shortcuts

#### iOS Shortcuts
Create Siri Shortcuts for:
- "Create daily note" → Opens GitHub app to issue creation
- "Add task" → Creates issue with 'task' label
- "Weekly review" → Triggers GitHub Action

#### Android Automation
Use Tasker or Automate for:
- Morning notification to create daily note
- Evening reminder for reflection
- Location-based project reminders

## Integration Examples

### Calendar Integration
```markdown
## Today's Events
<!-- Embed calendar events -->
![[calendar-sync/{{date}}.md]]
```

### Email Integration
```markdown
## Inbox Processing
- [ ] Email from: [sender] Re: [subject]
  - Action: [Reply/Archive/Delegate]
```

### Task Manager Sync
```markdown
## External Tasks
<!-- Pulled from Todoist/Things/etc -->
- [ ] [Task from external system]
```

## Best Practices

### Start Simple
1. Begin with minimal customization
2. Add complexity as patterns emerge
3. Review and refine monthly

### Document Your System
Create `vault/System Documentation.md`:
```markdown
# My PKM System Rules

## File Naming
- Daily notes: YYYY-MM-DD.md
- Projects: PascalCase
- Resources: lowercase-with-dashes

## My Workflows
- Morning: ...
- Weekly: ...
- Monthly: ...

## My Conventions
- Tags: ...
- Links: ...
- Templates: ...
```

### Regular Reviews
- Weekly: Adjust templates based on use
- Monthly: Review folder structure
- Quarterly: Major system updates
- Yearly: Complete system overhaul

---

Remember: The goal is a system that works for YOU. Don't copy others blindly - adapt and evolve based on your actual needs and patterns.