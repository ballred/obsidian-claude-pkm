# Troubleshooting Guide

Common issues and their solutions. If you can't find your issue here, check the community forums or documentation.

## Quick Fixes

### Before Anything Else, Try These:

1. **Restart Obsidian**
   - Completely close and reopen
   - Many issues resolve with a fresh start

2. **Check File Permissions**
   ```bash
   ls -la ~/YourVault
   # Should show your user as owner
   ```

3. **Verify Claude Code**
   ```bash
   claude --version
   # Should show version number
   ```

4. **Pull Latest Changes**
   ```bash
   git pull origin main
   # Get any updates
   ```

## Common Issues

### Obsidian Issues

#### "Cannot open vault" Error
**Problem**: Obsidian won't open your vault folder

**Solutions**:
1. Check folder exists:
   ```bash
   cd ~/Documents/YourVault
   ls -la
   ```

2. Reset Obsidian settings:
   ```bash
   # Backup first
   mv .obsidian .obsidian.backup
   # Restart Obsidian
   ```

3. Check for corrupted files:
   ```bash
   # Find files with issues
   find . -name "*.md" -exec file {} \; | grep -v "ASCII text"
   ```

#### Templates Not Working
**Problem**: Daily template doesn't create properly

**Solutions**:
1. Verify template location:
   ```
   Templates/Daily Template.md should exist
   ```

2. Check template settings:
   - Settings → Templates
   - Template folder location: "Templates"

3. Check date format:
   ```markdown
   {{date}} and {{time}} should work
   ```

#### Links Not Working
**Problem**: [[Wiki links]] don't connect

**Solutions**:
1. Check link format in settings:
   - Settings → Files & Links
   - Use [[Wiki Links]]: ON
   - New link format: Relative path

2. Verify file exists:
   - Broken links appear faded
   - Click to create missing file

### Claude Code Issues

#### "Command not found: claude"
**Problem**: Claude Code CLI not installed or not in PATH

**Solutions**:
1. Install Claude Code:
   ```bash
   # Check installation guide
   # https://docs.anthropic.com/en/docs/claude-code
   ```

2. Add to PATH:
   ```bash
   # Add to ~/.bashrc or ~/.zshrc
   export PATH="$PATH:/path/to/claude"
   source ~/.bashrc
   ```

#### Commands Not Recognized
**Problem**: /daily, /weekly etc. not working

**Solutions**:
1. Check command files exist:
   ```bash
   ls -la .claude/commands/
   # Should show daily.md, weekly.md, etc.
   ```

2. Copy commands if missing:
   ```bash
   cp claude-commands/* .claude/commands/
   ```

3. Check file permissions:
   ```bash
   chmod 644 .claude/commands/*.md
   ```

#### "Context too long" Error
**Problem**: Too many files loaded with /onboard

**Solutions**:
1. Load specific context:
   ```bash
   claude code /onboard Projects/CurrentProject
   ```

2. Clean up CLAUDE.md files:
   - Remove outdated information
   - Keep only essential context

3. Use selective loading:
   ```bash
   # Skip old projects
   claude code /onboard --exclude Archives
   ```

### Git Issues

#### "Failed to push" Error
**Problem**: Can't push to GitHub

**Solutions**:
1. Pull first:
   ```bash
   git pull --rebase origin main
   git push
   ```

2. Check remote:
   ```bash
   git remote -v
   # Should show origin URLs
   ```

3. Fix authentication:
   ```bash
   # Use personal access token
   git remote set-url origin https://TOKEN@github.com/user/repo.git
   ```

#### Merge Conflicts
**Problem**: Conflicts when pulling/pushing

**Solutions**:
1. View conflicts:
   ```bash
   git status
   # Shows conflicted files
   ```

2. Resolve manually:
   - Open conflicted files
   - Look for <<<<<<< markers
   - Choose correct version
   - Remove markers

3. Complete merge:
   ```bash
   git add .
   git commit -m "Resolved conflicts"
   git push
   ```

#### Large File Issues
**Problem**: Git rejects large files

**Solutions**:
1. Use Git LFS:
   ```bash
   git lfs track "*.pdf"
   git lfs track "*.png"
   git add .gitattributes
   ```

2. Add to .gitignore:
   ```
   *.pdf
   *.mov
   *.zip
   ```

3. Remove from history:
   ```bash
   git filter-branch --tree-filter 'rm -f path/to/large/file' HEAD
   ```

### Daily Note Issues

#### Wrong Date Format
**Problem**: Daily note has incorrect date

**Solutions**:
1. Check template variables:
   ```markdown
   {{date:YYYY-MM-DD}}  # Standard format
   {{date:dddd, MMMM DD, YYYY}}  # Long format
   ```

2. Verify system date:
   ```bash
   date
   # Should show correct date/time
   ```

3. Set timezone:
   ```bash
   export TZ='America/New_York'
   ```

#### Duplicate Daily Notes
**Problem**: Multiple notes for same day

**Solutions**:
1. Check naming convention:
   - Should be YYYY-MM-DD.md
   - No spaces or special characters

