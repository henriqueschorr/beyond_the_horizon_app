# 0026: Interactive Hover Tooltips & Slide-Out Drawers

- **Status:** open
- **Priority:** P3
- **Domain:** UI Primitives / Codex
- **Blocked By:** 0006-codex-keyword-overlay-engine.md, 0010-character-play-sheet.md
- **Blocks:** None

---

## 1. Context & Objective
Deliver hover and tap micro-interactions across character sheets and encounter views that open instant rules text and slide-out drawers without leaving the active screen.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: None (UI micro-interaction layer consuming codex keywords).
- [ ] **Backend Services**: None (in-memory keyword index cache).
- [ ] **Shared Contracts**: TooltipConfigurationDto and DrawerPayloadDto.
- [ ] **Frontend Presentation**: HoverTooltipTrigger, SlideOutDrawerHost, and tactile backdrop blur.
- [ ] **Localization (l10n)**: Drawer close actions and reading accessibility hints in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
