# 0006: Core Rules Content Authoring and Syntax Calibration

- **Status:** open
- **Priority:** P1
- **Domain:** Content / Design / Codex
- **Blocked By:** 0005-codex-information-architecture-and-organization.md
- **Blocks:** 0007-codex-database-schema-and-toc.md

---

## 1. Context & Objective
Author the canonical Core Rules manuscript chapters in modular Markdown files within content/codex/core_rules/ (pt-BR source) using the unified grammar defined in the text engine syntax specification. Calibrate typographic tokens, side-by-side figure placements, condition tables, callouts, and redactions during authoring.

---

## 2. Architectural References
- Syntax Specification: design/specs/text_engine_syntax_specification.md
- Master Codex Strategies: design/references/documentation/master_documentation_codex_strategies.md
- SDD Overview: design/01-sdd-overview.md
- Domain Glossary: design/GLOSSARY.md
- ADR 0007: design/decisions/0007-content-first-codex-authoring-and-schema-derivation.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Directory Scaffolding**: Scaffold content/codex/core_rules/ with modular chapter files matching the approved Information Architecture.
- [ ] **Prose Authoring**: Author complete Core Rules text (Universe Introduction, Resolution System, Combat & Trauma) in canonical pt-BR.
- [ ] **Syntax Grammar Compliance**: Apply strict 3-tier heading hierarchy (H1 to H3), semantic type attributes, paragraph alignments, and section callouts per the syntax specification.
- [ ] **Figure Staging**: Stage referenced diagram and graphic assets within content/codex/assets/ using storage URI formatting.
- [ ] **Syntax Engine Calibration**: Update design/specs/text_engine_syntax_specification.md whenever authoring demands new presentation tokens, table styles, or formatting tags.

---

## 4. Verification & Done Definition
- [ ] All Core Rules chapters are written, formatted, and readable in Markdown preview.
- [ ] Zero unauthorized font sizing or arbitrary inline color overrides used.
- [ ] Text engine syntax specification is updated to reflect all applied layout conventions.
