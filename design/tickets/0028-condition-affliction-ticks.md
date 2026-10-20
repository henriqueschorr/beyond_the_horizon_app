# 0028: Automated Condition & Affliction Ticks

- **Status:** open
- **Priority:** P3
- **Domain:** Combat / State
- **Blocked By:** 0010-character-play-sheet.md
- **Blocks:** None

---

## 1. Context & Objective
Automate turn-based status effects (Bleeding, Radiation, Cyber-Shock, Panic) applying damage, stress, or stat penalties at start-of-turn during live encounters.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.condition_definitions and active_character_conditions table.
- [ ] **Backend Services**: ConditionTickService, turn transition trigger listener, and automated health decrementer.
- [ ] **Shared Contracts**: ConditionDefinitionDto and ConditionTickEventDto.
- [ ] **Frontend Presentation**: Animated affliction badge on play sheet, turn tick prompt, and damage confirmation popup.
- [ ] **Localization (l10n)**: Condition names, severity descriptions, and tick effect logs in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
