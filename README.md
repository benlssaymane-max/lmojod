# Premium E-Commerce Store

A modern, full-featured e-commerce platform built with the latest web technologies.

## Tech Stack

- **Frontend**: Next.js 15, React 19, TypeScript
- **Styling**: Tailwind CSS
- **Backend**: Next.js API Routes
- **Database**: PostgreSQL with Prisma ORM
- **Authentication**: NextAuth.js
- **Payments**: Stripe Integration
- **State Management**: Zustand

## Features

✨ **Core Features**
- User authentication and profiles
- Product browsing with search and filters
- Shopping cart management
- Secure checkout with Stripe integration
- Order management
- Product reviews and ratings

🛠️ **Admin Features**
- Product management
- Category management
- Order tracking
- User management
- Analytics dashboard

📱 **User Experience**
- Responsive design (mobile, tablet, desktop)
- Fast performance
- SEO optimized
- Accessible interface

## Prerequisites

- Node.js 18+ and npm/yarn
- PostgreSQL 12+
- Stripe account (for payments)

## Installation

1. **Clone the repository**
```bash
cd ecommerce-store
```

2. **Install dependencies**
```bash
npm install
```

3. **Set up environment variables**
```bash
cp .env.example .env.local
```

Edit `.env.local` and add:
- Database URL: `postgresql://user:password@localhost:5432/ecommerce`
- NextAuth URL and Secret
- Stripe API keys

4. **Set up the database**
```bash
npm run prisma:generate
npm run prisma:migrate
```

5. **Run the development server**
```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## Project Structure

```
src/
├── app/                    # Next.js app directory
│   ├── api/               # API routes
│   ├── components/        # Reusable components
│   ├── layout.tsx         # Root layout
│   └── page.tsx           # Home page
├── components/            # React components
├── lib/                   # Utility functions and configurations
│   ├── auth.ts           # NextAuth configuration
│   ├── prisma.ts         # Prisma client
│   └── stripe.ts         # Stripe configuration
└── types/                # TypeScript types
prisma/
├── schema.prisma         # Database schema
└── migrations/           # Database migrations
```

## Database Schema

The application includes the following main entities:
- **User**: User accounts with roles (USER, ADMIN)
- **Product**: Products with categories and reviews
- **Category**: Product categories
- **Cart & CartItem**: Shopping cart management
- **Order & OrderItem**: Order management
- **Review**: Product reviews and ratings

## API Routes

### Products
- `GET /api/products` - Get all products with pagination
- `GET /api/products/[id]` - Get product details
- `POST /api/products` - Create product (admin only)

### Cart
- `GET /api/cart` - Get user's cart
- `POST /api/cart` - Add item to cart
- `PUT /api/cart/[itemId]` - Update cart item
- `DELETE /api/cart/[itemId]` - Remove from cart

### Orders
- `GET /api/orders` - Get user's orders
- `GET /api/orders/[id]` - Get order details
- `POST /api/orders` - Create order (via checkout)

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login (handled by NextAuth)

## Deployment

### Deploy to Vercel (Recommended)

1. Push your code to GitHub
2. Go to [Vercel](https://vercel.com)
3. Import your repository
4. Add environment variables
5. Deploy

### Deploy to Other Platforms

For deployment on other platforms (AWS, Azure, DigitalOcean, etc.):

1. Build the application: `npm run build`
2. Start the server: `npm run start`
3. Set environment variables on your hosting platform
4. Ensure PostgreSQL is accessible from your server

## Development

### Run tests
```bash
npm test
```

### Lint code
```bash
npm run lint
```

### Prisma Studio (View database)
```bash
npm run prisma:studio
```

### Database migrations
```bash
npm run prisma:migrate
```

## Security

- ✅ Environment variables for sensitive data
- ✅ Password hashing with bcryptjs
- ✅ JWT tokens for authentication
- ✅ CSRF protection with NextAuth
- ✅ SQL injection prevention with Prisma
- ✅ Secure payment processing with Stripe

## Performance

- Next.js optimized images
- Code splitting and lazy loading
- CDN-ready static content
- Database query optimization

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email support@premiumestore.com or open an issue on GitHub.

## Roadmap

- [ ] Mobile app (React Native)
- [ ] AI-powered product recommendations
- [ ] Advanced analytics dashboard
- [ ] Multi-language support
- [ ] Social commerce integration
- [ ] Live chat support
- [ ] Loyalty program
- [ ] Marketplace features

---

Made with ❤️ by the Premium EStore Team
