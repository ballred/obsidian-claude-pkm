@echo off
REM Obsidian + Claude Code PKM Setup Script for Windows
REM This script automates the initial setup of your PKM system

setlocal enabledelayedexpansion

REM Colors setup (Windows 10+)
echo.

echo =====================================
echo   Obsidian + Claude Code PKM Setup
echo   Version 1.0 for Windows
echo =====================================
echo.

REM Step 1: Check Prerequisites
echo Step 1: Checking Prerequisites
echo ==============================

REM Check for Git
where git >nul 2>nul
if %errorlevel%==0 (
    echo [OK] Git is installed
    git --version
) else (
    echo [ERROR] Git is not installed
    echo Please install Git from: https://git-scm.com/
    pause
    exit /b 1
)

REM Check for Claude Code
where claude >nul 2>nul
if %errorlevel%==0 (
    echo [OK] Claude Code is installed
) else (
    echo [WARNING] Claude Code CLI not found
    echo Install from: https://code.claude.com/docs
    set /p CONTINUE="Continue without Claude Code? (y/n): "
    if /i not "!CONTINUE!"=="y" exit /b 1
)

echo.

REM Step 2: Get Vault Location
echo Step 2: Choose Vault Location
echo ==============================

set DEFAULT_VAULT=%USERPROFILE%\Documents\ObsidianPKM
set /p VAULT_PATH="Where should we create your vault? [%DEFAULT_VAULT%]: "
if "%VAULT_PATH%"=="" set VAULT_PATH=%DEFAULT_VAULT%

REM Check if directory exists
if exist "%VAULT_PATH%" (
    echo [WARNING] Directory already exists: %VAULT_PATH%
    set /p USE_EXISTING="Use existing directory? Files may be overwritten (y/n): "
    if /i not "!USE_EXISTING!"=="y" (
        echo Setup cancelled
        pause
        exit /b 1
    )
) else (
    mkdir "%VAULT_PATH%"
    echo [OK] Created vault directory: %VAULT_PATH%
)

echo.

REM Step 3: Copy Vault Template
echo Step 3: Setting Up Vault Structure
echo ===================================

set SCRIPT_DIR=%~dp0
set TEMPLATE_DIR=%SCRIPT_DIR%..\vault-template

echo Copying template files...
xcopy /E /I /Y "%TEMPLATE_DIR%\*" "%VAULT_PATH%\" >nul 2>nul
echo [OK] Vault structure created

echo.

REM Step 4: Set Up Claude Commands
echo Step 4: Setting Up Claude Commands
echo ===================================

where claude >nul 2>nul
if %errorlevel%==0 (
    REM Commands are already in vault-template\.claude\commands\
    REM Just need to initialize Claude
    cd /d "%VAULT_PATH%"
    
    REM Check if commands were copied
    if exist "%VAULT_PATH%\.claude\commands" (
        echo [OK] Claude commands already in place
    ) else (
        echo [WARNING] Claude commands directory not found
    )
    
    REM Initialize Claude in vault
    claude init 2>nul
    echo [OK] Claude Code initialized in vault
) else (
    echo [WARNING] Skipping Claude Code setup - not installed
)

echo.

REM Step 5: Initialize Git
echo Step 5: Git Repository Setup
echo ============================

cd /d "%VAULT_PATH%"

if exist .git (
    echo [WARNING] Git repository already exists
) else (
    git init >nul
    echo [OK] Git repository initialized
)

REM Configure Git
set /p GIT_NAME="Enter your name for Git commits: "
set /p GIT_EMAIL="Enter your email for Git commits: "

if not "%GIT_NAME%"=="" (
    git config user.name "%GIT_NAME%"
    echo [OK] Git user name set
)

if not "%GIT_EMAIL%"=="" (
    git config user.email "%GIT_EMAIL%"
    echo [OK] Git user email set
)

REM Initial commit
git add . >nul 2>nul
git commit -m "Initial PKM setup" >nul 2>nul
echo [OK] Initial commit created

echo.

REM Step 6: GitHub Setup (Optional)
echo Step 6: GitHub Integration - Optional
echo ======================================

