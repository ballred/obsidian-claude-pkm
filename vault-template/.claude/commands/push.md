# Git Push Command

Automates the Git workflow to save your notes with a meaningful commit message and push to remote repository.

## Installation
Copy this file to `.claude/commands/push.md` in your vault root.

## Usage
```
claude code /push
```

Or with a custom message:
```
claude code /push "Completed project planning"
```

## Configuration
Customize these settings:

```javascript
// Configuration
const DEFAULT_REMOTE = "origin";
const DEFAULT_BRANCH = "main";
const AUTO_PULL_FIRST = true; // Pull before pushing to avoid conflicts
const INCLUDE_TIMESTAMP = true; // Add timestamp to commit message
```

## What This Command Does

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

### Manual Message
```
claude code /push "Major project milestone reached"
```

## Smart Features

### Conflict Prevention
```javascript
// Always pull before push
if (AUTO_PULL_FIRST) {
  git pull --rebase origin main
}
```

### Change Summary
Analyzes your changes:
- Daily notes added
- Projects modified
- Goals updated
- Templates changed

### Safety Checks
- Verifies Git repository exists
- Checks for uncommitted changes
- Ensures remote is configured
- Validates branch exists

## Workflow Integration

### Morning Routine
```bash
claude code /daily          # Create daily note
# ... work on notes ...
claude code /push "Morning planning complete"
```

### End of Day
```bash
# Complete daily reflection
claude code /push           # Auto-message with summary
```

### After Weekly Review
```bash
claude code /weekly         # Run weekly review
claude code /push "Weekly review - Week 3"
```

## Advanced Options

### Multiple Remotes
```javascript
// Push to multiple remotes
const REMOTES = ["origin", "backup"];
REMOTES.forEach(remote => {
  git push remote main
});
```

### Branch-Based Workflow
```javascript
// Create feature branches for projects
const project = "new-feature";
git checkout -b project
git add .
git commit -m message
git push -u origin project
```

### Automated Backups
```javascript
// Schedule automatic pushes
const BACKUP_INTERVAL = 3600000; // 1 hour
setInterval(() => {
  git add .
  git commit -m "Automated backup"
  git push
}, BACKUP_INTERVAL);
```

## Git Configuration

### Initial Setup
```bash
# Initialize repository
git init

# Add remote
git remote add origin https://github.com/username/vault.git

# Set user info
git config user.name "Your Name"
git config user.email "your.email@example.com"
```

### Recommended .gitignore
```
.obsidian/workspace*
.obsidian/cache
.trash/
.DS_Store
```

## Commit Message Best Practices

### Good Messages
- ✅ "Completed Q1 planning and project kickoff"
- ✅ "Daily note: Fixed bug in authentication"
- ✅ "Weekly review - adjusted monthly goals"

### Avoid
- ❌ "Updates"
- ❌ "Changes"
- ❌ "WIP"

## Handling Conflicts

If conflicts occur:

1. **Auto-resolve attempts**
   - Favors local changes for notes
   - Merges both versions when possible

2. **Manual resolution needed**
   - Opens conflict markers
   - Prompts for resolution
   - Guides through process

## Mobile Sync via GitHub

This enables:
- View notes on GitHub mobile app
- Create issues for tasks
- Review changes on any device
- Emergency access from any browser

## Security Considerations

### Private Repository
Always use private repos for personal notes:
```bash
# GitHub CLI
gh repo create vault --private

# Or via settings
# Repository Settings > Make Private
```

### Sensitive Information
Never commit:
- Passwords
- API keys
- Personal identification
- Financial information

Use `.gitignore` for sensitive files:
```
private/
credentials.md
.env
```

## Troubleshooting

### Push Rejected?
```bash
# Pull first
git pull --rebase origin main
# Then push again
git push origin main
```

### Not a Git Repository?
```bash
# Initialize
git init
# Add remote
git remote add origin [URL]
```

### Large Files Issue?
```bash
# Use Git LFS for images/attachments
git lfs track "*.png"
git lfs track "*.pdf"
```

## Related Commands
- `/daily` - Create daily note
- `/weekly` - Run weekly review
- `/onboard` - Load context

---

*Command Version: 1.0*
*Requires: Git installed and configured*

**Pro Tip:** Commit early and often - your future self will thank you!