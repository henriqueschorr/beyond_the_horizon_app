# Rulebook 05: Quality Assurance & Go-To-Market (GTM) Standards

This document defines mandatory static analysis verification, testing policies, production error boundaries, and Go-To-Market (GTM) operational constraints for all AI agents.

---

## 1. Mandatory Static Analysis & Compilation Verification

- **Mandatory Static Analysis Before Completion**: ALWAYS run static analysis and compilation verification (flutter analyze for frontend and dart analyze for backend and shared) and verify that 0 errors and 0 diagnostics exist before declaring any task, plan, or implementation as completed or done.
- **Strict Zero-Warning Rule**: No warnings, hints, or errors may be left behind. Any code changes that introduce analyzer diagnostics must be resolved prior to presenting work to the user.

---

## 2. Testing Policy

- **Do Not Run Tests Autonomously**: Do not run tests (such as flutter test, dart test, or any test runners) unless explicitly commanded by the user.
- **Do Not Modify Test Files Autonomously**: Do not modify or edit test files (anything in test/) unless the user explicitly asks you to do so.

---

## 3. Zero-Cost Architecture & Quota Sustainability (GTM Standard)

- **Operating Boundary**: Beyond the Horizon App operates under an indefinite $0.00/month operational budget utilizing static hosting (such as Cloudflare Pages) and managed BaaS (Supabase free tier).
- **Quota Safeguards**:
  - All database queries must be indexed to avoid high-CPU full table scans.
  - Realtime subscriptions must be bounded and scoped to active session channels only (never open global wildcards on large tables).
  - Client state must prioritize in-memory and local browser caching for rules compendium data rather than repetitive network calls.
  - Large binary assets (illustrations, monster dossiers) must be pre-compressed (WebP / AVIF) and cached via HTTP cache headers.

---

## 4. Production Error Boundaries & In-Universe Fallback (GTM Standard)

- **No Grey Crash Screens**: The Flutter Web application must never allow an unhandled runtime error to render a generic browser crash or grey box screen.
- **In-Universe Fallback Terminal**: All screen-level widgets and root router entrypoints must be wrapped in error boundaries that catch uncaught rendering exceptions and display a themed in-universe alert terminal ("SYSTEM ALERT: SENSOR FEED OFFLINE - COGNITIVE MATRIX DISRUPTED") with a tactile retry action button.

---

## 5. Telemetry, Logging & Data Hygiene (GTM Standard)

- **Sanitized Output**: Author tokens, Supabase service keys, passwords, and sensitive player identifiers must NEVER be output to browser console logs, terminal stdout, or crash reporting payloads.
- **Machine Error Codes**: Telemetry and error events must use standardized machine-readable error codes (such as auth_token_expired, network_unreachable) rather than raw internal database error strings or stack traces.

---

## 6. Release Build Gating (GTM Standard)

- **Release Verification**: Before any production release tag or deployment milestone, agents must verify that the web bundle compiles cleanly using:
  ```bash
  flutter build web --release
  ```
- **Web Manifest & Meta Hygiene**: The web shell (web/index.html, web/manifest.json) must maintain compliant theme colors (#101214), standard PWA icons, SEO meta descriptions, and modern security headers.
