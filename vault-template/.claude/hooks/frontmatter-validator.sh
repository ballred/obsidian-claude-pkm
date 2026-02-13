#!/bin/bash
# Frontmatter validation hook (PostToolUse: Edit|Write)
# Checks that markdown files have required frontmatter fields: date, tags, status
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

# Extract frontmatter (between first two --- lines)
FRONTMATTER=$(awk '/^---$/{n++; next} n==1{print} n>=2{exit}' "$FILE_PATH")
[ -z "$FRONTMATTER" ] && {
    echo "⚠️  Frontmatter missing: $BASENAME has no YAML frontmatter (---)" >&2
    exit 0
}

# Check required fields
MISSING=""

echo "$FRONTMATTER" | grep -q "^date:" || MISSING="${MISSING}date, "
echo "$FRONTMATTER" | grep -q "^tags:" || MISSING="${MISSING}tags, "
echo "$FRONTMATTER" | grep -q "^status:" || MISSING="${MISSING}status, "

if [ -n "$MISSING" ]; then
    MISSING="${MISSING%, }"
    echo "⚠️  Frontmatter incomplete: $BASENAME is missing: $MISSING" >&2
fi

# Always exit 0 — this is a warning, not a blocker
exit 0
