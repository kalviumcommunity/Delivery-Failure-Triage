# AuthFlow Pro - Secure User Management System

AuthFlow Pro is a production-ready user authentication and management system built with the MERN stack. It provides a robust foundation for applications requiring secure user registration, persistent login sessions via JSON Web Tokens (JWT), and protected user profiles.

## Tech Stack

- **Backend:** Node.js, Express.js
- **Database:** MongoDB (via Mongoose)
- **Frontend:** React (Vite-based)
- **CI/CD:** GitHub Actions
- **Authentication:** JWT (JSON Web Tokens)

## Local Setup

Follow these steps to get the project running on your local machine:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-org/authflow-pro.git
   cd authflow-pro
   ```

2. **Install Dependencies:**
   Install both root and server dependencies:
   ```bash
   npm install
   cd server && npm install
   cd ../client && npm install
   ```

3. **Environment Configuration:**
   Create a `.env` file in the `server` directory based on `.env.example`:
   ```bash
   cp .env.example server/.env
   ```
   Fill in your `DB_URL` and a secure `JWT_SECRET`.

4. **Run the Application:**
   From the root directory, you can start the development server:
   ```bash
   npm run dev
   ```

## API Reference

| Method | Path | Auth | Description |
| :--- | :--- | :--- | :--- |
| `POST` | `/api/auth/signup` | No | Creates a new user account |
| `POST` | `/api/auth/login` | No | Validates credentials and returns a JWT |
| `GET` | `/api/users/me` | Yes | Returns the currently authenticated user |
| `GET` | `/api/health` | No | Returns system status and timestamp |

### Example Health Check Response:
```json
{
  "status": "ok",
  "timestamp": 1715284800000
}
```

## Environment Variables

The application requires the following variables to be configured:

| Variable | Description |
| :--- | :--- |
| `DB_URL` | MongoDB connection string (e.g., mongodb+srv://...) |
| `JWT_SECRET` | Secret key used for signing and verifying auth tokens |
| `PORT` | The port the server will listen on (defaults to 3000) |

## Deployment

This repository is configured for automated delivery. The application deploys via GitHub Actions on every push to the `main` branch. The workflow handles dependency installation, security auditing, and production builds to ensure high availability and stability.
