# 0018: Compendium Filterable Databases and Slide-Over Drawer

- **Status:** open
- **Priority:** P1
- **Domain:** Database / Frontend / Compendium
- **Blocked By:** 0017-universal-keyword-tooltip-engine.md
- **Blocks:** 0019-codex-omnibar-and-local-preferences.md

---

## 1. Context & Objective
Implement the Game Rules compendium browsing mode (/codex/rules/:category) featuring filterable, sortable entity databases and the non-destructive Slide-Over Drawer for inspecting full entity dossiers without losing the user's reading position.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- SDD Frontend: design/04-sdd-frontend.md
- ADR 0002: design/decisions/0002-dual-browsing-codex-architecture.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Compendium Catalog Integration**: Author structured YAML catalogs in content/database/ for Conditions, Equipment, and Survival mechanics.
- [ ] **Filterable Database Views**: Implement category browsing views with text filtering, category sorting, and dense brutalist data grids.
- [ ] **Slide-Over Drawer Widget**: Implement right-docked sliding drawer displaying full entity dossiers, recovery protocols, and tactical traits.
- [ ] **Click-to-Drawer Binding**: Wire keyword tooltips and catalog row clicks to open the Slide-Over Drawer seamlessly.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics.
- [ ] Slide-Over Drawer opens and closes smoothly without displacing reader scroll position.
