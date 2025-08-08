#!/bin/bash

# Obsidian PKM Customization Helper
# This script helps you customize your PKM system interactively

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Banner
echo -e "${MAGENTA}"
echo "╔═══════════════════════════════════════════════════╗"
echo "║      PKM Customization Assistant                 ║"
echo "║      Personalize Your System                     ║"
echo "╚═══════════════════════════════════════════════════╝"
echo -e "${NC}"

# Find vault directory
if [ -f ".setup_complete" ]; then
    VAULT_PATH="$(pwd)"
else
    read -p "Enter path to your vault: " VAULT_PATH
    VAULT_PATH="${VAULT_PATH/#\~/$HOME}"
fi

if [ ! -d "$VAULT_PATH" ]; then
    echo -e "${RED}Error: Vault not found at $VAULT_PATH${NC}"
    exit 1
fi

cd "$VAULT_PATH"

# Function to show menu
show_menu() {
    echo -e "\n${CYAN}What would you like to customize?${NC}"
    echo "=================================="
    echo "1. Personal Mission & Values"
    echo "2. Goal System (3-year, yearly, monthly)"
    echo "3. Daily Note Template"
    echo "4. Weekly Review Process"
    echo "5. Tag System"
    echo "6. Time Blocks & Schedule"
    echo "7. Project Templates"
    echo "8. Claude Context (CLAUDE.md)"
    echo "9. Folder Structure"
    echo "10. Create Custom Command"
    echo "0. Exit"
    echo ""
    read -p "Choose an option (0-10): " choice
}

# Function 1: Customize Mission
customize_mission() {
    echo -e "\n${BLUE}Personal Mission & Values${NC}"
    echo "=========================="
    
    echo "Your personal mission statement guides your daily decisions."
    echo "Example: 'Create value through technology while nurturing relationships'"
    echo ""
    read -p "Enter your mission statement: " MISSION
    
    if [ -n "$MISSION" ]; then
        # Update mission in CLAUDE.md placeholder
        if [ -f "CLAUDE.md" ]; then
            cp "CLAUDE.md" "CLAUDE.md.bak"
            if [[ "$OSTYPE" == "darwin"* ]]; then
                sed -i '' "s/\[CUSTOMIZE THIS: Add your personal mission statement or life purpose here\]/$MISSION/" "CLAUDE.md"
            else
                sed -i "s/\[CUSTOMIZE THIS: Add your personal mission statement or life purpose here\]/$MISSION/" "CLAUDE.md"
            fi
        fi

        # Update mission line in Daily Template placeholder
        if [ -f "Templates/Daily Template.md" ]; then
            cp "Templates/Daily Template.md" "Templates/Daily Template.md.bak"
            if [[ "$OSTYPE" == "darwin"* ]]; then
                sed -i '' "s/_\[CUSTOMIZE THIS: Add your personal mission statement or daily reminder here\]_/_$MISSION_/" "Templates/Daily Template.md"
            else
                sed -i "s/_\[CUSTOMIZE THIS: Add your personal mission statement or daily reminder here\]_/_$MISSION_/" "Templates/Daily Template.md"
            fi
        fi

        echo -e "${GREEN}✓ Mission statement updated${NC}"
    fi
    
    echo -e "\n${BLUE}Core Values${NC}"
    echo "What are your top 3 values?"
    read -p "Value 1: " VALUE1
    read -p "Value 2: " VALUE2
    read -p "Value 3: " VALUE3
    
    # Create values file
    cat > "Values.md" << EOF
# My Core Values

## 1. $VALUE1
Why this matters to me:

## 2. $VALUE2
Why this matters to me:

## 3. $VALUE3
Why this matters to me:

---
*These values guide my decisions and priorities.*
EOF
    
    echo -e "${GREEN}✓ Values documented${NC}"
}

# Function 2: Customize Goals
customize_goals() {
    echo -e "\n${BLUE}Goal System Setup${NC}"
    echo "=================="
    
    echo "Let's set up your cascading goals..."
    echo ""
    
    # 3-Year Vision
    echo -e "${CYAN}3-Year Vision${NC}"
    echo "Where do you want to be in 3 years?"
    read -p "Career: " CAREER_3Y
    read -p "Health: " HEALTH_3Y
    read -p "Relationships: " RELATIONSHIP_3Y
    read -p "Financial: " FINANCIAL_3Y
    
    # Update 3-year goals file
    cat > "Goals/0. Three Year Goals.md" << EOF
# Three Year Goals ($(date +%Y)-$(($(date +%Y)+3)))

## 🌟 Vision Statement
In three years, I will have achieved:

### 💼 Career & Professional Development
- $CAREER_3Y

### 🏃 Health & Wellness
- $HEALTH_3Y

### ❤️ Relationships & Family
- $RELATIONSHIP_3Y

### 💰 Financial Security
- $FINANCIAL_3Y

---
*Created: $(date +%Y-%m-%d)*
EOF
    
    echo -e "${GREEN}✓ 3-year goals set${NC}"
    
    # This Year's Focus
    echo -e "\n${CYAN}This Year's Focus${NC}"
    read -p "What's your ONE metric that matters this year? " ONE_METRIC
    read -p "What's this year's theme word? " THEME
    
    # Update yearly goals
    YEAR=$(date +%Y)
    sed -i.bak "s/\[CUSTOMIZE THIS:.*\]/$ONE_METRIC/" "Goals/1. Yearly Goals.md" 2>/dev/null || true
    
    echo -e "${GREEN}✓ Yearly goals configured${NC}"
}

