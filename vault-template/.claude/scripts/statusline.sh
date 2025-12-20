#!/bin/bash
# Status line script for Claude Code
# Shows vault statistics in the terminal status line

VAULT_PATH="${VAULT_PATH:-$(pwd)}"

# Count total notes (excluding hidden directories)
TOTAL_NOTES=$(find "$VAULT_PATH" -name "*.md" -type f -not -path "*/\.*" 2>/dev/null | wc -l | tr -d ' ')

# Count inbox items
INBOX_COUNT=0
if [ -d "$VAULT_PATH/Inbox" ]; then
    INBOX_COUNT=$(find "$VAULT_PATH/Inbox" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
fi

# Add notes tagged with #inbox (if grep available)
if command -v grep &> /dev/null; then
    TAGGED_INBOX=$(grep -rl "#inbox" "$VAULT_PATH" --include="*.md" 2>/dev/null | wc -l | tr -d ' ')
    INBOX_COUNT=$((INBOX_COUNT + TAGGED_INBOX))
fi

# Count uncommitted changes (if in git repo)
UNCOMMITTED="N/A"
if [ -d "$VAULT_PATH/.git" ]; then
    cd "$VAULT_PATH" || exit 1
    UNCOMMITTED=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
fi

# Check if today's note exists
TODAY=$(date +%Y-%m-%d)
if [ -f "$VAULT_PATH/Daily Notes/$TODAY.md" ]; then
    TODAY_STATUS="Yes"
else
    TODAY_STATUS="No"
fi

# Output status line (simple format)
echo "Notes: $TOTAL_NOTES | Inbox: $INBOX_COUNT | Uncommitted: $UNCOMMITTED | Today: $TODAY_STATUS"
