**📊 [Take the quick poll](https://github.com/ballred/obsidian-claude-pkm/discussions/4)** - Help shape what gets built next!

---

# Obsidian + Claude Code PKM Starter Kit 🚀

A complete personal knowledge management system that combines Obsidian's powerful note-taking with Claude Code's AI assistance. Go from zero to a fully functional PKM in 15 minutes or less.

**v2.1** - Unified skills pattern (skills and slash commands merged), hooks, agents, and rules.

## ✨ Features

### Core PKM
- **🎯 Goal-Aligned System** - Cascading goals from 3-year vision to daily tasks
- **📅 Daily Notes System** - Structured daily planning and reflection
- **📱 Mobile Ready** - GitHub integration for notes on any device
- **🔄 Version Controlled** - Never lose a thought with automatic Git backups
- **🎨 Fully Customizable** - Adapt templates and structure to your needs

### AI-Powered (v2.1)
- **⚡ Unified Skills** - Skills and slash commands merged (`/daily`, `/weekly`, `/push`, `/onboard`)
- **🪝 Hooks** - Auto-commit on save, session initialization
- **🤖 Custom Agents** - Note organizer, weekly reviewer, goal aligner, inbox processor
- **📏 Modular Rules** - Path-specific conventions for markdown, productivity, projects
- **🧠 Output Styles** - Productivity Coach for accountability
- **📊 Status Line** - Vault stats in terminal (note count, inbox, uncommitted changes)

## 🚀 Quick Start

### Prerequisites
- [Obsidian](https://obsidian.md/) installed
- [Claude Code CLI](https://code.claude.com/docs) installed
- Git installed
- GitHub account (optional, for mobile sync)

### 15-Minute Quickstart
```bash
# 1) Install prerequisites (once)
# - Obsidian: https://obsidian.md/
# - Git: https://git-scm.com/
# - Claude Code CLI: https://code.claude.com/docs

# 2) Clone this repository
git clone https://github.com/ballred/obsidian-claude-pkm.git
cd obsidian-claude-pkm

# 3) Run setup (macOS/Linux)
chmod +x scripts/setup.sh
./scripts/setup.sh

# 3b) Windows
scripts\setup.bat
```

### Manual Copy (alternative)
```bash
# Copy the vault template to your preferred location
cp -r vault-template ~/Documents/ObsidianPKM
```

### Open in Obsidian
1. Launch Obsidian
2. Click "Open folder as vault"
3. Select your vault folder (e.g., ~/Documents/ObsidianPKM)
4. Start with today's daily note!

## 📖 Documentation

- **[Setup Guide](docs/SETUP_GUIDE.md)** - Detailed installation instructions
- **[Customization](docs/CUSTOMIZATION.md)** - Make it yours
- **[Workflow Examples](docs/WORKFLOW_EXAMPLES.md)** - Daily routines and best practices
- **[Troubleshooting](docs/TROUBLESHOOTING.md)** - Common issues and solutions

## 🗂️ Structure

```
Your Vault/
├── CLAUDE.md                    # AI context and navigation
├── CLAUDE.local.md.template     # Template for personal overrides
├── .claude-plugin/
│   └── plugin.json              # Plugin manifest
├── .claude/
│   ├── agents/                  # Custom AI agents
│   │   ├── note-organizer.md
│   │   ├── weekly-reviewer.md
│   │   ├── goal-aligner.md
│   │   └── inbox-processor.md
│   ├── skills/                  # Unified skills (invoke with /skill-name)
│   │   ├── daily/               # /daily - Create daily notes, routines
│   │   ├── weekly/              # /weekly - Weekly review process
│   │   ├── push/                # /push - Git commit and push
│   │   ├── onboard/             # /onboard - Load vault context
│   │   ├── goal-tracking/       # Auto: Track goal progress
│   │   └── obsidian-vault-ops/  # Auto: Vault file operations
│   ├── hooks/                   # Event automation (NEW)
│   │   ├── session-init.sh
│   │   └── auto-commit.sh
│   ├── rules/                   # Path-specific conventions (NEW)
│   │   ├── markdown-standards.md
│   │   ├── productivity-workflow.md
│   │   └── project-management.md
│   ├── scripts/
│   │   └── statusline.sh        # Terminal status display (NEW)
│   ├── output-styles/
│   │   └── coach.md             # Productivity Coach
│   └── settings.json            # Permissions and config (NEW)
├── Daily Notes/
├── Goals/
├── Projects/
├── Templates/
└── Archives/
```

## 🧠 Output Styles

This starter kit includes a **Productivity Coach** output style that transforms Claude into an accountability partner. The coach will:

- Challenge you to clarify your true intentions
- Point out misalignments between stated goals and actions
- Ask powerful questions to drive momentum
- Hold you accountable to your commitments
- Help you identify and overcome resistance

To use the coach style in Claude Code:
1. The output style is automatically included in `.claude/output-styles/`
2. Start Claude Code and type `/output-style` to select from available styles
3. Or directly activate with: `/output-style coach`
4. The style preference is automatically saved for your project

Learn more about [customizing output styles](docs/CUSTOMIZATION.md#output-styles).

## 🤖 Custom Agents (v2.0)

Ask Claude to use specialized agents for common PKM tasks:

```bash
# Organize your vault and fix broken links
claude "Use the note-organizer agent to audit my vault"

# Facilitate weekly review aligned with goals
claude "Use the weekly-reviewer agent for my weekly review"

# Check if daily work aligns with long-term goals
claude "Use the goal-aligner agent to analyze my recent activity"

# Process inbox items using GTD principles
claude "Use the inbox-processor agent to clear my inbox"
```

## 🔄 Upgrading from v1.x

If you have an existing vault from v1.x:

```bash
# 1. Copy new directories to your vault
cp -r vault-template/.claude-plugin your-vault/
cp -r vault-template/.claude/agents your-vault/.claude/
cp -r vault-template/.claude/skills your-vault/.claude/
cp -r vault-template/.claude/hooks your-vault/.claude/
cp -r vault-template/.claude/rules your-vault/.claude/
cp -r vault-template/.claude/scripts your-vault/.claude/
cp vault-template/.claude/settings.json your-vault/.claude/
cp vault-template/CLAUDE.local.md.template your-vault/

# 2. Review and merge CLAUDE.md changes
# Your customizations are preserved, just add references to new features

# 3. Make hook scripts executable
chmod +x your-vault/.claude/hooks/*.sh
chmod +x your-vault/.claude/scripts/*.sh
```

## 🤝 Contributing

Found a bug or have a feature idea? Please open an issue or submit a PR!

## 📄 License

MIT - Use this freely for your personal knowledge management journey.

---

**Ready to transform your note-taking?** Follow the [Setup Guide](docs/SETUP_GUIDE.md) to get started!