# 0025: The Mind Place / Investigative Case Board

- **Status:** open
- **Priority:** P3
- **Domain:** Campaign / Canvas UI
- **Blocked By:** 0019-live-session-lobby.md
- **Blocks:** None

---

## 1. Context & Objective
Provide a tactile, Alan Wake 2-inspired cork and concrete operations board where Facilitators link threat dossiers, clues, NPC Polaroids, and plot nodes with red relationship threads.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.case_board_nodes and public.case_board_threads tables with canvas coordinates.
- [ ] **Backend Services**: CaseBoardService and real-time thread synchronization handlers.
- [ ] **Shared Contracts**: CaseNodeDto, CaseThreadDto, and CaseBoardStateResponseDto.
- [ ] **Frontend Presentation**: Interactive canvas board, draggable polaroids, tactile red thread connectors, and evidence drawer.
- [ ] **Localization (l10n)**: Case board instructions, evidence categories, and investigation tags in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
