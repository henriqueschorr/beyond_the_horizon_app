# 0013: Specialized Page Presentations and Ability Cards

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / UI Primitives / Codex
- **Blocked By:** 0012-evoraz-character-foundation-authoring.md
- **Blocks:** 0014-character-foundation-db-ingestion-and-integration.md

---

## 1. Context & Objective
Implement dedicated Flutter Page Presentations (tailored layout templates with unique visual hierarchy, tabular sidebars, and thematic staging for Species dossiers, Origin folios, and Path progression tracks) along with tactile Ability Card widgets embedded within the reader.

---

## 2. Architectural References
- SDD Frontend: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md
- ADR 0007: design/decisions/0007-content-first-codex-authoring-and-schema-derivation.md
- Syntax Specification: design/specs/text_engine_syntax_specification.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Species Page Presentation**: Build tailored layout template featuring atmospheric header portrait, biological trait sidebar, attribute modifier table, and narrative prose.
- [ ] **Origin Page Presentation**: Build specialized background folio layout displaying cultural lore, starting proficiencies, and origin traits.
- [ ] **Path Page Presentation**: Build tactical progression layout organizing ability trees, level unlocks, and prerequisites.
- [ ] **Ability Card Widget**: Implement tactile Flutter presentation card widget displaying ability name, activation cost badge (Stress/Action), prerequisites, and rules copy.
- [ ] **Engine Renderer Extension**: Extend presentation engine parser to render Ability Card widgets and dispatch appropriate Page Presentations.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics (flutter analyze / dart analyze).
- [ ] Visual verification confirms Species, Origin, Path layouts and embedded Ability Cards render cleanly on screen.
