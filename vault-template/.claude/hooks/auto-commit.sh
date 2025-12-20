#!/bin/bash
# Auto-commit hook for vault changes
# Called after Write/Edit operations on vault files

VAULT_PATH="${VAULT_PATH:-$(pwd)}"
MODIFIED_FILE="${1:-unknown}"

# Only run if auto-commit is enabled
if [ "${GIT_AUTO_COMMIT}" != "true" ]; then
    exit 0
fi

cd "$VAULT_PATH" || exit 0

# Check if this is a git repository
if [ ! -d .git ]; then
    exit 0
fi

# Check if there are changes to commit
if git diff --quiet && git diff --staged --quiet; then
    exit 0
fi

# Generate commit message based on file location
TIMESTAMP=$(date +"%Y-%m-%d %H:%M")

if [[ "$MODIFIED_FILE" == *"Daily Notes"* ]]; then
    MSG="Update daily note - $TIMESTAMP"
elif [[ "$MODIFIED_FILE" == *"Goals"* ]]; then
    MSG="Update goals - $TIMESTAMP"
elif [[ "$MODIFIED_FILE" == *"Projects"* ]]; then
    PROJECT=$(echo "$MODIFIED_FILE" | sed 's|.*/Projects/\([^/]*\)/.*|\1|')
    MSG="Update project: $PROJECT - $TIMESTAMP"
elif [[ "$MODIFIED_FILE" == *"Templates"* ]]; then
    MSG="Update template - $TIMESTAMP"
else
    MSG="Vault update - $TIMESTAMP"
fi

# Stage and commit
git add .
git commit -m "$MSG" --quiet 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Auto-committed: $MSG"
fi
