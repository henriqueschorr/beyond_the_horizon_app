# 0029: Character Sheet Offline Export (PDF & Markdown)

- **Status:** open
- **Priority:** P3
- **Domain:** Export / File Generation
- **Blocked By:** 0010-character-play-sheet.md
- **Blocks:** None

---

## 1. Context & Objective
Generate high-contrast printable PDF character sheets and clean Obsidian-compatible Markdown exports for offline physical table play and vault syncing.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: None (export serializers).
- [ ] **Backend Services**: PDF generation worker and Markdown dossier serializer endpoint.
- [ ] **Shared Contracts**: ExportOptionsRequestDto and ExportFileResponseDto.
- [ ] **Frontend Presentation**: Export configuration modal, layout print preview, and file download actuator.
- [ ] **Localization (l10n)**: Export format options, print guidelines, and success toasts in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
