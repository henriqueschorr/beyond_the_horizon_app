# 0006: Codex Master Keyword Overlay Engine

- **Status:** Designed
- **Priority:** P1
- **Domain:** Codex / Backend / UI
- **Blocked By:** 0005-documentation-storage-catalog.md
- **Blocks:** 0007-markdown-presentation-renderer.md, 0026-interactive-hover-tooltips.md

---

## 1. Context & Objective
Provide zero-latency in-memory keyword overlay tooltips across all documentation text, indexing keywords, parent-child taxonomy, and grammatical inflection aliases.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.compendium_keywords table, alias mapping array, and category relation foreign keys.
- [ ] **Backend Services**: CompendiumKeywordRepository, in-memory trie or keyword lookup cache, and keyword resolution API.
- [ ] **Shared Contracts**: CompendiumKeywordResponseDto and KeywordLookupRequestDto.
- [ ] **Frontend Presentation**: Keyword overlay scanner, interactive text span decorator, and instant micro-card hover popup.
- [ ] **Localization (l10n)**: Keyword category headers and tooltip metadata labels in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
