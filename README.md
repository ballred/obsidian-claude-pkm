# Obsidian + Claude Code PKM Starter Kit 🚀

A complete personal knowledge management system that combines Obsidian's powerful note-taking with Claude Code's AI assistance. Go from zero to a fully functional PKM in 15 minutes or less.

## ✨ Features

- **🎯 Goal-Aligned System** - Cascading goals from 3-year vision to daily tasks
- **🤖 AI-Powered Workflows** - Claude Code integration for intelligent note management
- **📅 Daily Notes System** - Structured daily planning and reflection
- **📱 Mobile Ready** - GitHub integration for notes on any device
- **🔄 Version Controlled** - Never lose a thought with automatic Git backups
- **⚡ Automated Commands** - Custom slash commands for common workflows
- **🎨 Fully Customizable** - Adapt templates and structure to your needs

## 🚀 Quick Start

### Prerequisites
- [Obsidian](https://obsidian.md/) installed
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed
- Git installed
- GitHub account (optional, for mobile sync)

### 15-Minute Quickstart
```bash
# 1) Install prerequisites (once)
# - Obsidian: https://obsidian.md/
# - Git: https://git-scm.com/
# - Claude Code CLI: https://docs.anthropic.com/en/docs/claude-code

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
├── CLAUDE.md           # AI context and navigation
├── .claude/
│   └── commands/       # Custom slash commands
├── Daily Notes/        # Your daily journal
├── Goals/              # Cascading goal system
├── Projects/           # Active project folders
├── Templates/          # Reusable note templates
└── Archives/           # Historical content
```

## 🤝 Contributing

Found a bug or have a feature idea? Please open an issue or submit a PR!

## 📄 License

MIT - Use this freely for your personal knowledge management journey.

---

**Ready to transform your note-taking?** Follow the [Setup Guide](docs/SETUP_GUIDE.md) to get started!