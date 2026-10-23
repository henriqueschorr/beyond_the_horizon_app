# 0015: Complete System Content Authoring

- **Status:** open
- **Priority:** P1
- **Domain:** Content / Codex
- **Blocked By:** 0014-character-foundation-db-ingestion-and-integration.md
- **Blocks:** 0016-full-codex-db-ingestion-and-reader-verification.md

---

## 1. Context & Objective
Author all remaining official rules and universe content in content/codex/ (pt-BR canonical source), covering remaining playable species, equipment catalogs (tables and cards), survival and hazard tables, and deep setting lore chapters, enriched with standardized YAML frontmatter headers.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Syntax Specification: design/specs/text_engine_syntax_specification.md
- Domain Glossary: design/GLOSSARY.md
- ADR 0007: design/decisions/0007-content-first-codex-authoring-and-schema-derivation.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Remaining Species Dossiers**: Author all additional playable species with their affiliated Origins and Paths.
- [ ] **Equipment Chapters**: Author armor, weaponry, tactical gear, and tech catalogs utilizing structured tables and equipment cards.
- [ ] **Survival & Hazard Tables**: Author decompression, radiation, starship combat, and zero-g survival rules.
- [ ] **Universe & Worldbuilding**: Author planetary profiles, faction intelligence, and cosmic horror setting lore.
- [ ] **YAML Frontmatter**: Prepend complete, standardized YAML frontmatter headers to every authored file.

---

## 4. Verification & Done Definition
- [ ] All official compendium chapters are present in content/codex/ with valid frontmatter.
- [ ] All referenced figures and diagrams staged in content/codex/assets/.
