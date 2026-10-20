# 0014: Application Configurations & Display Settings

- **Status:** open
- **Priority:** P1
- **Domain:** Settings / Frontend
- **Blocked By:** None
- **Blocks:** None

---

## 1. Context & Objective
Manage client preferences: retro CRT scanline toggles, phosphor bloom intensity, UI theme accents (Weyland Amber vs. FBC Cold Fluorescent), font size scaling, and audio volume.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: User preferences JSON column in public.profiles for cross-device cloud sync.
- [ ] **Backend Services**: Preferences persistence endpoint with fallback to local browser storage.
- [ ] **Shared Contracts**: UserSettingsDto and ThemePreferenceEnum.
- [ ] **Frontend Presentation**: Terminal-styled settings drawer, live CRT preview canvas, accent color switchers, and audio sliders.
- [ ] **Localization (l10n)**: Setting names, theme descriptions, and slider labels in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
