#!/bin/bash

# Obsidian + Claude Code PKM Setup Script
# This script automates the initial setup of your PKM system

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════╗"
echo "║   Obsidian + Claude Code PKM Setup Wizard        ║"
echo "║   Version 1.0                                     ║"
echo "╚═══════════════════════════════════════════════════╝"
echo -e "${NC}"

# Function to print colored messages
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Step 1: Check Prerequisites
echo -e "\n${BLUE}Step 1: Checking Prerequisites${NC}"
echo "================================"

# Check for Git
if command_exists git; then
    print_success "Git is installed ($(git --version))"
else
    print_error "Git is not installed"
    echo "Please install Git from: https://git-scm.com/"
    exit 1
fi

# Check for Claude Code
if command_exists claude; then
    print_success "Claude Code is installed ($(claude --version 2>/dev/null || echo 'version check failed'))"
else
    print_warning "Claude Code CLI not found"
    echo "Install from: https://code.claude.com/docs"
    read -p "Continue without Claude Code? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Step 2: Get Vault Location
echo -e "\n${BLUE}Step 2: Choose Vault Location${NC}"
echo "================================"

# Default location
DEFAULT_VAULT="$HOME/Documents/ObsidianPKM"
read -p "Where should we create your vault? [$DEFAULT_VAULT]: " VAULT_PATH
VAULT_PATH=${VAULT_PATH:-$DEFAULT_VAULT}

# Expand tilde if present
VAULT_PATH="${VAULT_PATH/#\~/$HOME}"

# Check if directory exists
if [ -d "$VAULT_PATH" ]; then
    print_warning "Directory already exists: $VAULT_PATH"
    read -p "Use existing directory? Files may be overwritten (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Setup cancelled"
        exit 1
    fi
else
    mkdir -p "$VAULT_PATH"
    print_success "Created vault directory: $VAULT_PATH"
fi

# Step 3: Copy Vault Template
echo -e "\n${BLUE}Step 3: Setting Up Vault Structure${NC}"
echo "====================================="

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TEMPLATE_DIR="$SCRIPT_DIR/../vault-template"

