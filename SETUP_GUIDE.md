# Premium E-Commerce Store - Setup Guide

## Quick Start (5 minutes)

### Step 1: Install Dependencies
```bash
cd ecommerce-store
npm install
```

### Step 2: Configure Database

**Option A: Local PostgreSQL** (Recommended for development)
```bash
# Install PostgreSQL if not already installed
# Then create a new database
createdb ecommerce

# Update .env.local
DATABASE_URL="postgresql://username:password@localhost:5432/ecommerce"
```

**Option B: Cloud Database** (For production)
- Use Supabase, Railway, or Render
- Get connection string and add to `.env.local`

### Step 3: Configure Environment Variables
```bash
cp .env.example .env.local
```

Edit `.env.local`:
```
DATABASE_URL="your_database_url"
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="generate-a-random-secret-key"
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY="pk_test_your_key"
STRIPE_SECRET_KEY="sk_test_your_key"
STRIPE_WEBHOOK_SECRET="whsec_your_key"
NODE_ENV="development"
```

### Step 4: Setup Database Schema
```bash
npm run prisma:generate
npm run prisma:migrate
```

### Step 5: Seed Sample Data (Optional)
```bash
npm run prisma:seed
```

### Step 6: Run Development Server
```bash
npm run dev
```

Visit: http://localhost:3000

---

## Environment Variables Explained

| Variable | Description | Example |
|----------|-------------|---------|
| DATABASE_URL | PostgreSQL connection string | postgresql://user:pass@localhost:5432/ecommerce |
| NEXTAUTH_URL | Your app URL | http://localhost:3000 |
| NEXTAUTH_SECRET | Secret key for JWT | random-secure-string-64-chars |
| NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY | Stripe public key | pk_test_... |
| STRIPE_SECRET_KEY | Stripe secret key | sk_test_... |
| STRIPE_WEBHOOK_SECRET | Stripe webhook secret | whsec_... |

---

## Getting Stripe Keys

1. Create account at [stripe.com](https://stripe.com)
2. Go to Dashboard → Developers → API Keys
3. Copy "Publishable key" and "Secret key"
4. Copy "Webhook signing secret" from Webhooks section
5. Add all three to `.env.local`

---

## Database Setup

### Create Migration
```bash
npm run prisma:migrate -- --name add_new_table
```

### View Database (Prisma Studio)
```bash
npm run prisma:studio
```
Opens at http://localhost:5555

### Reset Database (⚠️ Warning: Deletes all data)
```bash
npx prisma migrate reset
```

---

## Common Issues & Solutions

### Issue: "Can't reach database server"
**Solution:**
```bash
# Check PostgreSQL is running
# Windows:
net start postgresql-x64-15

# macOS:
brew services start postgresql

# Linux:
sudo systemctl start postgresql
```

### Issue: Prisma migration error
**Solution:**
```bash
npx prisma generate
npx prisma migrate deploy
```

### Issue: Port 3000 already in use
**Solution:**
```bash
# Use different port
npm run dev -- -p 3001
```

### Issue: Module not found errors
**Solution:**
```bash
# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install
```

---

## Stripe Webhook Setup

For payment processing in development:

1. Install Stripe CLI from https://stripe.com/docs/stripe-cli
2. Run: `stripe listen --forward-to localhost:3000/api/webhooks/stripe`
3. Copy webhook signing secret to `.env.local`

---

## Adding Products

### Via Prisma Studio
```bash
npm run prisma:studio
```
Then use the web interface to add products, categories, etc.

### Via API
```bash
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Sample Product",
    "description": "A great product",
    "price": 99.99,
    "stock": 100,
    "categoryId": "category-id-here",
    "image": "https://via.placeholder.com/300x300"
  }'
```

---

## Testing

### Create Test User
1. Register at http://localhost:3000/auth/register
2. Or use Prisma Studio to create manually

### Test Payment (Stripe Test Cards)
- Card: `4242 4242 4242 4242`
- Expiry: Any future date
- CVC: Any 3 digits

---

## Deployment

### Deploy to Vercel

1. Push code to GitHub
2. Connect at vercel.com
3. Set environment variables:
   - DATABASE_URL
   - NEXTAUTH_URL (your Vercel domain)
   - NEXTAUTH_SECRET
   - STRIPE keys
4. Deploy!

### Deploy to Other Platforms

**Build first:**
```bash
npm run build
npm run start
```

**Using Docker:**
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install && npm run build
CMD ["npm", "start"]
```

---

## Next Steps

1. ✅ Customize branding (logo, colors, fonts)
2. ✅ Add your products and categories
3. ✅ Configure Stripe webhooks
4. ✅ Set up email notifications
5. ✅ Deploy to production
6. ✅ Set up monitoring and analytics

---

## Support Resources

- [Next.js Docs](https://nextjs.org/docs)
- [Prisma Docs](https://www.prisma.io/docs/)
- [NextAuth Docs](https://next-auth.js.org/)
- [Stripe Docs](https://stripe.com/docs)
- [Tailwind CSS Docs](https://tailwindcss.com/docs)

Happy coding! 🚀