# Function 3: Customize Daily Template
customize_daily() {
    echo -e "\n${BLUE}Daily Note Customization${NC}"
    echo "========================"
    
    echo "Let's customize your daily note structure..."
    echo ""
    
    # Time preferences
    echo "When does your day typically start?"
    read -p "Wake time (e.g., 6:00 AM): " WAKE_TIME
    
    echo "When does your workday start?"
    read -p "Work start (e.g., 9:00 AM): " WORK_START
    
    echo "When does your workday end?"
    read -p "Work end (e.g., 5:00 PM): " WORK_END
    
    # Categories
    echo -e "\n${CYAN}Task Categories${NC}"
    echo "What categories do you want to track? (comma-separated)"
    echo "Default: Work, Personal, Learning, Health"
    read -p "Your categories: " CATEGORIES
    CATEGORIES=${CATEGORIES:-"Work,Personal,Learning,Health"}
    
    # Habits
    echo -e "\n${CYAN}Daily Habits${NC}"
    echo "What habits do you want to track? (comma-separated)"
    echo "Example: Exercise, Meditation, Reading, Journaling"
    read -p "Your habits: " HABITS
    
    # Generate custom template
    cat > "Templates/Daily Template - Custom.md" << EOF
---
date: {{date}}
tags: daily-note
---

# {{date:dddd, MMMM DD, YYYY}}

## 🎯 Today's Focus
**ONE Thing:** 

## ⏰ Schedule
- **$WAKE_TIME - Morning Routine**
- **$WORK_START - Work Block**
- **12:00 PM - Lunch Break**
- **1:00 PM - Afternoon Work**
- **$WORK_END - End of Work**
- **Evening - Personal Time**

## ✅ Tasks
EOF
    
    # Add categories
    IFS=',' read -ra CATS <<< "$CATEGORIES"
    for cat in "${CATS[@]}"; do
        cat=$(echo "$cat" | xargs)  # Trim whitespace
        echo -e "\n### $cat\n- [ ] " >> "Templates/Daily Template - Custom.md"
    done
    
    # Add habits section
    echo -e "\n## 🧘 Habits" >> "Templates/Daily Template - Custom.md"
    IFS=',' read -ra HABS <<< "$HABITS"
    for hab in "${HABS[@]}"; do
        hab=$(echo "$hab" | xargs)
        echo "- [ ] $hab" >> "Templates/Daily Template - Custom.md"
    done
    
    # Add reflection
    cat >> "Templates/Daily Template - Custom.md" << EOF

## 💭 Notes & Ideas


## 🔍 End of Day Reflection
### What went well?
- 

### What could be better?
- 

### Tomorrow's priority:
- 

---
*Day {{date:D}} of 365*
EOF
    
    echo -e "${GREEN}✓ Custom daily template created${NC}"
}

# Function 4: Customize Weekly Review
customize_weekly() {
    echo -e "\n${BLUE}Weekly Review Customization${NC}"
    echo "============================"
    
    echo "When do you prefer to do your weekly review?"
    echo "1. Sunday Evening"
    echo "2. Monday Morning"
    echo "3. Friday Afternoon"
    echo "4. Saturday Morning"
    read -p "Choose (1-4): " REVIEW_TIME
    
    case $REVIEW_TIME in
        1) REVIEW_DAY="Sunday Evening" ;;
        2) REVIEW_DAY="Monday Morning" ;;
        3) REVIEW_DAY="Friday Afternoon" ;;
        4) REVIEW_DAY="Saturday Morning" ;;
        *) REVIEW_DAY="Sunday Evening" ;;
    esac
    
    echo -e "\nHow long for your review?"
    read -p "Minutes (default 30): " REVIEW_DURATION
    REVIEW_DURATION=${REVIEW_DURATION:-30}
    
    # Create custom weekly review
    cat > "Templates/Weekly Review - Custom.md" << EOF
# Weekly Review - {{date:YYYY [Week] w}}
**Review Time:** $REVIEW_DAY ($REVIEW_DURATION minutes)

