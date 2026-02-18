#!/bin/bash
# Frontmatter validation hook (PostToolUse: Write|Edit)
# Checks that markdown files have YAML frontmatter delimiters (---)
# Non-blocking — warns but does not prevent the operation (exit 0)

# Read tool use JSON from stdin
INPUT=$(cat)

# Extract file path from tool input
FILE_PATH=$(echo "$INPUT" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//;s/"$//')
[ -z "$FILE_PATH" ] && exit 0

# Only validate markdown files
case "$FILE_PATH" in
    *.md) ;;
    *) exit 0 ;;
esac

# Skip templates (they use placeholder syntax)
case "$FILE_PATH" in
    */Templates/*) exit 0 ;;
esac

# Skip CLAUDE.md and config files
BASENAME=$(basename "$FILE_PATH")
case "$BASENAME" in
    CLAUDE.md|CLAUDE.local.md|README.md) exit 0 ;;
esac

# Check file exists
[ -f "$FILE_PATH" ] || exit 0

# Check for frontmatter delimiters (opening and closing ---)
DELIMITER_COUNT=$(grep -c '^---$' "$FILE_PATH")
if [ "$DELIMITER_COUNT" -lt 2 ]; then
    echo "⚠️  Frontmatter missing: $BASENAME has no YAML frontmatter (---)" >&2
fi

# Always exit 0 — this is a warning, not a blocker
exit 0
