# Onboard Command

Loads all CLAUDE.md files from your vault to provide comprehensive context to Claude Code for intelligent assistance.

## Installation
Copy this file to `.claude/commands/onboard.md` in your vault root.

## Usage
```
claude code /onboard
```

For specific project context:
```
claude code /onboard Projects/MyProject
```

## Configuration
Customize context loading:

```javascript
// Configuration
const CLAUDE_FILE_NAME = "CLAUDE.md";
const MAX_DEPTH = 5; // How deep to search for CLAUDE.md files
const INCLUDE_TEMPLATES = false; // Load template files too
const LOAD_RECENT_NOTES = true; // Include last 7 days of daily notes
```

## What This Command Does

1. **Discovers Context Files**
   - Searches for all CLAUDE.md files
   - Traverses project directories
   - Respects depth limits

2. **Loads Hierarchical Context**
   - Root CLAUDE.md first (global context)
   - Project-specific CLAUDE.md files
   - Recent daily notes for current state

3. **Builds Understanding**
   - Your personal mission/goals
   - Project structures and status
   - Workflow preferences
   - Custom conventions

## Context Hierarchy

```
vault/
├── CLAUDE.md                 # [1] Global context - loaded first
├── Projects/
│   ├── Project A/
│   │   └── CLAUDE.md         # [2] Project context - loaded second
│   └── Project B/
│       └── CLAUDE.md         # [3] Another project context
└── Areas/
    └── Health/
        └── CLAUDE.md         # [4] Area-specific context
```

## CLAUDE.md File Structure

### Root CLAUDE.md Should Include
```markdown
# System Context for Claude

## Personal Mission
[Your life mission/purpose]

## Current Focus
[What you're working on now]

## Preferences
- Writing style: [Formal/Casual/Technical]
- Detail level: [High/Medium/Low]
- Decision making: [Collaborative/Directive]

## Conventions
- File naming: [Your patterns]
- Tag system: [Your tags]
- Workflow: [Your process]
```

### Project CLAUDE.md Should Include
```markdown
# Project: [Name]

## Overview
[What this project is about]

## Current Status
[Where things stand]

## Key Decisions
[Important choices made]

## Next Steps
[What needs to happen]

## Context for Claude
[Specific things Claude should know]
```

## Smart Context Loading

### Recent Activity
Automatically includes:
```javascript
// Last 7 days of daily notes
const recentNotes = getDailyNotes(7);
// Current week's review
const weeklyReview = getCurrentWeekReview();
// Active project updates
const activeProjects = getModifiedProjects(3); // days
```

### Selective Loading
For focused assistance:
```bash
# Load only specific project
claude code /onboard Projects/WebApp

# Load only certain areas
claude code /onboard Areas/Health

# Full context load
claude code /onboard all
```

## Use Cases

### Project Work
```bash
claude code /onboard Projects/MyApp
claude code "Help me refactor the authentication module"
```

### Daily Planning
```bash
claude code /onboard
claude code "Review my goals and suggest today's priorities"
```

### Weekly Review
```bash
claude code /onboard Goals
claude code "Analyze my week and suggest improvements"
```

## Context Variables

Your CLAUDE.md files can include variables:

```markdown
## Variables for Claude
- DEFAULT_LANGUAGE: JavaScript
- TIMEZONE: America/New_York
- WORK_HOURS: 9am-5pm
- PREFERRED_FRAMEWORKS: React, Node.js
- COMMUNICATION_STYLE: Direct and concise
```

Claude will use these for better assistance.

## Advanced Features

### Conditional Context
```markdown
## Context by Day
<!-- IF: Monday -->
Focus on weekly planning and goal setting
<!-- IF: Friday -->
Focus on review and closure
<!-- ENDIF -->
```

### Project Templates
```markdown
## When Creating New Projects
Use this structure:
1. Create project folder
2. Add CLAUDE.md
3. Set up initial files
4. Create project note from template
```

### Workflow Triggers
```markdown
## Automated Workflows
When I say "morning routine":
1. Create daily note
2. Review yesterday's tasks
3. Set today's priority
4. Check calendar
```

## Performance Optimization

### Large Vaults
For vaults with many files:
```javascript
// Limit context loading
const OPTIONS = {
  maxFiles: 10,
  maxSizePerFile: 50000, // characters
  prioritize: ["Goals", "Active Projects"]
};
```

### Caching
Context is cached for session:
```javascript
// Cache duration
const CACHE_DURATION = 3600000; // 1 hour
// Force refresh
claude code /onboard --refresh
```

## Privacy & Security

### Sensitive Information
Never include in CLAUDE.md:
- Passwords or credentials
- Personal identification numbers
- Financial account details
- Private personal information

### Safe Context Examples
✅ "I work in healthcare technology"
✅ "My projects involve web development"
✅ "I prefer morning work sessions"

❌ "My SSN is..."
❌ "My bank account..."
❌ "My private API key..."

## Best Practices

### Keep Context Updated
- Review CLAUDE.md files monthly
- Update after major decisions
- Remove outdated information
- Add new learnings

### Be Specific
- Clear project descriptions
- Specific preferences
- Concrete examples
- Defined conventions

### Hierarchical Information
- Global → Area → Project → Task
- General → Specific
- Strategic → Tactical

## Troubleshooting

### Context Not Loading?
- Check file names (CLAUDE.md exactly)
- Verify file permissions
- Ensure valid markdown
- Check file encoding (UTF-8)

### Too Much Context?
- Use selective loading
- Reduce MAX_DEPTH
- Archive old projects
- Clean up CLAUDE.md files

### Conflicting Instructions?
- More specific overrides general
- Project overrides global
- Recent overrides old

## Integration Examples

### With Daily Command
```bash
claude code /onboard
claude code /daily
# Claude now knows your full context for the daily note
```

### With Push Command
```bash
claude code /onboard
# Make changes with Claude's help
claude code /push "Changes guided by Claude"
```

## Related Commands
- `/daily` - Create daily note
- `/weekly` - Run weekly review
- `/push` - Save to Git

---

*Command Version: 1.0*
*Optimized for: Quick context loading*

**Remember:** Good context leads to better assistance. Keep your CLAUDE.md files current!