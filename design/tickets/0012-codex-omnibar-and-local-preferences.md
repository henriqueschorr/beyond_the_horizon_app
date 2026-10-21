# 0012: Global Omnibar and Local Display Preferences

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / Navigation
- **Blocked By:** 0008-codex-presentation-engine-and-reader.md, 0011-codex-compendium-filterable-databases.md
- **Blocks:** 0013-codex-integration-and-e2e-routing.md

---

## 1. Context & Objective
Implement the global Cmd+K quick-jump omnibar search palette providing instant keyboard navigation across all guidebook chapters and structured database entities, alongside browser local storage persistence for user display preferences (font scale, reader measure, and base theme).

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Architecture: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Global Omnibar Overlay**: Bind Cmd+K (macOS) and Ctrl+K (Windows/Linux) globally to open a centered search dialog with auto-focus.
- [ ] **Unified Multi-Index Search**: Search results grouped by category (Guidebook Chapters, Rules, Paths, Equipment, Survival Tables).
- [ ] **Keyboard Navigation**: Arrow key navigation with Enter to jump or inspect, and Escape to dismiss.
- [ ] **Display Preferences**: Persist typography scale and reading column measure in browser local storage via SharedPreferences.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics.
- [ ] Keyboard shortcut and multi-index search response sub-10ms confirmed.
