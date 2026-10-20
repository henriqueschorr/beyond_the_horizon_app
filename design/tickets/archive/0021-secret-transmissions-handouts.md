# 0021: Secret Transmissions & Classified Handouts

- **Status:** open
- **Priority:** P2
- **Domain:** Messaging / UI
- **Blocked By:** 0019-live-session-lobby.md
- **Blocks:** None

---

## 1. Context & Objective
Enable the Facilitator to dispatch encrypted sensor logs, private audio transcripts, or classified notes directly to individual player screens during live play.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.secret_transmissions table with player-specific RLS visibility.
- [ ] **Backend Services**: TransmissionDispatchService and real-time notification push handlers.
- [ ] **Shared Contracts**: TransmissionSendRequestDto and TransmissionDetailResponseDto.
- [ ] **Frontend Presentation**: Facilitator dispatch composer, player classified alert popover, and decrypted dossier modal.
- [ ] **Localization (l10n)**: Transmission classification stamps, decrypting status text, and dispatch labels in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
