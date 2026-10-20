# 0011: Core Dice Roller Engine

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / Shared
- **Blocked By:** None
- **Blocks:** 0012-realtime-roll-injury-log.md, 0022-gm-hidden-dice-rolling.md

---

## 1. Context & Objective
Implement the polyhedral and custom formula dice roller engine with automated stat modifier injection, advantage/disadvantage evaluation, explosive dice, and clean visual result popups.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: None (pure algorithmic evaluation and shared mathematical formulas).
- [ ] **Backend Services**: Deterministic roll evaluation and validation service for anti-cheat verification.
- [ ] **Shared Contracts**: DiceFormula, DiceRollResultDto, and DiceTerm AST definitions.
- [ ] **Frontend Presentation**: Dice roller quick-tray, formula input drawer, and atmospheric animated result popover.
- [ ] **Localization (l10n)**: Dice notation helper text, success/failure status strings, and modifier tags in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
