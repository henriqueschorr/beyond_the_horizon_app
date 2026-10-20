# 0012: Real-Time Roll & Injury/Trauma Audit Log

- **Status:** open
- **Priority:** P1
- **Domain:** Logs / Realtime / UI
- **Blocked By:** 0010-character-play-sheet.md, 0011-core-dice-roller-engine.md
- **Blocks:** 0013-facilitator-status-dashboard.md

---

## 1. Context & Objective
Provide a live chronological audit feed broadcasting every dice roll outcome, formula breakdown, and immediate real-time alerts whenever any character sustains an injury, trauma, or severe affliction.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.session_logs table, log type enums, and Supabase Realtime publication broadcast triggers.
- [ ] **Backend Services**: AuditLogService, broadcast pipeline, and real-time event distribution endpoints.
- [ ] **Shared Contracts**: AuditLogEntryResponseDto, RollLogDetailDto, and InjuryAlertDto.
- [ ] **Frontend Presentation**: Collapsible live activity ticker, high-visibility trauma alert banner, and filterable log drawer.
- [ ] **Localization (l10n)**: Log entry formatting, injury alert descriptions, and filter category labels in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
