#!/bin/bash
# Session initialization hook for Obsidian PKM vault
# Sets up environment variables for the Claude Code session

# Set vault path (defaults to current directory)
export VAULT_PATH="${VAULT_PATH:-$(pwd)}"

# Date variables for daily operations
export TODAY=$(date +%Y-%m-%d)
export YESTERDAY=$(date -v-1d +%Y-%m-%d 2>/dev/null || date -d "yesterday" +%Y-%m-%d)
export CURRENT_WEEK=$(date +%Y-W%V)

# Daily note path
export DAILY_NOTE="$VAULT_PATH/Daily Notes/$TODAY.md"

# Verify vault structure
if [ ! -f "$VAULT_PATH/CLAUDE.md" ]; then
    echo "Note: Not in a vault root directory (no CLAUDE.md found)"
fi

# Output session info
echo "PKM Session initialized"
echo "  Vault: $VAULT_PATH"
echo "  Today: $TODAY"
