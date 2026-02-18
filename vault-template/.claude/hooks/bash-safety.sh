#!/bin/bash
# Bash safety hook (PermissionRequest: Bash)
# Blocks destructive commands that could damage the vault or git history
# BLOCKING — prevents execution of dangerous commands

# Read hook JSON from stdin
INPUT=$(cat)

# Extract the command (jq preferred, fallback to grep)
if command -v jq >/dev/null 2>&1; then
    COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
else
    COMMAND=$(echo "$INPUT" | grep -o '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"command"[[:space:]]*:[[:space:]]*"//;s/"$//')
fi
[ -z "$COMMAND" ] && exit 0

# Check for destructive patterns
REASON=""

# Recursive delete
if echo "$COMMAND" | grep -qE 'rm\s+.*-[a-zA-Z]*[rR]'; then
    REASON="Recursive rm detected"
fi

# Force push
if echo "$COMMAND" | grep -qE 'git\s+push\s+.*--force|git\s+push\s+-f'; then
    REASON="Force push detected"
fi

# Hard reset
if echo "$COMMAND" | grep -qE 'git\s+reset\s+--hard'; then
    REASON="Hard reset detected"
fi

# Clean untracked files
if echo "$COMMAND" | grep -qE 'git\s+clean\s+.*-f'; then
    REASON="git clean -f detected"
fi

# Discard all changes
if echo "$COMMAND" | grep -qE 'git\s+checkout\s+\.'; then
    REASON="git checkout . (discard all changes) detected"
fi

# If dangerous command found, block it
if [ -n "$REASON" ]; then
    echo "{\"hookSpecificOutput\": {\"hookEventName\": \"PermissionRequest\", \"decision\": {\"behavior\": \"block\", \"reason\": \"$REASON. This command could cause data loss. Use with caution.\"}}}"
fi

exit 0
