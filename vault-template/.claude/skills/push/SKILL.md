---
name: push
description: Commit and push vault changes to Git with smart commit messages. Auto-stages files, creates meaningful commits, and syncs with remote. Use after making vault changes or at end of day.
allowed-tools: Bash, Read, Glob
user-invocable: true
---

# Git Push Skill

Automates Git workflow to save your notes with meaningful commit messages and push to remote repository.

## Usage

Invoke with `/push` or ask Claude to save/commit your changes.

### Basic Usage
```
/push
```

### With Custom Message
```
/push "Completed project planning"
```

## What This Skill Does

1. **Stages All Changes**
   - Adds all modified files
   - Includes new files
   - Removes deleted files

2. **Creates Smart Commit Message**
   - Uses provided message, or
   - Auto-generates from changes
   - Includes date/time stamp
   - Summarizes key modifications

3. **Syncs with Remote**
   - Pulls latest changes (if enabled)
   - Pushes to remote repository
   - Handles merge conflicts gracefully

## Commit Message Format

### Automatic Messages
Based on your changes:
```
Daily note for 2024-01-15 + 3 project updates
- Added: Daily Notes/2024-01-15.md
- Modified: Projects/Learning Spanish/notes.md
- Modified: Goals/2. Monthly Goals.md
```

### With Timestamp
```
[2024-01-15 09:30] Completed weekly review
```

## Workflow Integration

### Morning Routine
```
/daily          # Create daily note
# ... work on notes ...
/push "Morning planning complete"
```

### End of Day
```
# Complete daily reflection
/push           # Auto-message with summary
```

### After Weekly Review
```
/weekly         # Run weekly review
/push "Weekly review - Week 3"
```

## Git Operations

### Standard Flow
1. `git add .` - Stage all changes
2. `git commit -m "message"` - Create commit
3. `git pull --rebase origin main` - Get remote changes
4. `git push origin main` - Push to remote

### Safety Checks
- Verify Git repository exists
- Check for uncommitted changes
- Ensure remote is configured
- Validate branch exists

## Conflict Handling

If conflicts occur:
1. Auto-resolve attempts (favor local for notes)
2. If manual resolution needed, guide through process
3. Never force push without explicit request

## Security Considerations

### Never Commit
- Passwords or credentials
- API keys
- Personal identification
- Financial information

### Use .gitignore for
```
private/
credentials.md
.env
.obsidian/workspace*
.obsidian/cache
.trash/
.DS_Store
```

## Troubleshooting

### Push Rejected?
Pull first, then push again:
```bash
git pull --rebase origin main
git push origin main
```

### Not a Git Repository?
```bash
git init
git remote add origin [URL]
```

### Large Files Issue?
Consider Git LFS for images/attachments.

## Integration

Works with:
- `/daily` - Commit after creating daily note
- `/weekly` - Commit after weekly review
- `/onboard` - No git needed for context loading
- Auto-commit hook for automatic saves