# Copy template files
print_info "Copying template files..."
cp -r "$TEMPLATE_DIR"/* "$VAULT_PATH/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR"/.* "$VAULT_PATH/" 2>/dev/null || true
print_success "Vault structure created"

# Step 4: Set Up Claude Commands
echo -e "\n${BLUE}Step 4: Setting Up Claude Commands${NC}"
echo "======================================"

if command_exists claude; then
    # Commands are already in vault-template/.claude/commands/
    # Just need to initialize Claude
    cd "$VAULT_PATH"
    
    # Check if commands were copied
    if [ -d "$VAULT_PATH/.claude/commands" ]; then
        print_success "Claude commands already in place"
    else
        print_warning "Claude commands directory not found"
    fi
    
    # Initialize Claude in vault
    if claude init >/dev/null 2>&1; then
        print_success "Claude Code initialized in vault"
    else
        print_warning "Claude Code initialization did not complete. You can run 'claude init' inside '$VAULT_PATH' later."
    fi
else
    print_warning "Skipping Claude Code setup (not installed)"
fi

# Step 5: Initialize Git
echo -e "\n${BLUE}Step 5: Git Repository Setup${NC}"
echo "==============================="

cd "$VAULT_PATH"

if [ -d .git ]; then
    print_warning "Git repository already exists"
else
    git init
    print_success "Git repository initialized"
fi

# Configure Git
read -p "Enter your name for Git commits: " GIT_NAME
read -p "Enter your email for Git commits: " GIT_EMAIL

if [ -n "$GIT_NAME" ]; then
    git config user.name "$GIT_NAME"
    print_success "Git user name set"
fi

if [ -n "$GIT_EMAIL" ]; then
    git config user.email "$GIT_EMAIL"
    print_success "Git user email set"
fi

# Initial commit
git add .
git commit -m "Initial PKM setup" 2>/dev/null || print_warning "Nothing to commit"

# Step 6: GitHub Setup (Optional)
echo -e "\n${BLUE}Step 6: GitHub Integration (Optional)${NC}"
echo "========================================="

read -p "Do you want to set up GitHub integration? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Enter your GitHub repository URL (or press Enter to skip): " GITHUB_URL
    
    if [ -n "$GITHUB_URL" ]; then
        git remote add origin "$GITHUB_URL" 2>/dev/null || git remote set-url origin "$GITHUB_URL"
        print_success "GitHub remote configured"
        
        read -p "Push to GitHub now? (y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            git push -u origin main 2>/dev/null || git push -u origin master
            print_success "Pushed to GitHub"
        fi
        
        # Set up GitHub Action
        mkdir -p "$VAULT_PATH/.github/workflows"
        cp "$SCRIPT_DIR/../github-actions/claude.yml" "$VAULT_PATH/.github/workflows/"
        print_success "GitHub Action workflow copied"
        print_warning "Remember to add CLAUDE_CODE_OAUTH_TOKEN to repository secrets"
    fi
fi

# Step 7: Personalization
echo -e "\n${BLUE}Step 7: Initial Personalization${NC}"
echo "===================================="

print_info "Let's personalize your system..."

# Get personal mission
echo -e "\nWhat's your personal mission or life purpose?"
echo "(Example: 'Build meaningful technology while maintaining balance')"
read -p "Your mission: " MISSION

if [ -n "$MISSION" ]; then
    # Update CLAUDE.md
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        sed -i '' "s/\[CUSTOMIZE THIS: Add your personal mission statement or life purpose here\]/$MISSION/" "$VAULT_PATH/CLAUDE.md"
    else
        # Linux
        sed -i "s/\[CUSTOMIZE THIS: Add your personal mission statement or life purpose here\]/$MISSION/" "$VAULT_PATH/CLAUDE.md"
    fi
    print_success "Personal mission added"
fi

# Get current focus
echo -e "\nWhat's your main focus right now?"
read -p "Current focus: " FOCUS

# Create first daily note
TODAY=$(date +%Y-%m-%d)
DAILY_NOTE="$VAULT_PATH/Daily Notes/$TODAY.md"

if [ ! -f "$DAILY_NOTE" ]; then
    print_info "Creating your first daily note..."
    cp "$VAULT_PATH/Templates/Daily Template.md" "$DAILY_NOTE"
    
    # Add focus to daily note
    if [ -n "$FOCUS" ]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s/\*\*Today's Priority:\*\*/\*\*Today's Priority:\*\* $FOCUS/" "$DAILY_NOTE"
        else
            sed -i "s/\*\*Today's Priority:\*\*/\*\*Today's Priority:\*\* $FOCUS/" "$DAILY_NOTE"
        fi
    fi
    
    print_success "First daily note created: $TODAY.md"
fi

# Step 8: Final Setup
echo -e "\n${BLUE}Step 8: Finalizing Setup${NC}"
echo "==========================="

# Create a setup completion marker
echo "Setup completed on $(date)" > "$VAULT_PATH/.setup_complete"

# Commit personalization
cd "$VAULT_PATH"
git add .
git commit -m "Personalized PKM setup" 2>/dev/null || true

# Summary
echo -e "\n${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✨ Setup Complete!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

echo "Your PKM system is ready at: $VAULT_PATH"
echo ""
echo "Next steps:"
echo "1. Open Obsidian and select your vault folder"
echo "2. Explore the Goals folder to set your objectives"
echo "3. Start using daily notes with: claude code /daily"
echo "4. Run weekly reviews with: claude code /weekly"
echo ""
echo "Quick Commands:"
echo "  cd \"$VAULT_PATH\"     # Navigate to your vault"
echo "  claude code /onboard  # Load context into Claude"
echo "  claude code /daily    # Create today's note"
echo "  claude code /push     # Save changes to Git"
echo ""
print_info "Read the documentation in docs/ for detailed guidance"
print_success "Happy note-taking! 🚀"

# Offer to open Obsidian
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [ -d "/Applications/Obsidian.app" ]; then
        read -p "Open Obsidian now? (y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            # Try to open directly to this vault via obsidian URL
            if command_exists python3; then
                ENCODED_PATH=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$VAULT_PATH")
                open "obsidian://open?path=$ENCODED_PATH" || open -a Obsidian
            else
                open -a Obsidian
            fi
            print_success "Obsidian launched"
        fi
    fi
elif command_exists obsidian; then
    read -p "Open Obsidian now? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # On Linux, try obsidian URL first if xdg-open available
        if command_exists xdg-open && command_exists python3; then
            ENCODED_PATH=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$VAULT_PATH")
            xdg-open "obsidian://open?path=$ENCODED_PATH" >/dev/null 2>&1 || obsidian &
        else
            obsidian &
        fi
        print_success "Obsidian launched"
    fi
fi