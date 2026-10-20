# 0008: Codex Compendium Filterable Databases and Drawer

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / Compendium
- **Blocked By:** 0006-database-structured-content-and-catalogs.md, 0007-universal-keyword-hover-tooltip-engine.md
- **Blocks:** 0009-codex-omnibar-and-local-preferences.md

---

## 1. Context & Objective
Implement the high-density filterable database views (/codex/rules/:category) for fast table reference during play, and build the non-destructive Slide-Over Drawer allowing readers to inspect complete entity dossiers without displacing their active reading position.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Architecture: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md
- ADR 0002: design/decisions/0002-dual-browsing-codex-architecture.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Filterable Database Views**: Dedicated sortable tables and grid cards for Paths (with progression tiers), Species, Origins, Abilities, Equipment, and Survival Tables (Injuries, Panic, Conditions).
- [ ] **Interactive Filters**: Property filters, damage type selectors, tier chips, and instant search inputs.
- [ ] **Non-Destructive Slide-Over Drawer**: Right-hand slide-over drawer widget rendering the full tactical dossier for any selected entity or clicked keyword.
- [ ] **State Preservation**: Ensure background reader scroll position and compendium filter states remain fully intact when the drawer is opened or dismissed.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics.
- [ ] Multi-category filtering and smooth 60fps drawer slide-in verified.
