# 0017: Universal Keyword Tooltip Engine and Custom Tags

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / UI Primitives / Codex
- **Blocked By:** 0016-full-codex-db-ingestion-and-reader-verification.md
- **Blocks:** 0018-compendium-filterable-databases-and-drawer.md

---

## 1. Context & Objective
Design and implement the universal keyword tooltip engine operating across the application (Codex reader, character creation, and play sheet), evaluating custom Markdown tag annotations versus automated prose text scanners, backed by in-memory keyword caching for zero-latency hover popovers.

---

## 2. Architectural References
- Keyword Plan: design/specs/compendium_keywords_plan.md
- SDD Frontend: design/04-sdd-frontend.md
- Database Schema: design/02-sdd-database.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Keyword Registry**: Implement in-memory client registry caching keyword terms, categories, aliases, and concise micro-definitions on application startup.
- [ ] **Prose Annotation Strategy**: Evaluate and implement the parsing mechanism (custom markdown tags such as keyword tags with slug attributes versus automated text scanners) that identifies registered terms in Markdown prose.
- [ ] **Hover Tooltip Widget**: Implement high-contrast, tactile hover popover displaying keyword category badge, canonical name, and micro-definition.
- [ ] **Reader Integration**: Verify that registered terms in the Codex reader display interactive hover popovers without interfering with scroll performance.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics.
- [ ] Keyword tooltips resolve in 0ms on mouse hover across sample Codex pages.
