---
paths: "Projects/**/*.md"
---

# Project Management Rules

These conventions apply to project folders and documentation.

## Project Structure

Each project gets its own folder:
```
Projects/
└── Project-Name/
    ├── CLAUDE.md           # Required: Project context for AI
    ├── README.md           # Optional: Overview if complex
    ├── notes/              # Optional: Related notes
    └── resources/          # Optional: Reference materials
```

## Project CLAUDE.md

Every project must have a CLAUDE.md file with:

```markdown
# Project: [Name]

## Overview
[1-2 sentence description of what this project is]

## Status
- **Phase:** Planning | Active | On Hold | Complete
- **Progress:** X%
- **Started:** YYYY-MM-DD
- **Target:** YYYY-MM-DD

## Goals
What success looks like for this project.

## Current Focus
What I'm actively working on right now.

## Key Decisions
Important decisions made and their rationale.

## Next Actions
- [ ] Immediate next step
- [ ] Following step

## Blockers
Anything preventing progress.

## Resources
- [[Related Note]]
- [External Link](url)

## Notes for Claude
[Any specific context Claude should know when helping with this project]
```

## Project Status Values

Use consistent status labels:
- `Planning` - Defining scope and approach
- `Active` - Currently being worked on
- `On Hold` - Temporarily paused (note reason)
- `Blocked` - Waiting on external dependency
- `Review` - Work complete, needs review
- `Complete` - Done and ready for archive

## Progress Tracking

### Percentage Guidelines
- 0-10%: Planning and setup
- 10-30%: Initial implementation
- 30-70%: Core work
- 70-90%: Refinement and polish
- 90-100%: Final review and completion

### Update Frequency
- Update progress weekly at minimum
- Update status when it changes
- Update blockers immediately

## Linking Projects

### To Goals
Link projects to their parent goals:
```markdown
**Supports:** [[1. Yearly Goals#Goal Name]]
```

### To Daily Notes
Reference project work in daily notes:
```markdown
## Work Log
- Worked on [[Project Name]] - completed X
```

### Between Projects
Link related projects:
```markdown
**Related:** [[Other Project]]
```

## Project Lifecycle

### Starting a Project
1. Create folder in `Projects/`
2. Create CLAUDE.md from template
3. Link to relevant goal
4. Define first next action
5. Set target completion date

### During Project
1. Update CLAUDE.md with progress
2. Log work in daily notes
3. Capture decisions and rationale
4. Track blockers immediately
5. Adjust timeline if needed

### Completing a Project
1. Update status to Complete
2. Add completion date and summary
3. Document lessons learned
4. Move folder to Archives/Projects/
5. Update goal progress

## Best Practices

1. Keep project scope realistic
2. One primary focus at a time
3. Break large projects into phases
4. Review all active projects weekly
5. Archive completed projects promptly
6. Document decisions as they're made
7. Link to relevant context liberally
