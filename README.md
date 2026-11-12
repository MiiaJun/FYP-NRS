# News Release System

A gaming news platform developed using React, PHP and MySQL as a final-year project.

Live website: [https://nrs.rabutenri.com](https://nrs.rabutenri.com)

## Project Structure

```text
FYP-NRS/
├── frontend/       React frontend
├── backend/        PHP API and scheduled jobs
└── nrs.sql         Database structure and sample data
```

## Requirements

- Node.js and npm
- PHP 8.5.12 or later
- Composer
- MySQL
- PHP mysqli extension

## Database Setup

1. Create a MySQL.
2. Import `nrs.sql` using MySQL Workbench, phpMyAdmin or the MySQL command-line client.
3. Configure the database environment variables used by the PHP backend.

## Backend Environment Variables

```text
MYSQLHOST
MYSQLPORT
MYSQLUSER
MYSQLPASSWORD
MYSQLDATABASE

OPENAI_API_KEY
RESEND_API_KEY

CLOUDINARY_CLOUD_NAME
CLOUDINARY_API_KEY
CLOUDINARY_API_SECRET
```

## Running the Backend

```bash
cd backend
composer install
php -S localhost:8080
```

The local API will be available at:

```text
http://localhost:8080/api
```

## Running the Frontend

```bash
cd frontend
npm install
npm run dev
```

Open the address displayed by Vite, normally:

```text
http://localhost:5173
```

For local development, change the API address in `frontend/src/api/axios.js` to:

```text
http://localhost:8080/api
```

Also change the allowed origin in `backend/config/cors.php` to:

```text
http://localhost:5173
```

## Scheduled Jobs

The following PHP scripts calculate the trending and bridging scores:

```bash
php backend/cron/calculateTrendingScore.php
php backend/cron/bridgingScore.php
```

In production, Railway runs these scripts every four hours.

## Production Build

To build the frontend:

```bash
cd frontend
npm run build
```

The production files will be created in `frontend/dist`.
