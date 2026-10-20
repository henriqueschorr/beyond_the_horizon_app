# 0019: Live Session Orchestration & Lobby

- **Status:** open
- **Priority:** P2
- **Domain:** Sessions / Realtime
- **Blocked By:** 0018-campaign-game-creation.md
- **Blocks:** 0020-tactical-encounter-management.md, 0021-secret-transmissions-handouts.md, 0022-gm-hidden-dice-rolling.md, 0023-session-narrative-chronicle.md, 0025-mind-place-case-board.md

---

## 1. Context & Objective
Manage real-time live session lobbies tracking connected participants, game clock/session timer, live status sync, and session objective trackers.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.game_sessions and public.session_participants tables with presence indicators.
- [ ] **Backend Services**: SessionLobbyService, WebSocket presence channels, and heartbeat monitors.
- [ ] **Shared Contracts**: SessionJoinRequestDto, SessionStateResponseDto, and ParticipantPresenceDto.
- [ ] **Frontend Presentation**: Live session room lobby, connected player avatar strip, session timer widget, and active objective tracker.
- [ ] **Localization (l10n)**: Lobby connection status, timer controls, and participant indicators in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
