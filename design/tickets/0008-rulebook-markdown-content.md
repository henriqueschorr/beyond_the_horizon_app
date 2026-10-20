# 0008: Documentation Markdowns Creation from bth_game

- **Status:** open
- **Priority:** P1
- **Domain:** Codex / Content
- **Blocked By:** 0007-markdown-presentation-renderer.md
- **Blocks:** None

---

## 1. Context & Objective
Extract, convert, and author official rulebook Markdown chapters from the Beyond the Horizon game vault (bth_game) into the documentation storage catalog (pt-BR), covering core rules, species, equipment, companions, and universe lore.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: Initial database seed migration inserting core chapter records and category links.
- [ ] **Backend Services**: Automated markdown ingestion script or migration seed loader.
- [ ] **Shared Contracts**: Content seed verification DTOs.
- [ ] **Frontend Presentation**: Verification of rendered rulebook pages across all chapters using the renderer.
- [ ] **Localization (l10n)**: pt-BR canonical source text and initial English structure scaffolds.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
