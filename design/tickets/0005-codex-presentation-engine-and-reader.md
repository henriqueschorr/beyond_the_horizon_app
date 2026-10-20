# 0005: Codex Presentation Engine and Chapter Reader

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / Codex
- **Blocked By:** 0004-codex-reader-ui-prototyping.md
- **Blocks:** 0006-database-structured-content-and-catalogs.md, 0009-codex-omnibar-and-local-preferences.md, 0010-existing-features-alignment-and-wiring.md

---

## 1. Context & Objective
Implement the Flutter presentation engine and linear Sources book reader view (/codex/sources/:slug) based on the approved prototype, featuring brutalist Swiss typography, custom callout containers, a persistent left Table of Contents accordion bound to public.codex_index, reading scrollspy, and sequential chapter pagination.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Architecture: design/04-sdd-frontend.md
- ADR 0002: design/decisions/0002-dual-browsing-codex-architecture.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Markdown Presentation Engine**: Build custom Markdown renderer applying Swiss brutalist typography, callout containers, data tables, and constrained ~70ch reading column.
- [ ] **Sticky Table of Contents**: Build desktop left sidebar displaying the nested TOC tree from public.codex_index with active chapter highlighting.
- [ ] **Scrollspy & Breadcrumbs**: Track reading scroll offset to update persistent breadcrumbs and highlight the active heading in the TOC.
- [ ] **Pagination Controls**: Render tactile Previous Chapter and Next Chapter footer blocks allowing continuous sequential reading.
- [ ] **State Management**: Implement CodexReaderController extending ChangeNotifier to manage chapter selection and scroll positioning.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics.
- [ ] Smooth navigation confirmed across multi-chapter guidebook samples without layout jumping.
