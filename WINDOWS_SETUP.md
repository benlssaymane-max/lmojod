"""
Premium E-Commerce Store - Setup Instructions for Windows
=========================================================

This file provides detailed setup instructions for Windows users.
"""

# Installation Steps

## 1. Prerequisites
- Windows 10 or later
- Node.js 18+ (Download from nodejs.org)
- PostgreSQL 12+ (Download from postgresql.org)
- Git (Download from git-scm.com)
- VS Code (Download from code.visualstudio.com)

## 2. Install Node.js
1. Download Node.js LTS from https://nodejs.org/
2. Run the installer and follow the steps
3. Open PowerShell and verify:
   ```powershell
   node --version
   npm --version
   ```

## 3. Install PostgreSQL
1. Download from https://www.postgresql.org/download/windows/
2. Run installer and remember the password for 'postgres' user
3. Verify installation:
   ```powershell
   psql --version
   ```

## 4. Clone/Setup Project
```powershell
# Navigate to your desktop
cd Desktop\level\ecommerce-store

# Install dependencies
npm install
```

## 5. Create Database
```powershell
# Open PostgreSQL command prompt
psql -U postgres

# Create database
CREATE DATABASE ecommerce;

# Exit
\q
```

## 6. Setup Environment
```powershell
# Copy environment template
cp .env.example .env.local

# Edit .env.local with your values
```

## 7. Prisma Setup
```powershell
# Generate Prisma client
npm run prisma:generate

# Run migrations
npm run prisma:migrate
```

## 8. Start Development Server
```powershell
npm run dev
```

Visit: http://localhost:3000

---

# Using Docker (Alternative - No Manual Database Setup)

## 1. Install Docker Desktop
- Download from https://www.docker.com/products/docker-desktop

## 2. Start Services
```powershell
docker-compose up -d
```

## 3. Continue with Prisma Setup
```powershell
npm run prisma:migrate
```

---

# Troubleshooting

## PostgreSQL Won't Start
```powershell
# Start PostgreSQL service
net start postgresql-x64-15
```

## Port 3000 Already in Use
```powershell
# Kill process on port 3000
netstat -ano | findstr :3000
taskkill /PID <PID> /F

# Or use different port
npm run dev -- -p 3001
```

## npm: command not found
- Node.js not installed or not in PATH
- Restart PowerShell after installing Node.js
- Verify: `node --version`

## Database Connection Error
1. Verify PostgreSQL is running:
   ```powershell
   psql -U postgres -d ecommerce
   ```
2. Check DATABASE_URL in .env.local
3. Ensure database exists:
   ```powershell
   psql -U postgres -l
   ```

---

# VS Code Extensions (Recommended)

1. Prisma
2. Thunder Client (API testing)
3. ES7+ React/Redux/React-Native snippets
4. Tailwind CSS IntelliSense
5. REST Client

Install from Extensions marketplace (Ctrl+Shift+X)
