# Developer Manual

Welcome to **Bento Blog**!  
This guide walks you through getting the project running locally, maintaining code quality, and understanding our workflows.

---

## 1. Project Overview

Bento Blog is a minimal, dark/light-themed blog platform built with **Next.js**, **TypeScript**, **Redux Toolkit**, and **Supabase**.  
Key goals:

* Clean bento-style UI (ShadCN/ui + Tailwind)
* End-to-end type safety (Prisma + Zod)
* Docker-first local setup
* Automated CI/CD to Vercel

---

## 2. Prerequisites

| Tool             | Version  | Notes                                                   |
| ---------------- | -------- | ------------------------------------------------------- |
| Node.js          | ≥ 20 LTS | nvm recommended                                         |
| Docker & Compose | ≥ v20    | for local containers                                    |
| Git              | ≥ 2.30   |                                                         |
| Supabase account | —        | create a free project                                   |
| VS Code (opt.)   | —        | extensions: ESLint, Prettier, Tailwind CSS IntelliSense |

---

## 3. Local Setup

```bash
# 1. Clone your fork
git clone https://github.com/<your-user>/blog-app.git
cd blog-app

# 2. Install deps
npm install

# 3. Configure environment
cp .env.example .env    # fill in Supabase keys

# 4. Start containers & dev server
docker-compose up --build
```

Visit **[http://localhost:3000](http://localhost:3000)** – hot-reload is enabled.

---

### Use Docker

| Command                            | What it does                                                                    |
| ---------------------------------- | ------------------------------------------------------------------------------- |
| **Build & run prod stack locally** | `docker compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d` |
| **Stop & remove**                  | `docker compose -f docker-compose.yml -f docker-compose.prod.yml down` |

---

## 4. Environment Variables

| Variable                                     | Required | Description                      |
| -------------------------------------------- | -------- | -------------------------------- |
| **Supabase (remote, used after deployment)** |          |                                  |
| `NEXT_PUBLIC_SUPABASE_URL` | ✅        | Supabase REST URL                |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | ✅        | Public anon key                  |
| **Database (local Postgres container)**      |          |                                  |
| `DATABASE_URL` | ✅        | PostgreSQL URL for Prisma        |
| `DATABASE_USER` | ✅        | PostgreSQL DB service user       |
| `DATABASE_PASSWORD` | ✅        | PostgreSQL DB service password   |
| `DATABASE_DB` | ✅        | PostgreSQL DB                    |
| **NextJS Runtime**                           |          |                                  |
| `JWT_SECRET` | ✅        | Secret for API route signing     |
| `PORT` | ⬜        | Override dev port (default 3000) |

> **Security:** `.env` is in `.gitignore` ; never commit secrets.

---

## 5. Available Scripts

| Command                        | Purpose                                                                                                 |
| ------------------------------ | ------------------------------------------------------------------------------------------------------- |
| `npm run dev` | Start the Next.js dev server with hot-reload on the port defined in `PORT` .                            |
| `npm run build` / `npm start` | Compile a production build ( `next build` ) and serve it with `next start` .                            |
| `npm run lint` | Run ESLint against all source files.                                                                    |
| `npm run format` | Auto-format code with Prettier.                                                                         |
| `npm run typecheck` | Perform a strict TypeScript project check without emitting files.                                       |
| `npm run test` | Execute Jest unit + integration test suite once.                                                        |
| `npm run test:watch` | Launch Jest in watch mode—re-runs affected tests on file change.                                        |
| `npm run test:coverage` | Run Jest and generate a coverage report in `/coverage` .                                                |
| `npm run test:coverage:report` | Open the HTML coverage report in your default browser.                                                  |
| `npm run test:e2e` | Execute all Playwright end-to-end tests headlessly.                                                     |
| `npm run db:generate` | Run `prisma generate` to refresh the typed Prisma client.                                               |
| `npm run db:push` | Apply the current Prisma schema to the local database with `prisma db push` .                           |
| `npm run db:push` | Apply the live Prisma schema to the local database with `prisma db pull` .                           |
| `npm run db:migrate` | Create & apply a new migration via `prisma migrate dev` , prompting for a name.                         |
| `npm run db:reset` | Reset the database and re-apply migrations ( `prisma migrate reset` )—**destructive**, use only in dev. |

---

## 6. Coding Conventions

* **TypeScript strict** – avoid `any`; prefer explicit types.
* **ESLint** – `eslint.config.mjs` defines rules (extends `next/core-web-vitals`).
* **Prettier** – auto-formats on commit via pre-commit hook.
* **Tailwind** – utility-first classes; use semantic component wrappers.
* **ShadCN/ui** – import only used components, extend via `ui/` folder.
* **No magic numbers / strings** – centralize in `lib/constants.ts`.
* **Naming Conventions**

---

## 7. Naming Conventions

* **Page folders** (under `app/(pages)`): lower-snake-case — e.g. `about-us/`
* **Page UI file**: `page.tsx`
* **Page logic hook**: camelCase starting with `use` — e.g. `useAccountData.ts`
* **Component folders** (`components/`): lower-snake-case
* **Presenter components**: PascalCase filenames — e.g. `PostCard.tsx`
* **Component logic hooks**: camelCase starting with `use` — e.g. `usePostCard.ts`

---

## 8. File Creation Guide

* **Page Files** compose of 2 files: `page.tsx` (UI) & `useXxx.tx` (Logic hook)
* **Component Files** compose of 2 files: `XxxXxx.tsx` (UI) & `useXxxXxx.tx` (Logic hook)

---

## 9. Testing Strategy

### Unit & Integration

* **Jest** + **RTL** for React components and API routes.
* Test files: `*.test.ts` / `*.test.tsx` beside source.

```bash
npm run test          # run once
npm run test:coverage # generate coverage
```

### End-to-End

* **Playwright** scripts in `e2e/`.
* Critical flows: sign-in, CRUD post, pagination, comment & vote.

```bash
npm run test:e2e      # headless
npx playwright test --ui  # interactive
```

Coverage threshold: **80 %** lines & branches.

---

## 10. Database & Migrations

* PostgreSQL hosted by Supabase.
* Prisma schema in `/prisma/schema.prisma`.
* Generate client & push migrations:

```bash
npx prisma migrate dev --name <label_table>
npx prisma generate
```

Seed data script: `npm run seed` .

---

## 11. Troubleshooting & FAQs

| Symptom                   | Fix                                                   |
| ------------------------- | ----------------------------------------------------- |
| `Error: missing env vars` | Verify `.env` keys match Supabase project             |
| Docker port clash         | Set `PORT=3003` in `.env` |
| Prisma migration fails    | `npx prisma migrate reset` (dev DB only)              |
| Tests time out            | Increase Playwright timeout in `playwright.config.ts` |

---

## 12. Release Process

1. Merge PRs into `main` (all checks green).
2. Tag version `vX.Y.Z` following **Semantic Versioning**.
3. GitHub Action builds, deploys, and creates a release draft with changelog.
4. Publish release when verified in production.

---

## 13. Further Resources

* **Next.js Docs:** [https://nextjs.org/docs](https://nextjs.org/docs)
* **Redux Toolkit:** [https://redux-toolkit.js.org](https://redux-toolkit.js.org)
* **Supabase Docs:** [https://supabase.com/docs](https://supabase.com/docs)
* **Prisma:** [https://www.prisma.io/docs](https://www.prisma.io/docs)
* **Playwright:** [https://playwright.dev](https://playwright.dev)
