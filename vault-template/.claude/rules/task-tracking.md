---
paths: "**/*.md"
---

# Session Task Tracking Conventions

These conventions govern the use of Claude Code's session task tools (`TaskCreate`, `TaskUpdate`, `TaskList`) for providing progress visibility during multi-step operations.

## Key Distinction

**Session tasks ≠ Your actual tasks**

- **Session tasks**: Temporary progress indicators that exist only during a Claude session
- **Your tasks**: Markdown checkboxes in daily notes that persist across sessions

Session tasks show *what Claude is doing*. Markdown checkboxes track *what you need to do*.

## When to Use Session Tasks

Use session tasks for operations with 3+ distinct steps:

### Good Use Cases
- Morning/evening routines (4+ steps)
- Weekly review phases (3 phases)
- Batch inbox processing (multiple items)
- Multi-file analysis (goal cascade)
- Vault organization audits

### Skip Session Tasks For
- Single file reads/writes
- Quick lookups
- Simple edits
- 1-2 step operations

## Task Naming Conventions

### Subject (Imperative)
```
Create daily note
Pull incomplete tasks
Calculate goal progress
Process inbox item
```

### activeForm (Present Continuous)
```
Creating daily note...
Pulling incomplete tasks...
Calculating goal progress...
Processing inbox item...
```

The `activeForm` appears in the spinner while the task runs.

## Task Dependencies

Use dependencies when order matters:

```
Task 1: Collect (no dependencies)
Task 2: Reflect (blockedBy: Task 1)
Task 3: Plan (blockedBy: Task 2)
```

This ensures phases complete in sequence.

## Progress Patterns

### Sequential Steps
```
[Spinner] Step 1 of 4: Creating daily note...
[Spinner] Step 2 of 4: Pulling tasks...
[Spinner] Step 3 of 4: Surfacing goals...
[Spinner] Step 4 of 4: Setting time blocks...
[Done] Morning routine complete (4/4)
```

### Batch Processing
```
[Spinner] Processing item 1/5: Meeting notes...
[Spinner] Processing item 2/5: Book idea...
...
[Done] Inbox complete (5/5 items)
```

### Phased Work
```
[Done] Phase 1: Collect complete
[Spinner] Phase 2: Reflect in progress...
[Pending] Phase 3: Plan (blocked)
```

## Status Transitions

```
pending → in_progress → completed
```

- Set `in_progress` when starting a task
- Set `completed` only when fully done
- Never mark incomplete work as completed

## Best Practices

1. **Create tasks upfront** - Create all tasks at the start of a multi-step operation
2. **Update as you go** - Mark tasks in_progress before starting, completed after finishing
3. **Use activeForm** - Always provide spinner text for user visibility
4. **Keep it lightweight** - Don't over-task simple operations
5. **Trust markdown for persistence** - Session tasks disappear; use checkboxes for real work

## Integration with PKM

Session tasks complement but don't replace:

| Concern | Tool |
|---------|------|
| Progress during session | Session tasks (TaskCreate/Update) |
| Actual to-do items | Markdown checkboxes in daily notes |
| Goal tracking | Percentages in goal files |
| Project status | Project CLAUDE.md files |
