# 0002: Landing Pages & Player Home Command Deck

- **Status:** In Progress
- **Priority:** P1
- **Domain:** Frontend / Routing
- **Blocked By:** None
- **Blocks:** 0004-atmospheric-graphic-staging.md, 0016-ui-animations-transitions.md, 0017-responsive-layout-adaptation.md

---

## 1. Context & Objective
Implement the decoupled Minimalist Brutalism landing portal and authenticated Player Home (Command Deck) featuring the monumental typographic crossword brand mark, tactical navigation menu, player greeting, and session controls.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: None (relies on active session state).
- [ ] **Backend Services**: None (frontend shell routing and layout composition).
- [ ] **Shared Contracts**: NavigationDestination enum and player session view models.
- [ ] **Frontend Presentation**: LandingPageView with event horizon arc; PlayerHomePage (Command Deck) with vertical O-alignment, cassette-orange player greeting, tactical menu (PLAY WITH CHARACTER, CREATE CHARACTER, CODEX, SETTINGS) with organic arrow hover interaction, and session sign-out actuator.
- [ ] **Localization (l10n)**: Brand slogans, tactical menu options, greeting strings, and sign-out button keys in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
