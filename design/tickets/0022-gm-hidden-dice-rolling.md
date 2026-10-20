# 0022: GM Hidden Dice Rolling

- **Status:** open
- **Priority:** P2
- **Domain:** Dice / Facilitator
- **Blocked By:** 0011-core-dice-roller-engine.md, 0019-live-session-lobby.md
- **Blocks:** None

---

## 1. Context & Objective
Provide a private dice roll mode allowing the Facilitator to roll secret checks that conceal formulas and outcomes from player logs while recording them in the private GM chronicle.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: is_secret boolean flag and GM-only RLS policy on public.session_logs.
- [ ] **Backend Services**: Secret roll validation and audience-filtered audit broadcast filter.
- [ ] **Shared Contracts**: SecretRollRequestDto and GMSecretRollResponseDto.
- [ ] **Frontend Presentation**: Hidden roll toggle switch, stealth tray indicator, and GM-only result banner.
- [ ] **Localization (l10n)**: Secret roll toggle labels, GM private notices, and stealth indicator tags in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
