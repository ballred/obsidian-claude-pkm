# Daily Note Creator Command

Creates today's daily note from the template, or opens it if it already exists.

## Installation
Copy this file to `.claude/commands/daily.md` in your vault root.

## Usage
```
claude code /daily
```

## Configuration
Customize these paths to match your vault structure:

```javascript
// Path Configuration (customize these)
const DAILY_NOTES_FOLDER = "Daily Notes";
const TEMPLATE_PATH = "Templates/Daily Template.md";
const DATE_FORMAT = "YYYY-MM-DD"; // Change if you prefer different format
```

## What This Command Does

1. **Checks if today's note exists**
   - If yes: Opens the existing note
   - If no: Creates new note from template

2. **Template Processing**
   - Replaces `{{date}}` with today's date
   - Replaces `{{date:format}}` with formatted dates
   - Handles date arithmetic (e.g., `{{date-1}}` for yesterday)

3. **Automatic Organization**
   - Places note in correct folder
   - Names file with today's date
   - Preserves your template structure

## Template Variables

Your daily template can use these variables:

- `{{date}}` - Today's date in default format
- `{{date:dddd}}` - Day name (e.g., Monday)
- `{{date:MMMM DD, YYYY}}` - Formatted date
- `{{date-1:YYYY-MM-DD}}` - Yesterday's date
- `{{date+1:YYYY-MM-DD}}` - Tomorrow's date
- `{{time}}` - Current time

## Example Workflow

1. Morning routine:
   ```
   claude code /daily
   ```
   Creates today's note with your template

2. Review yesterday:
   The template automatically links to yesterday's note

3. Plan tomorrow:
   End of day, set tomorrow's priority in the reflection

## Customization Ideas

### Different Date Formats
Change `DATE_FORMAT` to:
- `"YYYY-MM-DD"` - Standard ISO format (recommended)
- `"MM-DD-YYYY"` - US format
- `"DD-MM-YYYY"` - European format
- `"YYYY-MM-DD-ddd"` - Include day abbreviation

### Folder Organization
Organize by month/year:
```javascript
const year = new Date().getFullYear();
const month = String(new Date().getMonth() + 1).padStart(2, '0');
const DAILY_NOTES_FOLDER = `Daily Notes/${year}/${month}`;
```

### Multiple Templates
For different day types:
```javascript
const dayOfWeek = new Date().getDay();
const TEMPLATE_PATH = dayOfWeek === 1 
  ? "Templates/Monday Template.md"  // Special Monday template
  : "Templates/Daily Template.md";   // Regular template
```

## Troubleshooting

### Note not created?
- Check template path exists
- Verify folder permissions
- Ensure template file is readable

### Wrong date format?
- Adjust `DATE_FORMAT` constant
- Check system date settings

### Links not working?
- Verify date format matches
- Check file naming convention

## Related Commands
- `/weekly` - Create weekly review
- `/push` - Save changes to Git
- `/onboard` - Load context

---

*Command Version: 1.0*
*Compatible with: Claude Code CLI*

**Pro Tip:** Run this as part of your morning routine for consistency!