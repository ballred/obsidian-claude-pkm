---
paths: "**/*.md"
---

# Markdown Standards for Vault

These conventions apply to all markdown files in the vault.

## File Naming

- **Daily notes:** `YYYY-MM-DD.md` (e.g., `2024-01-15.md`)
- **Project folders:** PascalCase (e.g., `MyProject/`)
- **General notes:** kebab-case (e.g., `meeting-notes.md`)
- **Templates:** Title Case with space (e.g., `Daily Template.md`)

## Heading Structure

- H1 (`#`) for note title only - one per file
- H2 (`##`) for major sections
- H3 (`###`) for subsections
- Never skip heading levels (no H1 -> H3)

## Links

### Internal Links (Wiki-style)
```markdown
[[Note Name]]                    # Link to note
[[Note Name|Display Text]]       # Link with alias
[[Note Name#Section]]            # Link to heading
[[Folder/Note Name]]             # Link with path
```

### External Links
```markdown
[Display Text](https://url.com)
```

## Tags

### Standard Tag Hierarchy
```
#priority/high
#priority/medium
#priority/low

#status/active
#status/waiting
#status/completed
#status/archived

#context/work
#context/personal
#context/health
#context/learning
#context/family
```

### Tag Placement
- In YAML frontmatter: `tags: [tag1, tag2]`
- Inline: at end of relevant line or paragraph

## Task Format

```markdown
- [ ] Incomplete task
- [x] Completed task
- [ ] Task with context #work @home
- [ ] Task with due date 📅 2024-01-20
```

## YAML Frontmatter

All notes should include frontmatter:
```yaml
---
date: YYYY-MM-DD
tags: [relevant, tags]
status: active|completed|archived
---
```

## Text Formatting

- **Bold** for emphasis and key terms
- *Italic* for subtle emphasis
- `Code` for commands, paths, technical terms
- > Blockquotes for important callouts

## Lists

- Use `-` for unordered lists
- Use `1.` for ordered lists
- Indent with 2 spaces for nested items

## Code Blocks

Use fenced code blocks with language:
```javascript
const example = "code";
```

## Best Practices

1. One idea per paragraph
2. Use blank lines between sections
3. Keep lines under 100 characters when possible
4. Include links to related notes
5. Add meaningful frontmatter
