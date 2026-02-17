# Shikha - Bangla Online Course SaaS

## Project Structure
- `backend/`: Node.js + Express + MongoDB
- `frontend/`: Flutter + BLoC + Dio

## Prerequisites
- Node.js (v14+)
- Flutter SDK (v3.0+)
- MongoDB (Local or Atlas)

## Getting Started

### Backend
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Setup environment variables:
   - Check `.env` and update `MONGO_URI` if needed.
4. Run the server:
   ```bash
   npm run dev
   ```
   Server will run on `http://localhost:5000`.

### Frontend
1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```
2. Get dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Features Implemented
- **Backend**: Auth (Signup, Login), Course CRUD, RBAC Middleware.
- **Frontend**: Clean Architecture, BLoC State Management, Login Screen, Home Dashboard with Course Listing.
# Shikha
