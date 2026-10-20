# 0020: Tactical Encounter Management

- **Status:** open
- **Priority:** P2
- **Domain:** Encounters / Backend / UI
- **Blocked By:** 0019-live-session-lobby.md
- **Blocks:** None

---

## 1. Context & Objective
Provide the combat and hazard encounter runner: turn-order initiative sorting, threat/adversary stat cards, live monster HP/armor adjustments, and environmental event triggers.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.encounters and public.encounter_participants tables.
- [ ] **Backend Services**: EncounterService, initiative sorting algorithms, and combat event dispatchers.
- [ ] **Shared Contracts**: EncounterCreateRequestDto, EncounterStateResponseDto, and TurnOrderUpdateDto.
- [ ] **Frontend Presentation**: Initiative turn tracker bar, adversary stat cards, threat HP/armor sliders, and environmental trigger buttons.
- [ ] **Localization (l10n)**: Combat phase banners, turn announcement labels, and threat stat descriptions in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
