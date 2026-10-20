# 0005: Documentation Pages & Storage Catalog

- **Status:** Designing
- **Priority:** P1
- **Domain:** Codex / Database
- **Blocked By:** 0001-user-auth-session.md
- **Blocks:** 0006-codex-keyword-overlay-engine.md, 0007-markdown-presentation-renderer.md, 0024-homebrew-content-creator.md

---

## 1. Context & Objective
Build the core rulebook and codex storage catalog indexing manuscript chapters, category taxonomy, storage-backed Markdown pages, and bilingual translations.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.documentation_pages, public.documentation_categories, storage bucket policies for raw markdown content, and joined view for localized page fetching.
- [ ] **Backend Services**: DocumentationRepository, storage retrieval adapter, and Shelf endpoints for chapter navigation and content delivery.
- [ ] **Shared Contracts**: DocPageSummaryResponseDto, DocPageDetailResponseDto, and DocCategoryDto.
- [ ] **Frontend Presentation**: Codex catalog navigation tree, chapter index sidebar, and breadcrumb bar.
- [ ] **Localization (l10n)**: Codex navigation labels, chapter categories, and reading status strings in app_en.arb and app_pt.arb.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
