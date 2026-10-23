# 0011: Codex Presentation Engine and Core Rules Reader

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / Codex
- **Blocked By:** 0010-codex-reader-ui-prototyping.md
- **Blocks:** 0012-evoraz-character-foundation-authoring.md, 0019-codex-omnibar-and-local-preferences.md, 0020-codex-integration-and-e2e-routing.md

---

## 1. Context & Objective
Implement the Flutter presentation engine and linear Sources book reader view (/codex/sources/:slug) based on the approved prototype, featuring brutalist Swiss typography, custom callout containers, a persistent left Table of Contents accordion bound to public.codex_index, reading scrollspy, and sequential chapter pagination. Verify the complete Core Rules reading experience end-to-end on screen in the application.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Architecture: design/04-sdd-frontend.md
- Syntax Specification: design/specs/text_engine_syntax_specification.md
- ADR 0002: design/decisions/0002-dual-browsing-codex-architecture.md
- ADR 0007: design/decisions/0007-content-first-codex-authoring-and-schema-derivation.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Markdown Presentation Engine**: Build custom Markdown renderer applying Swiss brutalist typography, callout containers, data tables, and constrained ~70ch reading column.
- [ ] **Sticky Table of Contents**: Build desktop left sidebar displaying the nested TOC tree from public.codex_index with active chapter highlighting.
- [ ] **Scrollspy & Breadcrumbs**: Track reading scroll offset to update persistent breadcrumbs and highlight the active heading in the TOC.
- [ ] **Pagination Controls**: Render tactile Previous Chapter and Next Chapter footer blocks allowing continuous sequential reading.
- [ ] **State Management**: Implement CodexReaderController extending ChangeNotifier to manage chapter selection, loading, and scroll positioning.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics (flutter analyze / dart analyze).
- [ ] Smooth navigation confirmed across all Core Rules chapters on screen without layout jumping.
