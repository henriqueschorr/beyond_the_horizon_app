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
- [ ] **Curated Content**: Manually copied and normalized official rulebook Markdown chapters from bth_game into content/manuscript/ (pt-BR canonical source).
- [ ] **Database / Schema**: Database seed migration in supabase/seeds/ inserting core chapter records and category links into public.documentation_pages.
- [ ] **Shared Contracts**: Pure wire contracts for documentation page retrieval.
- [ ] **Frontend Presentation**: Verification of rendered rulebook pages across all chapters using the markdown presentation renderer.
- [ ] **Localization (l10n)**: pt-BR canonical source text verification and English catalog scaffolding.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
