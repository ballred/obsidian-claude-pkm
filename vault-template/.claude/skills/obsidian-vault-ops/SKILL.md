---
name: obsidian-vault-ops
description: Read and write Obsidian vault files, manage wiki-links, process markdown with YAML frontmatter. Use when working with vault file operations, creating notes, or managing links.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# Obsidian Vault Operations Skill

Core operations for reading, writing, and managing files in an Obsidian vault.

## Vault Structure

```
vault-root/
├── CLAUDE.md           # Main context (always read first)
├── Daily Notes/        # YYYY-MM-DD.md format
├── Goals/              # Goal cascade files
├── Projects/           # Project folders with CLAUDE.md
├── Templates/          # Reusable note structures
└── Archives/           # Completed/inactive content
```

## File Operations

### Reading Notes
- Use Glob to find files: `*.md`, `Daily Notes/*.md`
- Read CLAUDE.md first for vault context
- Check for wiki-links to related notes

### Creating Notes
1. Check if note already exists
2. Use appropriate template if available
3. Add YAML frontmatter with date and tags
4. Insert wiki-links to related notes

### Editing Notes
- Preserve YAML frontmatter structure
- Maintain existing wiki-links
- Use consistent heading hierarchy
- Apply standard tag format

## Wiki-Link Format

```markdown
[[Note Name]]                    # Simple link
[[Note Name|Display Text]]       # Link with alias
[[Note Name#Section]]            # Link to section
```

## YAML Frontmatter

Standard frontmatter structure:
```yaml
---
date: 2024-01-15
tags: [tag1, tag2]
status: active
---
```

## Template Variables

When processing templates, replace:
- `{{date}}` - Today's date (YYYY-MM-DD)
- `{{date:format}}` - Formatted date
- `{{date-1}}` - Yesterday
- `{{date+1}}` - Tomorrow
- `{{time}}` - Current time

## Common Patterns

### Daily Note Creation
1. Calculate today's date in YYYY-MM-DD format
2. Check if `Daily Notes/{date}.md` exists
3. If not, read `Templates/Daily Template.md`
4. Replace template variables
5. Write to `Daily Notes/{date}.md`

### Finding Related Notes
1. Extract key terms from current note
2. Search vault for matching content
3. Suggest wiki-links to related notes

### Tag Operations
- Priority: `#priority/high`, `#priority/medium`, `#priority/low`
- Status: `#active`, `#waiting`, `#completed`, `#archived`
- Context: `#work`, `#personal`, `#health`, `#learning`

## Best Practices

1. Always check CLAUDE.md for vault-specific conventions
2. Preserve existing structure when editing
3. Use relative paths for internal links
4. Add frontmatter to new notes
5. Link to relevant goals when creating tasks
