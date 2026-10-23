# 0014: Character Foundation DB Ingestion and Integration

- **Status:** open
- **Priority:** P1
- **Domain:** Database / Frontend / Codex
- **Blocked By:** 0013-specialized-page-presentations-and-ability-cards.md
- **Blocks:** 0015-complete-system-content-authoring.md

---

## 1. Context & Objective
Enrich all Evo'raz Species, Origin, and Path Markdown files with YAML frontmatter metadata, execute seed ingestion into public.codex_pages and public.codex_index, and verify full seamless reading across the live application.

---

## 2. Architectural References
- SDD Database: design/02-sdd-database.md
- SDD Frontend: design/04-sdd-frontend.md
- ADR 0007: design/decisions/0007-content-first-codex-authoring-and-schema-derivation.md
- Ticket 0007: design/tickets/0007-codex-database-schema-and-toc.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Frontmatter Enrichment**: Prepend standardized YAML frontmatter headers to all Evo'raz Species, Origin, Path, and Ability files.
- [ ] **Database Migration & Seeds**: Ingest records into public.codex_pages, public.codex_page_translations, and public.codex_index.
- [ ] **Reader Integration**: Verify that navigating to Evo'raz chapters renders the dedicated Species, Origin, and Path Page Presentations on screen.
- [ ] **TOC Accordion Verification**: Confirm Evo'raz hierarchy expands smoothly within the sticky Table of Contents accordion.

---

## 4. Verification & Done Definition
- [ ] Seed script executes cleanly with zero database errors.
- [ ] Live reader displays Evo'raz Species and Origin pages with all embedded Ability Cards functioning as designed.
