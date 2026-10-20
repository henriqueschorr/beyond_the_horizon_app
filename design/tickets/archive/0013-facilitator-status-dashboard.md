# 0013: Facilitator Character Status Dashboard

- **Status:** open
- **Priority:** P1
- **Domain:** Facilitator / UI / Realtime
- **Blocked By:** 0010-character-play-sheet.md, 0012-realtime-roll-injury-log.md
- **Blocks:** None

---

## 1. Context & Objective
Equip the Facilitator with a single-screen live status cockpit monitoring all active player characters (vitality, stress, sustained injuries, traumas, armor, and active afflictions) at a glance.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: Facilitator party summary view aggregating player sheet stats and live connection status.
- [ ] **Backend Services**: FacilitatorDashboardService and WebSocket/Realtime sync channels.
- [ ] **Shared Contracts**: PartyStatusSummaryResponseDto and CharacterStatusCardDto.
- [ ] **Frontend Presentation**: Multi-character status grid, quick-vitality adjuster, alert badge indicator, and quick-inspect modal.
- [ ] **Localization (l10n)**: Cockpit headers, quick-action tooltips, and status category labels in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
