# 0007: Universal Keyword Hover Tooltip Engine

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / UI Primitives
- **Blocked By:** 0006-database-structured-content-and-catalogs.md
- **Blocks:** 0008-codex-compendium-filterable-databases.md, 0009-codex-omnibar-and-local-preferences.md

---

## 1. Context & Objective
Implement the cross-application keyword recognition and hover tooltip engine. The engine indexes terms, aliases, and summaries from content/database/ into an in-memory dictionary, dynamically detecting keywords in prose and rendering instant hover cards across the Codex reader, character creation wizard, and character play sheet.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Architecture: design/04-sdd-frontend.md
- D&D Beyond Site Reference: design/references/site/dndbeyond_design_reference.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Keyword Registry Service**: Build an in-process KeywordRegistry service compiling all entities, aliases, and conditions into an in-memory lookup structure.
- [ ] **Universal Tooltip Widget**: Create KeywordTooltipWidget displaying a high-contrast terminal hover card with term title, category tag, severity badge, and 1-2 sentence summary.
- [ ] **Prose Keyword Parser**: Implement an automated text scanner that identifies registered keywords in Markdown prose and injects interactive KeywordTooltipWidget spans.
- [ ] **Cross-App Packaging**: Package the keyword tooltip primitive in frontend/lib/shared_widgets/ for universal reuse across the Codex, Character Wizard, and Personnel Dossier sheet.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics.
- [ ] Zero-latency hover card display verified across desktop and tablet pointer interactions.