## 📊 Quick Metrics
- Tasks Completed: /
- Goals Progress: %
- Energy Average: /10

## 🔍 Last Week

### Top 3 Wins
1. 
2. 
3. 

### Top 3 Challenges
1. 
2. 
3. 

### Key Insight
- 

## 📅 Next Week

### ONE Big Thing
If nothing else: 

### Priority Projects
1. 
2. 
3. 

### Scheduled Blocks
- Deep Work: 
- Meetings: 
- Personal: 

## 🧹 Cleanup
- [ ] Process inbox
- [ ] Review calendar
- [ ] Update project status
- [ ] Archive old notes
- [ ] Plan time blocks

---
*Review completed in: ___ minutes*
EOF
    
    echo -e "${GREEN}✓ Weekly review customized for $REVIEW_DAY${NC}"
}

# Function 5: Customize Tags
customize_tags() {
    echo -e "\n${BLUE}Tag System Setup${NC}"
    echo "================="
    
    echo "Let's create your personalized tag system..."
    echo ""
    
    echo "Choose tag style:"
    echo "1. Hierarchical (#area/subarea/specific)"
    echo "2. Flat (#area-specific)"
    echo "3. Prefix-based (#p-project, #a-area)"
    read -p "Style (1-3): " TAG_STYLE
    
    echo -e "\nEnter your main life areas (comma-separated):"
    echo "Example: work, personal, health, finance, learning"
    read -p "Your areas: " AREAS
    
    # Create tag reference
    cat > "Tag System.md" << EOF
# My Tag System

## Structure
EOF
    
    case $TAG_STYLE in
        1)
            echo "Hierarchical tags:" >> "Tag System.md"
            IFS=',' read -ra AREA_ARRAY <<< "$AREAS"
            for area in "${AREA_ARRAY[@]}"; do
                area=$(echo "$area" | xargs)
                echo "- #$area/" >> "Tag System.md"
                echo "  - #$area/active" >> "Tag System.md"
                echo "  - #$area/waiting" >> "Tag System.md"
                echo "  - #$area/someday" >> "Tag System.md"
            done
            ;;
        2)
            echo "Flat tags:" >> "Tag System.md"
            IFS=',' read -ra AREA_ARRAY <<< "$AREAS"
            for area in "${AREA_ARRAY[@]}"; do
                area=$(echo "$area" | xargs)
                echo "- #$area" >> "Tag System.md"
                echo "- #${area}-active" >> "Tag System.md"
                echo "- #${area}-waiting" >> "Tag System.md"
            done
            ;;
        3)
            echo "Prefix-based tags:" >> "Tag System.md"
            echo "- #p- (projects)" >> "Tag System.md"
            echo "- #a- (areas)" >> "Tag System.md"
            echo "- #t- (topics)" >> "Tag System.md"
            echo "- #s- (status)" >> "Tag System.md"
            ;;
    esac
    
    cat >> "Tag System.md" << EOF

## Status Tags
- #active - Currently working on
- #waiting - Blocked or waiting
- #someday - Future consideration
- #done - Completed
- #cancelled - No longer relevant

## Priority Tags
- #priority/high - Must do today
- #priority/medium - This week
- #priority/low - When possible

## Energy Tags
- #energy/high - Requires focus
- #energy/medium - Normal energy
- #energy/low - Can do when tired

## Quick Search Queries
- Find all active: tag:#active
- Today's priorities: tag:#priority/high
- Waiting items: tag:#waiting
EOF
    
    echo -e "${GREEN}✓ Tag system created${NC}"
}

# Function 6: Customize Time Blocks
customize_time_blocks() {
    echo -e "\n${BLUE}Time Block Customization${NC}"
    echo "========================"
    
    echo "Let's set up your ideal time blocks..."
    echo ""
    
    echo "What type of schedule do you follow?"
    echo "1. Traditional (9-5)"
    echo "2. Early Bird (5am start)"
    echo "3. Night Owl (work late)"
    echo "4. Flexible/Remote"
    echo "5. Shift Work"
    read -p "Choose (1-5): " SCHEDULE_TYPE
    
    case $SCHEDULE_TYPE in
        1)
            BLOCKS="6-7 AM: Morning Routine
7-8 AM: Planning & Email
8-9 AM: Commute
9-12 PM: Deep Work
12-1 PM: Lunch
1-3 PM: Meetings
3-5 PM: Admin Tasks
5-6 PM: Wrap Up
6-9 PM: Personal Time"
            ;;
        2)
            BLOCKS="5-6 AM: Morning Routine
6-8 AM: Deep Work
8-9 AM: Exercise
9-12 PM: Focused Work
12-1 PM: Lunch
1-3 PM: Meetings
3-5 PM: Project Time
5-7 PM: Family Time
7-9 PM: Personal Projects"
            ;;
        3)
            BLOCKS="8-9 AM: Slow Morning
