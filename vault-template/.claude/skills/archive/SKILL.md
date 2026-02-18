---
name: archive
description: Soft-archive notes by moving them to Archives/ with metadata. Preserves backlinks and adds archival context. Use when a project is complete, a note is outdated, or content needs to be retired.
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
user-invocable: true
---

# Archive Skill

Moves notes to `Archives/` with metadata preservation, keeping backlinks intact.

## Usage

```
/archive "Project Alpha"
/archive "2024-01-15.md" --reason "Project completed"
```

Or ask:
- "Archive the Project Alpha notes"
- "Move old daily notes to the archive"
- "Archive everything in Inbox that's older than 30 days"

## How to Execute

### Step 1: Find the note(s) to archive

Search for the specified note:

```
Glob:
  pattern: "**/<note name>*"
```

If multiple matches, list them and ask the user which to archive.

### Step 2: Read the note

Read the full content to preserve it during the move.

### Step 3: Add archive metadata

If the note has YAML frontmatter, add archive fields:

```yaml
archived: true
archivedDate: YYYY-MM-DD
archivedReason: "Reason provided by user"
```

If no frontmatter exists, add a minimal block:

```yaml
---
archived: true
archivedDate: YYYY-MM-DD
archivedReason: "Reason provided by user"
---
```

Also add the `#archived` tag if a `tags:` field exists.

### Step 4: Move the file

Determine the archive destination based on the source location:

| Source | Destination |
|--------|------------|
| `Daily Notes/` | `Archives/Daily Notes/` |
| `Projects/` | `Archives/Projects/` |
| `Goals/` | `Archives/Goals/` |
| Root or other | `Archives/` |

Use bash to move the file:

```bash
mkdir -p "Archives/<subfolder>"
mv "<source path>" "Archives/<subfolder>/<filename>"
```

### Step 5: Update backlinks (optional)

Search for any notes that link to the archived file:

```
Grep:
  pattern: "\\[\\[<filename without .md>\\]\\]"
  glob: "*.md"
```

If found, inform the user:

```
Note: 3 files still link to the archived note:
  - Daily Notes/2024-01-20.md
  - Projects/Beta/tasks.md
  - Goals/2024 Goals.md

Wiki-links will still resolve if Obsidian is configured to search all folders.
```

### Step 6: Confirm

```
Archived: "Project Alpha.md"
  From: Projects/Alpha/
  To: Archives/Projects/Alpha/
  Reason: Project completed
  Backlinks: 3 notes still reference this file
```

## Batch Archiving

For bulk operations like "archive old daily notes":

1. Find matching files using Glob
2. List them for user confirmation
3. Process each file with the same steps above
4. Summarise: "Archived 15 daily notes from January 2024"

## Tips

- Archived notes remain searchable — they're just moved, not deleted
- Wiki-links work across folders in Obsidian, so backlinks won't break
- Use `/search` to find content in archives
- The `#archived` tag makes it easy to exclude archived notes from queries
