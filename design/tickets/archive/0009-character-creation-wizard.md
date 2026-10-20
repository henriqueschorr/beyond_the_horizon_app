# 0009: Step-by-Step Character Creation Wizard

- **Status:** open
- **Priority:** P1
- **Domain:** Characters / Frontend
- **Blocked By:** 0001-user-auth-session.md
- **Blocks:** 0010-character-play-sheet.md

---

## 1. Context & Objective
Deliver an interactive, step-by-step character creation wizard guiding players through species selection, origin background, attribute allocation, ability picking, starting equipment, and stat derivation.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.characters, public.character_attributes, and public.character_abilities draft tables with RLS policies.
- [ ] **Backend Services**: CharacterDraftService and Shelf endpoints for saving draft wizard progression.
- [ ] **Shared Contracts**: CharacterCreationRequestDto, CharacterDraftResponseDto, and AttributeAllocationDto.
- [ ] **Frontend Presentation**: Multi-step creation wizard with stepper progress bar, summary confirmation card, and stat preview.
- [ ] **Localization (l10n)**: Wizard step titles, guidance tooltips, attribute descriptions, and confirmation prompts in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
