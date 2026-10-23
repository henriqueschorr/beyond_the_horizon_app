# 0008: Core Rules YAML Frontmatter Enrichment

- **Status:** open
- **Priority:** P1
- **Domain:** Content / Tooling / Codex
- **Blocked By:** 0007-codex-database-schema-and-toc.md
- **Blocks:** 0009-codex-database-seed-ingestion.md

---

## 1. Context & Objective
Enrich all authored Core Rules Markdown chapters in content/codex/core_rules/ with standardized YAML frontmatter metadata headers derived from the newly approved database schema and Table of Contents architecture, bridging raw prose to machine-readable database seed inputs.

---

## 2. Architectural References
- SDD Database: design/02-sdd-database.md
- ADR 0003: design/decisions/0003-obsidian-native-markdown-yaml-content-pipeline.md
- ADR 0007: design/decisions/0007-content-first-codex-authoring-and-schema-derivation.md
- Ticket 0007: design/tickets/0007-codex-database-schema-and-toc.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Frontmatter Schema Definition**: Define canonical YAML frontmatter keys matching the database schema (slug, title, locale, category, parent_slug, sort_order, reading_time_minutes, tags).
- [ ] **Chapter File Enrichment**: Prepend valid YAML frontmatter blocks to every markdown chapter file in content/codex/core_rules/.
- [ ] **TOC Alignment**: Verify that parent_slug and sort_order values across frontmatter blocks map 1:1 to the public.codex_index hierarchy.
- [ ] **Obsidian & Tooling Verification**: Validate that frontmatter parses cleanly in Obsidian and standard YAML parsers without corrupting prose rendering.

---

## 4. Verification & Done Definition
- [ ] Every Core Rules markdown file contains valid, well-formed YAML frontmatter.
- [ ] Automated YAML linting or validation passes with zero syntax errors.
