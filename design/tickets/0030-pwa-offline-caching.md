# 0030: Progressive Web App (PWA) Offline Caching

- **Status:** open
- **Priority:** P3
- **Domain:** PWA / Service Workers
- **Blocked By:** 0010-character-play-sheet.md
- **Blocks:** None

---

## 1. Context & Objective
Configure client-side cache and service worker synchronization enabling uninterrupted character sheet play and dice rolling during offline in-person table sessions.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: Local IndexedDB synchronization schema mirroring character sheet and dice log state.
- [ ] **Backend Services**: Conflict resolution endpoint and synchronization replay handler.
- [ ] **Shared Contracts**: OfflineSyncBundleDto and SyncConflictResolutionDto.
- [ ] **Frontend Presentation**: Service worker registration, offline status banner, and background sync indicator.
- [ ] **Localization (l10n)**: Offline advisory alerts, sync success notifications, and conflict prompts in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
