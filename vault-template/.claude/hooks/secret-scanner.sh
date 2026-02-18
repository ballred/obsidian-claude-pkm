#!/bin/bash
# Secret detection hook (PreToolUse: Write|Edit)
# Scans file content for API keys, tokens, and private keys before allowing writes
# BLOCKING — prevents write if credentials are detected (JSON block decision on stdout)
#
# Requires: jq (pre-installed on macOS and most Linux distros)

# Read tool use JSON from stdin
INPUT=$(cat)

# Extract file path from tool input
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
[ -z "$FILE_PATH" ] && exit 0

# Only scan markdown files
case "$FILE_PATH" in
    *.md) ;;
    *) exit 0 ;;
esac

# Extract the new content being written
# For Write: tool_input.content; for Edit: tool_input.new_string
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // .tool_input.new_string // empty')
[ -z "$CONTENT" ] && exit 0

# Check for secret patterns
FOUND=""

# AWS Access Key IDs
if echo "$CONTENT" | grep -qE 'AKIA[0-9A-Z]{16}'; then
    FOUND="${FOUND}AWS access key, "
fi

# Generic API keys (key = value or key: value patterns)
if echo "$CONTENT" | grep -qiE '(api[_-]?key|apikey)\s*[:=]\s*[A-Za-z0-9_\-]{20,}'; then
    FOUND="${FOUND}API key, "
fi

# Bearer tokens
if echo "$CONTENT" | grep -qE 'Bearer\s+[A-Za-z0-9\-._~+/]{20,}'; then
    FOUND="${FOUND}Bearer token, "
fi

# Private keys
if echo "$CONTENT" | grep -q 'BEGIN.*PRIVATE KEY'; then
    FOUND="${FOUND}private key, "
fi

# Generic secrets (password/secret/token with values)
if echo "$CONTENT" | grep -qiE '(password|secret|token)\s*[:=]\s*[^\s]{8,}'; then
    FOUND="${FOUND}potential credential, "
fi

# GitHub personal access tokens
if echo "$CONTENT" | grep -qE 'gh[ps]_[A-Za-z0-9_]{36,}'; then
    FOUND="${FOUND}GitHub token, "
fi

# If secrets found, block the operation
if [ -n "$FOUND" ]; then
    FOUND="${FOUND%, }"
    echo "{\"hookSpecificOutput\": {\"hookEventName\": \"PreToolUse\", \"decision\": {\"behavior\": \"block\", \"reason\": \"Potential secrets detected: ${FOUND}. Remove credentials before writing to vault files.\"}}}"
    exit 0
fi

# No secrets found — allow the operation
exit 0