9-10 AM: Exercise
10-12 PM: Admin Tasks
12-1 PM: Lunch
1-4 PM: Meetings
4-6 PM: Break/Personal
6-8 PM: Dinner
8-12 AM: Deep Work"
            ;;
        4)
            BLOCKS="7-8 AM: Morning Routine
8-10 AM: Deep Work Block 1
10-12 PM: Communication Block
12-1 PM: Lunch & Walk
1-3 PM: Deep Work Block 2
3-4 PM: Admin/Email
4-5 PM: Planning Tomorrow
5-7 PM: Personal Time
7-9 PM: Learning/Side Projects"
            ;;
        5)
            echo "Enter your shift schedule:"
            read -p "Shift start: " SHIFT_START
            read -p "Shift end: " SHIFT_END
            BLOCKS="Custom shift: $SHIFT_START - $SHIFT_END"
            ;;
    esac
    
    # Create time block template
    cat > "Time Blocks.md" << EOF
# My Ideal Time Blocks

## Default Schedule
$BLOCKS

## Deep Work Times
Best focus: [CUSTOMIZE]
Good focus: [CUSTOMIZE]
Low focus: [CUSTOMIZE]

## Rules
1. Protect deep work blocks
2. Batch similar tasks
3. Include breaks
4. End day with planning

## Weekly Variations
- Monday: Planning focus
- Tuesday-Thursday: Execution
- Friday: Review & wrap-up

---
*Adjust based on energy and priorities*
EOF
    
    echo -e "${GREEN}✓ Time blocks configured${NC}"
}

# Function 10: Create Custom Command
create_custom_command() {
    echo -e "\n${BLUE}Create Custom Claude Command${NC}"
    echo "============================="
    
    read -p "Command name (e.g., 'report'): " CMD_NAME
    read -p "Command description: " CMD_DESC
    
    echo "What should this command do?"
    echo "1. Create a specific type of note"
    echo "2. Run a workflow/process"
    echo "3. Generate a report"
    echo "4. Perform maintenance"
    read -p "Choose (1-4): " CMD_TYPE
    
    # Create command file
    cat > ".claude/commands/$CMD_NAME.md" << EOF
# $CMD_NAME Command

$CMD_DESC

## Usage
\`\`\`
claude code /$CMD_NAME
\`\`\`

## What This Command Does
EOF
    
    case $CMD_TYPE in
        1)
            read -p "Note template name: " TEMPLATE
            cat >> ".claude/commands/$CMD_NAME.md" << EOF
1. Creates a new note from template
2. Names it appropriately
3. Places in correct folder

## Configuration
const TEMPLATE_PATH = "Templates/$TEMPLATE.md";
const OUTPUT_FOLDER = "[CUSTOMIZE]";
EOF
            ;;
        2)
            cat >> ".claude/commands/$CMD_NAME.md" << EOF
1. Executes workflow steps
2. Updates relevant files
3. Generates output

## Workflow Steps
1. [Step 1]
2. [Step 2]
3. [Step 3]
EOF
            ;;
        3)
            cat >> ".claude/commands/$CMD_NAME.md" << EOF
1. Analyzes specified data
2. Generates formatted report
3. Saves to designated location

## Report Sections
- Summary
- Details
- Recommendations
EOF
            ;;
        4)
            cat >> ".claude/commands/$CMD_NAME.md" << EOF
1. Performs maintenance tasks
2. Cleans up files
3. Optimizes structure

## Tasks
- Archive old files
- Update indices
- Clean duplicates
EOF
            ;;
    esac
    
    echo -e "${GREEN}✓ Custom command '/$CMD_NAME' created${NC}"
}

# Main loop
while true; do
    show_menu
    
    case $choice in
        1) customize_mission ;;
        2) customize_goals ;;
        3) customize_daily ;;
        4) customize_weekly ;;
        5) customize_tags ;;
        6) customize_time_blocks ;;
        7) echo "Project template customization coming soon..." ;;
        8) echo "Edit CLAUDE.md directly for now..." ;;
        9) echo "Folder structure customization coming soon..." ;;
        10) create_custom_command ;;
        0) 
            echo -e "\n${GREEN}Customization complete!${NC}"
            echo "Your PKM system has been personalized."
            
            # Commit changes
            cd "$VAULT_PATH"
            git add .
            git commit -m "Customization updates - $(date +%Y-%m-%d)" 2>/dev/null || true
            
            exit 0
            ;;
        *) echo -e "${RED}Invalid option${NC}" ;;
    esac
    
    echo -e "\n${CYAN}Press Enter to continue...${NC}"
    read
done