set /p SETUP_GITHUB="Do you want to set up GitHub integration? (y/n): "
if /i "%SETUP_GITHUB%"=="y" (
    set /p GITHUB_URL="Enter your GitHub repository URL (or press Enter to skip): "
    
    if not "!GITHUB_URL!"=="" (
        git remote add origin "!GITHUB_URL!" 2>nul || git remote set-url origin "!GITHUB_URL!"
        echo [OK] GitHub remote configured
        
        set /p PUSH_NOW="Push to GitHub now? (y/n): "
        if /i "!PUSH_NOW!"=="y" (
            git push -u origin main 2>nul || git push -u origin master
            echo [OK] Pushed to GitHub
        )
        
        REM Set up GitHub Action
        mkdir "%VAULT_PATH%\.github\workflows" 2>nul
        copy "%SCRIPT_DIR%..\github-actions\claude.yml" "%VAULT_PATH%\.github\workflows\" >nul
        echo [OK] GitHub Action workflow copied
        echo [NOTE] Remember to add CLAUDE_CODE_OAUTH_TOKEN to repository secrets
    )
)

echo.

REM Step 7: Personalization
echo Step 7: Initial Personalization
echo ================================

echo.
echo What's your personal mission or life purpose?
echo Example: Build meaningful technology while maintaining balance
set /p MISSION="Your mission: "

if not "%MISSION%"=="" (
    REM This is simplified - proper text replacement in batch is complex
    echo [OK] Personal mission noted - please update CLAUDE.md manually
)

echo.
echo What's your main focus right now?
set /p FOCUS="Current focus: "

REM Create first daily note (locale-agnostic date via PowerShell)
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set TODAY=%%I
set DAILY_NOTE=%VAULT_PATH%\Daily Notes\%TODAY%.md

if not exist "%DAILY_NOTE%" (
    echo Creating your first daily note...
    copy "%VAULT_PATH%\Templates\Daily Template.md" "%DAILY_NOTE%" >nul
    echo [OK] First daily note created: %TODAY%.md
)

REM Inject focus into Today's Priority if provided
if not "%FOCUS%"=="" (
    powershell -NoProfile -Command "(Get-Content -Raw '%DAILY_NOTE%') -replace '\\*\\*Today''s Priority:\\*\\*','**Today''s Priority:** %FOCUS%' | Set-Content -Encoding UTF8 '%DAILY_NOTE%'"
)

echo.

REM Step 8: Final Setup
echo Step 8: Finalizing Setup
echo ========================

REM Create a setup completion marker
echo Setup completed on %date% %time% > "%VAULT_PATH%\.setup_complete"

REM Commit personalization
cd /d "%VAULT_PATH%"
git add . >nul 2>nul
git commit -m "Personalized PKM setup" >nul 2>nul

echo.
echo =============================================
echo          Setup Complete!
echo =============================================
echo.
echo Your PKM system is ready at: %VAULT_PATH%
echo.
echo Next steps:
echo 1. Open Obsidian and select your vault folder
echo 2. Explore the Goals folder to set your objectives
echo 3. Start using daily notes with: claude code /daily
echo 4. Run weekly reviews with: claude code /weekly
echo.
echo Quick Commands:
echo   cd "%VAULT_PATH%"      - Navigate to your vault
echo   claude code /onboard   - Load context into Claude
echo   claude code /daily     - Create today's note
echo   claude code /push      - Save changes to Git
echo.
echo Read the documentation in docs\ for detailed guidance
echo.

REM Offer to open Obsidian
set /p OPEN_OBSIDIAN="Open Obsidian now? (y/n): "
if /i "!OPEN_OBSIDIAN!"=="y" (
    REM Try common install locations, then PATH
    if exist "%LOCALAPPDATA%\Programs\Obsidian\Obsidian.exe" (
        start "" "%LOCALAPPDATA%\Programs\Obsidian\Obsidian.exe"
    ) else if exist "%LOCALAPPDATA%\Obsidian\Obsidian.exe" (
        start "" "%LOCALAPPDATA%\Obsidian\Obsidian.exe"
    ) else (
        where obsidian >nul 2>nul && start "" obsidian
    )
    echo [OK] Obsidian launched
)

echo.
echo Happy note-taking!
echo.
pause