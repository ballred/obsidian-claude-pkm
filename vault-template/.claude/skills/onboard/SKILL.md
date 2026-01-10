---
name: onboard
description: Load CLAUDE.md context files from vault for comprehensive understanding. Discovers hierarchical context, recent notes, and project states. Use at start of session or when Claude needs full vault context.
allowed-tools: Read, Glob, Grep
user-invocable: true
---

# Onboard Skill

Loads all CLAUDE.md files from your vault to provide comprehensive context for intelligent assistance.

## Usage

Invoke with `/onboard` or ask Claude to learn about your vault.

### Full Context Load
```
/onboard
```

### Specific Project Context
```
/onboard Projects/MyProject
```

## What This Skill Does

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
│   │   └── CLAUDE.md         # [2] Project context
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

## Conventions
- File naming: [Your patterns]
- Tag system: [Your tags]
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
```

## Smart Context Loading

### Recent Activity
Automatically considers:
- Last 7 days of daily notes
- Current week's review
- Recently modified projects

### Selective Loading
For focused assistance:
```
/onboard Projects/WebApp      # Only specific project
/onboard Goals                # Only goals context
```

## Use Cases

### Starting a Session
```
/onboard
"Help me plan my day based on my goals"
```

### Project Work
```
/onboard Projects/MyApp
"Help me refactor the authentication module"
```

### Weekly Planning
```
/onboard Goals
"Analyze my week and suggest improvements"
```

## Context Variables

Your CLAUDE.md files can include preferences:

```markdown
## Variables for Claude
- DEFAULT_LANGUAGE: JavaScript
- TIMEZONE: America/New_York
- COMMUNICATION_STYLE: Direct and concise
```

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

## Privacy & Security

### Never Include in CLAUDE.md
- Passwords or credentials
- Personal identification numbers
- Financial account details
- Private API keys

### Safe Context Examples
- "I work in healthcare technology"
- "My projects involve web development"
- "I prefer morning work sessions"

## Integration

Works with:
- All other skills (provides context)
- `/daily` - Better daily planning with context
- `/weekly` - Informed weekly reviews
- Goal tracking - Understand goal cascade
