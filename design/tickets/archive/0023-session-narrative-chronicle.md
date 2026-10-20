# 0023: Session Narrative Chronicle & Story Events

- **Status:** open
- **Priority:** P2
- **Domain:** Logs / Database / UI
- **Blocked By:** 0019-live-session-lobby.md
- **Blocks:** None

---

## 1. Context & Objective
Record an expanded campaign timeline capturing session summaries, major narrative plot points, NPC discoveries, and story milestones.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.campaign_chronicles and public.story_milestones tables.
- [ ] **Backend Services**: ChronicleService, automated milestone generation, and markdown export handlers.
- [ ] **Shared Contracts**: ChronicleEntryRequestDto and CampaignTimelineResponseDto.
- [ ] **Frontend Presentation**: Vertical campaign timeline tree, session summary editor, and story event cards.
- [ ] **Localization (l10n)**: Timeline date markers, milestone tags, and chronicle headers in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
