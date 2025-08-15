# Navigation & Context Guide for Claude Code

## 🎯 System Purpose
[CUSTOMIZE THIS: Add your personal mission statement or life purpose here]
*Example: "Build meaningful technology that improves people's lives while maintaining balance and growth in all life areas."*

## 📁 Directory Structure & Purpose

### Core Directories
- **Daily Notes/** - Daily journal entries and task management
  - Named as `YYYY-MM-DD.md` format
  - Contains daily planning, tasks, and reflections
  
- **Goals/** - Cascading goal system (3-year → yearly → monthly → weekly)
  - Start with `0. Three Year Goals.md` for vision
  - Break down into actionable items in `3. Weekly Review.md`
  
- **Projects/** - Active project folders
  - Each project gets its own folder
  - Include project-specific `CLAUDE.md` for context
  
- **Templates/** - Reusable note structures
  - `Daily Template.md` - For daily notes
  - `Weekly Review Template.md` - For weekly planning
  - `Project Template.md` - For new projects
  
- **Archives/** - Completed or inactive content
  - Move completed projects here
  - Store old daily notes after monthly review

## 🏷️ Key Tags to Use

### Priority Tags
- `#priority/high` - Must do today
- `#priority/medium` - Should do this week  
- `#priority/low` - Nice to have

### Context Tags
- `#work` - Professional tasks
- `#personal` - Personal development
- `#health` - Wellness activities
- `#family` - Relationships
- `#learning` - Skill development

### Status Tags
- `#active` - Currently working on
- `#waiting` - Blocked or waiting
- `#completed` - Done
- `#archived` - No longer relevant

[CUSTOMIZE THIS: Add your own tag system based on your workflow]

## 🔄 Workflow Instructions

### Daily Workflow
1. **Morning (5 min)**
   - Run `claude code /daily` to create today's note
   - Review yesterday's unfinished tasks
   - Set ONE main focus for today
   - Plan your time blocks

2. **Throughout the Day**
   - Check off completed tasks
   - Add thoughts and insights
   - Capture new ideas in appropriate sections

3. **Evening (5 min)**
   - Complete reflection section
   - Move unfinished tasks to tomorrow
   - Run `claude code /push` to save changes

### Weekly Workflow
1. **Weekly Review (30 min)**
   - Run `claude code /weekly` on Sunday
   - Review past week's accomplishments
   - Align next week with monthly goals
   - Clean up and archive old notes

### Project Management
1. **Starting a Project**
   - Create folder in `Projects/`
   - Add project-specific `CLAUDE.md`
   - Define success criteria
   - Break into actionable tasks

2. **During Project**
   - Keep all related notes in project folder
   - Update project CLAUDE.md with progress
   - Link to relevant daily notes

3. **Completing Project**
   - Create summary document
   - Move to `Archives/`
   - Extract lessons learned

## 🤖 Claude Code Integration

### Available Commands
- `/daily` - Creates today's daily note from template
- `/weekly` - Runs weekly review process
- `/push` - Commits and pushes changes to Git
- `/onboard` - Reads all CLAUDE.md files for context

### Output Styles
Claude Code now supports different personality modes! This vault includes:

- **Productivity Coach** - An accountability-focused coach that:
  - Challenges you to clarify your true intentions
  - Points out gaps between goals and actions
  - Asks powerful questions to create momentum
  - Holds you accountable to commitments
  
To use: 
- Type `/output-style` in Claude Code for an interactive menu
- Or directly switch with: `/output-style coach`
- Your preference is automatically saved in `.claude/settings.local.json`

### Best Practices with Claude
1. **Be Specific** - Give clear context about what you need
2. **Use Project Context** - Reference project CLAUDE.md files
3. **Try Different Styles** - Use coach mode when you need accountability
4. **Iterate** - Claude can help refine and improve your notes
5. **Review Suggestions** - Claude's suggestions are starting points

## 📱 Mobile Access (via GitHub)

### Setup
1. Initialize git in your vault
2. Create private GitHub repository
3. Set up GitHub Action (see `github-actions/claude.yml`)
4. Access notes via GitHub mobile app

### Mobile Workflow
1. View notes on GitHub mobile
2. Create issues for tasks/ideas
3. Claude processes issues automatically
4. Sync when back at desktop

## 🎨 Customization Points

[CUSTOMIZE THIS SECTION: Add your specific preferences]

### My Preferences
- **Daily Note Time**: [Morning/Evening]
- **Review Day**: [Sunday/Monday]
- **Time Blocking**: [Yes/No]
- **Task Management Style**: [GTD/Simple/Custom]

### Custom Shortcuts
- [Add your frequently used searches]
- [Add your common templates]
- [Add your workflow triggers]

## 📚 Resources & References

### Internal Links
- [[0. Three Year Goals]] - Long-term vision
- [[1. Yearly Goals]] - Current year focus
- [[2. Monthly Goals]] - This month's objectives
- [[3. Weekly Review]] - Weekly planning

### External Resources
[CUSTOMIZE THIS: Add your favorite references]
- [Resource 1]
- [Resource 2]
- [Resource 3]

---

*Last Updated: [DATE]*
*System Version: 1.0*

**Remember**: This system is meant to serve you, not constrain you. Adapt it as needed!