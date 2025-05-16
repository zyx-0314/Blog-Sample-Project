# Contributing to Bento Blog

Thank you for your interest in improving **Bento Blog**!  
We welcome all pull requests, issues, and ideas.  
Before contributing, please read these guidelines to help keep the process smooth.

---

## 1. Code of Conduct

By participating, you agree to follow our [Code of Conduct](./CODE_OF_CONDUCT.md).

---

## 2. Getting Started

1. **Fork** this repository and **clone** your fork.  
2. Install dependencies:

```bash
   npm install
```

3. Copy the environment template and add your keys:

```bash
cp .env.example .env
```

4. Start local containers:

```bash
docker-compose up --build
```

5. Create a new branch based on `main`.

---

## 3. Branch Naming

| Purpose        | Prefix   | Example              |
| -------------- | -------- | -------------------- |
| Feature        | `feat/`  | `feat/auth-flow`     |
| Fix / Bug      | `fix/`   | `fix/login-redirect` |
| Documentation  | `docs/`  | `docs/readme-typos`  |
| Refactor/Chore | `chore/` | `chore/upgrade-deps` |

---

## 4. Commit Messages

Use **[Conventional Commits](https://www.conventionalcommits.org)**:

```
<type>(scope): <subject>

<body> # optional
<footer> # optional, add  here the issues list
```

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`.

---

## 5. Coding Standards

* **TypeScript:** strict mode; no `any` unless justified.
* **Lint / Format:** using `Prettier` as formatter 

```bash
npm run lint      # ESLint
npm run format    # Prettier
```
<!--* **Tests:** All PRs must pass Jest & Playwright suites.-->

---

## 6. Pull-Request Checklist

* [ ] PR title follows Conventional Commits.
* [ ] Lint, format, type-check succeed (`npm run lint`).
* [ ] Unit tests pass (`npm run test`) and coverage ≥ 80 %.
* [ ] E2E tests pass (`npm run test:e2e`) if affected.
* [ ] Docs updated (README / docs/\*).
* [ ] Linked issue is referenced in PR description (`Closes #123`).

---

## 7. Issue Guidelines

1. **Search first** – avoid duplicates.
2. Use the **Issue Template** (Bug Report or Feature Request).
3. Provide clear reproduction steps or screenshots.

---

## 8. Need Help?

Open an issue with the label `question` or join the discussion tab.

