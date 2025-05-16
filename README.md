<a name="readme-top">

<div align="center">
  <a href="https://github.com/zyx-0314/">

  <img src="./public/personalLogo/ianCedric.jpeg" alt="Nyebe" width="130" height="100">

  </a>
  <h3 align="center">Bento Blog</h3>
</div>

![](https://visit-counter.vercel.app/counter.png?page=zyx-0314/Blog-Sample-Project)

<!-- [![CI](https://img.shields.io/github/actions/workflow/status/zyx-0314/Blog-Sample-Project/ci.yml?branch=main&label=CI)](https://github.com/zyx-0314/Blog-Sample-Project/actions/workflows/ci.yml) -->
<!-- [![Coverage](https://img.shields.io/codecov/c/github/zyx-0314/Blog-Sample-Project?label=Coverage)](https://app.codecov.io/gh/zyx-0314/Blog-Sample-Project) -->
[![License](https://img.shields.io/github/license/zyx-0314/Blog-Sample-Project)](LICENSE)
<!-- [![wakatime](https://wakatime.com/badge/user/018dd99a-4985-4f98-8216-6ca6fe2ce0f8/project/63501637-9a31-42f0-960d-4d0ab47977f8.svg)](https://wakatime.com/badge/user/018dd99a-4985-4f98-8216-6ca6fe2ce0f8/project/63501637-9a31-42f0-960d-4d0ab47977f8) -->

<div align="center">
Bento Blog is a minimal, dark/light-themed blogging platform powered by Next.js, React, TypeScript, Redux, and Supabase. It lets users sign up, publish posts, comment, and vote—all in a clean bento-style UI.
</div>

## Table of Contents

* [Features](#features)
* [Tech Stack](#tech-stack)
* [Quick Start](#quick-start)
* [Configuration](#configuration)
* [Folder Structure](#folder-structure)
* [Testing](#testing)

---

## Features

* **Authentication** – secure signup, login, logout via Supabase Auth  
* **Blog Posts** – create, edit, delete, with live Markdown preview & Zod validation  
* **Browsing** – paginated bento-grid list of posts with search/filter stubs  
* **Interaction** – threaded comments plus per-user upVote/downVote  
* **Theming** – instant dark / light mode toggle using ShadCN/ui  
* **Responsive UI** – minimal, mobile-first layout  
* **CI/CD & Testing** – Dockerized dev, Vercel deploy, Jest + RTL tests  

---

## Tech Stack

### Languages

![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)

### Framework / Tech Stack

![Next.js](https://img.shields.io/badge/Next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white)

![Tailwind CSS](https://img.shields.io/badge/Tailwind%20CSS-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white)

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

![Vercel](https://img.shields.io/badge/Vercel-000000?style=for-the-badge&logo=vercel&logoColor=white)

### Libraries

![Redux Toolkit](https://img.shields.io/badge/Redux%20Toolkit-764ABC?style=for-the-badge&logo=redux&logoColor=white)

![Zod](https://img.shields.io/badge/Zod-3B82F6?style=for-the-badge&logoColor=white)

![Axios](https://img.shields.io/badge/Axios-5A29E4?style=for-the-badge&logoColor=white)

![ShadCN /ui](https://img.shields.io/badge/ShadCN%2Fui-000000?style=for-the-badge&logo=tailwindcss&logoColor=white)

### Testing

![Jest](https://img.shields.io/badge/Jest-C21325?style=for-the-badge&logo=jest&logoColor=white)

### Database / Backend

![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)

![Prisma](https://img.shields.io/badge/Prisma-2D3748?style=for-the-badge&logo=prisma&logoColor=white)

---

## Quick Start / Installation

> Currently Dummy, will be revised as the development progress

```bash
# 1 – Clone
git clone https://github.com/your-username/blog-app.git
cd blog-app
```

```bash
# 2 – Install deps
npm install
```

```bash
# 3 – Environment
cp .env.example .env
```

```.env

# edit .env with:

SUPABASE_URL=
SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY= (optional for admin tasks)

```

```bash
# 4 – Run locally (Docker)
docker-compose up --build
```

```bash
# 5 – Open in browser
open http://localhost:3000
```

---

## Configuration

Create a `.env` file (or copy `.env.example` ) and supply these variables:

> Currently Dummy, will be revised as the development progress

| Variable | Required | Description |
|----------|----------|-------------|
| `NEXT_PUBLIC_SUPABASE_URL` | ✅ | Supabase project REST URL |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | ✅ | Supabase **anon** public API key |
| `SUPABASE_SERVICE_ROLE_KEY` | ✅ | Service-role key (only for server-side admin tasks) |
| `DATABASE_URL` | ✅ | PostgreSQL connection string for Prisma ( `postgresql://…` ) |
| `JWT_SECRET` | ✅ | Secret used by Next.js API routes for JWT signing |
| `NODE_ENV` | ✅ | `development` \| `production` |
| `PORT` | ✅ | Custom port for the dev server (defaults to `3000` ) |

> **Tip:** never commit real secrets—add `.env` to `.gitignore` .

---

## Usage / Examples

### Common Commands

> Currently Dummy, will be revised as the development progress

```bash
# start dev server with hot-reload
npm run dev

# format & lint code
npm run format
npm run lint

# type-check
npm run typecheck

# run Jest unit tests
npm run test

# production build & start
npm run build
npm start
```

---

## Folder Structure

```bash
/
├── app/                         # Next.js App Router root
│   ├── (pages)/                 # Route groups & page components
│   └── globals.css              # Global Tailwind styles
├── components/                  # Reusable building blocks
│   ├── elements/                # Atomic UI elements (buttons, inputs)
│   ├── features/                # Feature-specific composites (e.g. PostCard)
│   └── ui/                      # ShadCN/ui wrappers & custom variants
├── dockers-creds/                        
├── docs/                        # Project documentation
│   ├── dev-manual.md            # Conventions, scripts, setup
│   ├── schema.md                # Prisma & Supabase schema
│   └── test-plan.md             # Test strategy & reports
├── lib/                         # Helpers (API clients, util functions)
├── node_modules/                         
├── hook/                        
├── public/                      # Static assets (images, icons, favicons)
├── prisma/                      # Prisma schema & SQL migrations
├── store/                       # Redux Toolkit slices & store config
├── .dockerignore                         
├── .env                         # Local environment variables (git-ignored)
├── .gitignore                         
├── docker-compose.yml           # Local dev containers (app + db)
├── Dockerfile                   # Production container definition
├── eslint.config.mjs            # ESLint rules & Next.js presets
├── next.config.ts               # Next.js configuration & plugins
├── jest.config.js               # Jest test runner config
├── tsconfig.json                # TypeScript compiler options
├── CODE_OF_CONDUCT.md           # Community guidelines
├── LICENSE                      # Project license (MIT)
├── package.json                 # NPM scripts & dependencies
├── package-lock.json            # Exact dependency versions
├── postcss.config.mjs           # PostCSS + Tailwind plugins
└── README.md                    # Project overview (this file)

```

---

## Documentation Links

* [Developer Manual](docs/dev-manual.md)
* [Database Schema](docs/schema.md)
* [Test Plan](docs/test-plan.md)

---

## Testing

### Unit & Integration

The project uses **Jest** and **React Testing Library** for component and API route tests.

```bash
# run all tests once
npm run test         

# watch files and re-run on change
npm run test:watch   

# generate coverage report in /coverage
npm run test:coverage
```

Test files reside in `__tests__/` or alongside source files with `.test.ts[x]` suffix.

### End-to-End (E2E)

E2E tests are stubbed with **Playwright** (replace with Cypress if preferred).

```bash
# headless run
npm run test:e2e          

# interactive UI mode
npx playwright test --ui  
```

E2E specs live in `e2e/` and cover critical flows such as sign-in, create post, and pagination navigation. Continuous integration runs the full Jest + Playwright suite on every pull request.