2. Merge duplicates:
   ```bash
   # Copy content from duplicate
   # Paste into main note
   # Delete duplicate
   ```

3. Prevent future duplicates:
   - Always use /daily command
   - Don't create manually

### GitHub Action Issues

#### Workflow Not Triggering
**Problem**: GitHub Action doesn't run

**Solutions**:
1. Check workflow file:
   ```yaml
   # .github/workflows/claude.yml should exist
   ```

2. Verify triggers:
   ```yaml
   on:
     issues:
       types: [opened, edited]
   ```

3. Check Actions enabled:
   - Repository → Settings → Actions
   - Actions permissions: Allow

#### OAuth Token Invalid
**Problem**: CLAUDE_CODE_OAUTH_TOKEN not working

**Solutions**:
1. Regenerate token:
   - Visit Claude Code documentation
   - Follow OAuth setup guide

2. Update secret:
   - Repository → Settings → Secrets
   - Update CLAUDE_CODE_OAUTH_TOKEN

3. Check token permissions:
   - Needs repo access
   - Needs workflow access

### Performance Issues

#### Obsidian Running Slowly
**Problem**: Vault takes long to load or respond

**Solutions**:
1. Reduce vault size:
   ```bash
   # Archive old notes
   mv "Daily Notes/2023*" Archives/2023/
   ```

2. Disable unused plugins:
   - Settings → Community plugins
   - Disable what you don't use

3. Clear cache:
   ```bash
   rm -rf .obsidian/cache
   ```

4. Optimize images:
   ```bash
   # Compress images
   find . -name "*.png" -exec pngquant --ext .png --force {} \;
   ```

#### Search Not Working
**Problem**: Can't find notes with search

**Solutions**:
1. Rebuild search index:
   - Settings → About → Reindex vault

2. Check search syntax:
   ```
   "exact phrase"
   tag:#daily
   file:2024-01-15
   ```

3. Remove special characters from filenames

## Platform-Specific Issues

### macOS

#### "Operation not permitted"
```bash
# Grant Obsidian full disk access
System Preferences → Security & Privacy → Full Disk Access
```

#### iCloud Sync Issues
- Don't put vault in iCloud Drive
- Use Git for synchronization instead
- Or use Obsidian Sync service

### Windows

#### Path Too Long
```powershell
# Enable long paths
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
```

#### Line Ending Issues
```bash
# Configure Git
git config --global core.autocrlf true
```

### Linux

#### Permission Denied
```bash
# Fix permissions
chmod -R 755 ~/YourVault
chown -R $USER:$USER ~/YourVault
```

#### Missing Dependencies
```bash
# Install required packages
sudo apt-get update
sudo apt-get install git curl
```

## Recovery Procedures

### Restore from Backup

#### Using Git
```bash
# View history
git log --oneline

# Restore to previous commit
git reset --hard COMMIT_HASH

# Or restore single file
git checkout COMMIT_HASH -- path/to/file.md
```

#### Using File System
```bash
# If you have Time Machine (macOS)
# Or File History (Windows)
# Or Backups (Linux)
```

### Rebuild Vault

If vault is corrupted:
```bash
# 1. Backup current vault
cp -r ~/YourVault ~/YourVault.backup

# 2. Create fresh vault
cp -r vault-template ~/NewVault

# 3. Copy your notes
cp -r ~/YourVault.backup/Daily\ Notes/* ~/NewVault/Daily\ Notes/
cp -r ~/YourVault.backup/Projects/* ~/NewVault/Projects/

# 4. Reinitialize Git
cd ~/NewVault
git init
git add .
git commit -m "Rebuilt vault"
```

### Emergency Access

When locked out:
1. Access via GitHub.com
2. Edit files in browser
3. Download as ZIP if needed
4. Use mobile app as backup

## Preventive Measures

### Regular Maintenance

#### Weekly
```bash
# Clean up
claude code "Archive completed tasks and old notes"

# Backup
git push origin main
```

#### Monthly
```bash
# Optimize
claude code "Identify and remove duplicate content"

# Update
git pull origin main
```

#### Quarterly
```bash
# Review system
claude code "Analyze vault structure and suggest improvements"

# Clean dependencies
rm -rf node_modules .obsidian/cache
```

### Backup Strategy

1. **Version Control**: Git commits daily
2. **Cloud Backup**: GitHub private repo
3. **Local Backup**: Time Machine/File History
4. **Export Backup**: Monthly markdown export

## Getting Help

### Resources
- [Obsidian Forum](https://forum.obsidian.md/)
- [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code)
- [GitHub Issues](https://github.com/yourusername/obsidian-claude-pkm/issues)

### Debug Information
When asking for help, provide:
```bash
# System info
uname -a

# Obsidian version
# (Check in Settings → About)

# Claude version
claude --version

# Git status
git status
git remote -v

# Vault structure
ls -la ~/YourVault
```

### Community Support
- Discord channels
- Reddit: r/ObsidianMD
- Twitter: #ObsidianMD

---

**Remember**: Most issues have simple solutions. Stay calm, check the basics, and work through systematically.