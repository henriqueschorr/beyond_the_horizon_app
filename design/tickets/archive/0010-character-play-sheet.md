# 0010: Interactive Character Play Sheet (Simple Sheet)

- **Status:** open
- **Priority:** P1
- **Domain:** Characters / UI / State
- **Blocked By:** 0009-character-creation-wizard.md
- **Blocks:** 0012-realtime-roll-injury-log.md, 0013-facilitator-status-dashboard.md, 0017-responsive-layout-adaptation.md, 0018-campaign-game-creation.md, 0026-interactive-hover-tooltips.md, 0027-inventory-encumbrance-grid.md, 0028-condition-affliction-ticks.md, 0029-character-sheet-offline-export.md, 0030-pwa-offline-caching.md

---

## 1. Context & Objective
Provide the primary digital personnel dossier character sheet for live play: real-time HP/vitality tracking, stress/wounds tracks, attributes, equipped weapons/gear, ability triggers, and injury/trauma records.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.character_sheets table, inventory join tables, active conditions column, and RLS policies.
- [ ] **Backend Services**: CharacterSheetService, live update endpoints, and audit trigger integration.
- [ ] **Shared Contracts**: CharacterSheetResponseDto, CharacterUpdateRequestDto, and StatUpdateDto.
- [ ] **Frontend Presentation**: Tactile personnel dossier sheet widget, interactive wound boxes, attribute roll buttons, and quick-action bar.
- [ ] **Localization (l10n)**: Vitality labels, stress track terminology, weapon stats, and sheet action labels in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
