# Complete Setup Guide

This guide will walk you through setting up your Obsidian + Claude Code PKM system step by step. Total time: ~15 minutes if prerequisites are installed.

## Prerequisites Checklist

Before starting, ensure you have:

- [ ] **Obsidian** installed ([Download here](https://obsidian.md/))
- [ ] **Git** installed ([Download here](https://git-scm.com/))
- [ ] **Claude Code CLI** installed ([Instructions](https://docs.anthropic.com/en/docs/claude-code))
- [ ] **GitHub account** (optional, for sync) ([Sign up](https://github.com))
- [ ] **Text editor** (for configuration files)

### Verify Prerequisites

Open terminal/command prompt and run:
```bash
# Check Git
git --version

# Check Claude Code
claude --version
```

## Phase 1: Initial Setup (5 minutes)

### Step 1: Clone the Repository

```bash
# Option A: If you have git
git clone https://github.com/ballred/obsidian-claude-pkm.git
cd obsidian-claude-pkm

# Option B: Download ZIP
# 1. Download from GitHub
# 2. Extract to your desired location
```

### Step 2: Run Setup Script

```bash
# Make script executable (Mac/Linux)
chmod +x scripts/setup.sh

# Run setup
./scripts/setup.sh

# For Windows, use:
# scripts\setup.bat
```

The setup script will:
1. Ask for your vault location preference
2. Copy the vault template
3. Set up Claude commands
4. Initialize git (if desired)

### Step 3: Manual Setup (if script fails)

```bash
# Copy vault template to your preferred location
cp -r vault-template ~/Documents/ObsidianPKM

# The .claude/commands directory is already included in the template
# Verify commands are present
ls ~/Documents/ObsidianPKM/.claude/commands/

# Initialize git
cd ~/Documents/ObsidianPKM
git init
```

## Phase 2: Open in Obsidian (5 minutes)

### Step 1: Open Obsidian
1. Launch Obsidian
2. Click "Open folder as vault"
3. Navigate to your vault folder
4. Click "Select"

### Step 2: Trust and Enable
When prompted:
- Click "Trust author and enable plugins" (if you added community plugins)
- This is safe for the template vault

### Step 3: Initial Exploration
1. Open `CLAUDE.md` in the root
2. Read through the structure
3. Explore the Goals folder
4. Check out the example daily note

### Step 4: Basic Settings (Optional)
1. Settings → Appearance → Choose theme
2. Settings → Editor → Set your preferences
3. Settings → Files & Links → Confirm settings:
   - Default location for new notes: "Daily Notes"
   - New link format: "Relative path to file"

## Phase 3: Claude Code Integration (10 minutes)

### Step 1: Configure Claude Code

```bash
# Navigate to your vault
cd ~/Documents/ObsidianPKM

# Initialize Claude Code
claude init

# Test the connection
claude "Hello, I'm setting up my PKM system"
```

### Step 2: Set Up Commands

```bash
# The commands should already be in .claude/commands/
# Verify they exist:
ls .claude/commands/

# You should see:
# daily.md  weekly.md  push.md  onboard.md
```

### Step 3: Test Commands

```bash
# Load your context
claude code /onboard

# Create your first daily note
claude code /daily

# You should see a new file in Daily Notes/
```

### Step 4: Customize Context

Edit `CLAUDE.md` in your vault root:
1. Add your personal mission statement
2. Define your working preferences
3. Set your current focus areas
4. Add any specific instructions for Claude

## Phase 4: Git Setup (5 minutes)

### Step 1: Initialize Repository

```bash
# If not already initialized
git init

# Configure git
git config user.name "Your Name"
git config user.email "your.email@example.com"

# Add all files
git add .

# First commit
git commit -m "Initial PKM setup"
```

### Step 2: Create GitHub Repository

```bash
# Using GitHub CLI (if installed)
gh repo create my-pkm --private

# Or create manually on GitHub.com
# Then add remote:
git remote add origin https://github.com/ballred/my-pkm.git

# Push to GitHub
git push -u origin main
```

### Step 3: Set Up GitHub Action (Optional)

1. Copy the workflow file:
```bash
mkdir -p .github/workflows
cp github-actions/claude.yml .github/workflows/
```

2. Get Claude Code OAuth token:
   - Visit: https://docs.anthropic.com/en/docs/claude-code/github-actions
   - Follow instructions to get token

3. Add token to GitHub:
   - Go to your repository on GitHub
   - Settings → Secrets and variables → Actions
   - New repository secret
   - Name: `CLAUDE_CODE_OAUTH_TOKEN`
   - Value: [Your token]

## Phase 5: Personalization (10 minutes)

### Step 1: Customize Your Mission

Edit `vault-template/CLAUDE.md`:
```markdown
## 🎯 System Purpose
[Replace with your personal mission]
```

### Step 2: Set Your Goals

1. Open `Goals/0. Three Year Goals.md`
2. Replace placeholder goals with your actual 3-year vision
3. Open `Goals/1. Yearly Goals.md`
4. Set your annual objectives
5. Open `Goals/2. Monthly Goals.md`
6. Define this month's priorities

### Step 3: Customize Daily Template

Edit `Templates/Daily Template.md`:
1. Add your personal mission statement at the top
2. Adjust time blocks to match your schedule
3. Modify task categories to fit your life
4. Add/remove sections as needed

### Step 4: Create Your First Project

```bash
# Using Claude
claude code "Create a new project folder for [Your Project Name]"

# Or manually
1. Create folder in Projects/
2. Copy CLAUDE.md template
3. Define project goals
```

## Verification Checklist

Run through this checklist to ensure everything is working:

- [ ] Obsidian opens your vault without errors
- [ ] CLAUDE.md has your personalized content
- [ ] `/daily` command creates today's note
- [ ] `/onboard` command loads your context
- [ ] Git commits work locally
- [ ] GitHub remote is connected (if using)
- [ ] Goals files have your objectives
- [ ] Daily template has your customizations

## Daily Workflow

### Morning Routine (5 minutes)
```bash
# Start your day
claude code /onboard
claude code /daily

# Claude will:
# - Create today's note
# - Review yesterday's tasks
# - Help plan your day
```

### Evening Routine (5 minutes)
```bash
# End of day
# Complete reflection in daily note
claude code /push

# This saves everything to git
```

### Weekly Review (30 minutes)
```bash
# Sunday evening or Monday morning
claude code /weekly

# Follow the guided review process
```

## Troubleshooting

### Obsidian Won't Open Vault
- Check folder permissions
- Ensure path has no special characters
- Try creating fresh vault and copying files

### Claude Commands Not Working
```bash
# Verify Claude Code installation
claude --version

# Check command files exist
ls -la .claude/commands/

# Try running directly
claude code < .claude/commands/daily.md
```

### Git Issues
```bash
# If push fails
git pull --rebase origin main
git push

# If large files cause issues
git lfs track "*.pdf"
git lfs track "*.png"
```

### Daily Note Not Created
- Check date format in template
- Verify Templates folder exists
- Ensure template file is named correctly

## Next Steps

1. **Read** [CUSTOMIZATION.md](CUSTOMIZATION.md) for advanced configuration
2. **Explore** [WORKFLOW_EXAMPLES.md](WORKFLOW_EXAMPLES.md) for usage patterns
3. **Join** the community (if available) for tips and support
4. **Iterate** on your system - it should evolve with you

## Getting Help

- **Documentation**: Check the docs/ folder
- **Claude Code Help**: `claude --help`
- **Obsidian Help**: [Obsidian Forum](https://forum.obsidian.md/)
- **Git Help**: [Git Documentation](https://git-scm.com/doc)

---

Congratulations! Your PKM system is now ready. Remember: the best system is the one you actually use. Start simple, be consistent, and evolve as needed.

**Pro Tip**: Spend the first week just using daily notes. Add complexity gradually as habits form.