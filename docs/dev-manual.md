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

| Tool | Version | Notes |
|------|---------|-------|
| Node.js | ≥ 20 LTS | nvm recommended |
| Docker & Compose | ≥ v20 | for local containers |
| Git | ≥ 2.30 | |
| Supabase account | — | create a free project |
| VS Code (opt.) | — | extensions: ESLint, Prettier, Tailwind CSS IntelliSense |

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

## 4. Environment Variables

| Variable                        | Required | Description                      |
| ------------------------------- | -------- | -------------------------------- |
| `NEXT_PUBLIC_SUPABASE_URL` | ✅        | Supabase REST URL                |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | ✅        | Public anon key                  |
| `SUPABASE_SERVICE_ROLE_KEY` | ⬜        | Server-side admin tasks          |
| `DATABASE_URL` | ✅        | PostgreSQL URL for Prisma        |
| `JWT_SECRET` | ✅        | Secret for API route signing     |
| `PORT` | ⬜        | Override dev port (default 3000) |

> **Security:** `.env` is in `.gitignore` ; never commit secrets.

---

## 5. Available Scripts

| Command                       | Purpose                       |
| ----------------------------- | ----------------------------- |
| `npm run dev` | Start Next.js with hot-reload |
| `npm run build` / `npm start` | Production build & start      |
| `npm run lint` | ESLint check                  |
| `npm run format` | Prettier auto-format          |
| `npm run typecheck` | TypeScript strict mode        |
| `npm run test` | Jest unit & integration tests |
| `npm run test:watch` | Jest watch mode               |
| `npm run test:e2e` | Playwright end-to-end tests   |
| `npx prisma migrate dev` | Run local DB migration        |
| `npx prisma studio` | Visual DB browser             |

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
* Each page and components therefore has **two files**: its visual `page.tsx` and a matching logic hook `useXxx.ts`

---

## 8. Testing Strategy

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

## 9. CI/CD Pipeline

### GitHub Actions

1. **Install → Lint → Type-Check → Test** (Jest + Playwright)
2. **Build** Docker image
3. **Deploy** to Vercel on `main` success

Badges on README show current status.

---

## 10. Database & Migrations

* PostgreSQL hosted by Supabase.
* Prisma schema in `/prisma/schema.prisma`.
* Generate client & push migrations:

```bash
npx prisma migrate dev --name <change>
npx prisma generate
```

Seed data script: `npm run seed` .

---

## 11. Troubleshooting & FAQs

| Symptom                   | Fix                                                   |
| ------------------------- | ----------------------------------------------------- |
| `Error: missing env vars` | Verify `.env` keys match Supabase project             |
| Docker port clash         | Set `PORT=3001` in `.env` |
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
