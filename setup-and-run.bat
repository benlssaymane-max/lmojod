@echo off
echo ========================================
echo Premium E-Commerce Store Setup
echo ========================================
echo.
echo Checking for Node.js installation...

node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed!
    echo.
    echo Please install Node.js first:
    echo 1. Go to https://nodejs.org/
    echo 2. Download the LTS version (recommended)
    echo 3. Run the installer
    echo 4. Restart this command prompt
    echo 5. Run this batch file again
    echo.
    pause
    exit /b 1
)

echo Node.js found! Checking npm...
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: npm is not available!
    echo Please reinstall Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo.
echo Installing project dependencies...
npm install

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Failed to install dependencies!
    echo Please check the error messages above.
    pause
    exit /b 1
)

echo.
echo Dependencies installed successfully!
echo Starting development server on port 7001...
echo.
echo You can access the store at: http://localhost:7001
echo Press Ctrl+C to stop the server
echo.

npm run dev:7001

pause