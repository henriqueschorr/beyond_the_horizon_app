# 0002: Landing Page, Authentication & Guest Access Console

- **Status:** done
- **Priority:** P1
- **Domain:** Frontend / Auth / UI
- **Blocked By:** 0001-prototype-ui-ideation-skill.md
- **Blocks:** 0003-epigraph-lore-transmissions.md

---

## 1. Context & Objective
Revisit and modernize the public Landing Page portal. The screen delivers the unauthenticated public face of the application, featuring the monumental typographic crossword brand mark, spherical event horizon arc, authenticated access console (user registration and login with client validation), and guest navigation menu items (Codex quick-jump and terminal settings drawer).

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md
- Architecture Decision Record: design/decisions/0005-canonical-user-roles-and-landing-asymmetric-scaling.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [x] **Database / Schema**: Public profiles table and RLS policies ensuring secure player authentication and session persistence.
- [x] **Backend Services**: Auth services and token verification endpoints adhering to pure DTO wire contracts and machine-readable error codes.
- [x] **Shared Contracts**: Pure wire Request/Response DTOs for user registration, user login, and session refresh.
- [x] **Frontend Presentation**: Revisit LandingPage, CrosswordBrandMark, EventHorizonArc, LoggedOutAccessConsole, and auth modal dialogs complying with the brutalist sci-fi design system and Rule 10 of Agents.md (constructor initializer resolution, no widget build helpers).
- [x] **Guest Navigation**: Provide unauthenticated navigation actions (CODEX and SETTINGS) that function cleanly without requiring an active session.
- [x] **Localization (l10n)**: All brand labels, slogan strings, form validation hints, and error banners localized in English and Portuguese.

---

## 4. Verification & Done Definition
- [x] Static analysis passes with 0 errors and 0 diagnostics.
- [x] Unauthenticated visitor can view the landing page, open settings, and trigger registration/login modals with full validation.
