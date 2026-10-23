# 0019: Global Omnibar and Local Display Preferences

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / Navigation
- **Blocked By:** 0011-codex-presentation-engine-and-core-rules-reader.md, 0018-compendium-filterable-databases-and-drawer.md
- **Blocks:** 0020-codex-integration-and-e2e-routing.md

---

## 1. Context & Objective
Implement the global Cmd+K Omnibar quick-jump search palette providing instant autocomplete navigation across all chapters and compendium entities, along with client-side reading display preferences (column measure, font scaling, contrast).

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Architecture: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md
- Studied Designs: design/studied_designs.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Omnibar Dialog Modal**: Implement tactical modal palette activated via Cmd+K / Ctrl+K shortcut or top navigation bar search button.
- [ ] **Autocomplete Search Index**: Index all public.codex_index nodes and compendium keywords into an in-memory triage index for instant keyboard filtering.
- [ ] **Keyboard Navigation**: Support arrow-key item selection, Enter to jump, and Escape to dismiss.
- [ ] **Display Preferences Panel**: Implement reading preferences controls (reading column measure, font scaling, high-contrast toggle) stored in browser local storage.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics.
- [ ] Cmd+K opens Omnibar immediately; selecting an item navigates cleanly to target chapter or drawer.
