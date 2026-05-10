@echo off
echo Starting Premium E-Commerce Store on port 7001...
cd "c:\Users\AYMANE  BEN\Desktop\level\ecommerce-store"
npm install
if %errorlevel% neq 0 (
    echo npm install failed. Please check the error above.
    pause
    exit /b 1
)
echo Dependencies installed successfully!
echo Starting development server on port 7001...
npm run dev -- -p 7001
pause