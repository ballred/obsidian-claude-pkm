---
name: task
description: Quick-create a task note with priority, due date, and project link. Use when the user wants to capture a to-do item, action item, or reminder.
allowed-tools: Read, Write, Edit, Glob, Grep
user-invocable: true
---

# Task Skill

Quick-create task notes linked to projects with priority and due date.

## Usage

```
/task Buy new notebook
/task Review PR for Project Alpha --priority high --due 2024-02-01
/task Schedule dentist appointment --priority low
```

Or ask naturally:
- "Create a task to review the quarterly goals"
- "Add a high priority task for the budget review, due Friday"

## How to Execute

### Step 1: Parse the input

Extract from the user's message:
- **Title** (required) — what needs to be done
- **Priority** — high, medium, or low (default: medium)
- **Due date** — ISO format YYYY-MM-DD (default: null)
- **Project** — linked project name if mentioned (default: null)

### Step 2: Check for existing task

Search for a task with the same title:

```
Grep:
  pattern: <task title>
  path: Projects/
  glob: "**/*.md"
```

If a matching task already exists in a project's task list, inform the user and ask if they want to create a separate task note anyway.

### Step 3: Find related project

If the user mentioned a project, search for it:

```
Glob:
  pattern: "Projects/*/CLAUDE.md"
```

Read project names and match against the user's input.

### Step 4: Create the task note

Write to the user's daily note or a dedicated task section. Add the task as a markdown checkbox:

```markdown
- [ ] **Task title** #priority/high 📅 2024-02-01
  - Project: [[Project Name]]
  - Created: 2024-01-15
```

### Where to add the task

1. **If today's daily note exists** — add to the `## Tasks` section
2. **If a project was specified** — also add to the project's task list
3. **If neither exists** — create the task in the daily note (create the note if needed using the daily template pattern)

### Step 5: Confirm

Tell the user:
```
Created task: "Task title"
  Priority: high
  Due: 2024-02-01
  Project: Project Alpha
  Added to: Daily Notes/2024-01-15.md
```

## Task Format

Tasks are markdown checkboxes with inline metadata:

```markdown
- [ ] **Task description** #priority/medium 📅 YYYY-MM-DD
- [x] **Completed task** #priority/high ✅ 2024-01-10
```

Priority tags follow the vault's tag system:
- `#priority/high` — urgent or blocking
- `#priority/medium` — important but not urgent
- `#priority/low` — nice to have

## Tips

- Tasks without a due date are undated reminders
- Link tasks to projects for better tracking: `[[Project Name]]`
- Use `/daily` to review today's tasks in context
- Use `/weekly` to review all open tasks across the vault
