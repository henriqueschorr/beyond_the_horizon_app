# 0009: Codex Database Seed Ingestion & Tooling

- **Status:** open
- **Priority:** P1
- **Domain:** Database / Tooling / Backend
- **Blocked By:** 0008-core-rules-yaml-frontmatter-enrichment.md
- **Blocks:** 0010-codex-reader-ui-prototyping.md, 0011-codex-presentation-engine-and-core-rules-reader.md

---

## 1. Context & Objective
Generate the database seed script (supabase/seeds/codex_seed.sql) and seed ingestion tooling to parse frontmatter-enriched Core Rules Markdown files and populate public.codex_pages, public.codex_page_translations, and public.codex_index in Supabase PostgreSQL, while configuring local asset bundling.

---

## 2. Architectural References
- SDD Database: design/02-sdd-database.md
- ADR 0003: design/decisions/0003-obsidian-native-markdown-yaml-content-pipeline.md
- ADR 0007: design/decisions/0007-content-first-codex-authoring-and-schema-derivation.md
- Ticket 0007: design/tickets/0007-codex-database-schema-and-toc.md
- Ticket 0008: design/tickets/0008-core-rules-yaml-frontmatter-enrichment.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Seed Ingestion Tooling**: Create automated ingestion script or CLI routine that reads content/codex/core_rules/*.md, parses frontmatter headers, and produces valid PostgreSQL insert statements.
- [ ] **Seed Migration File**: Author supabase/seeds/codex_seed.sql inserting the initial pages, pt-BR translations, and hierarchical navigation nodes into public.codex_index.
- [ ] **Local Asset Bundling**: Configure pubspec.yaml asset paths to bundle content/codex/ into the application build for offline zero-latency fallback.
- [ ] **Database Validation**: Execute seed insertion against the Supabase database instance and confirm zero foreign key or unique constraint violations.

---

## 4. Verification & Done Definition
- [ ] Seed script executes cleanly in PostgreSQL without foreign key violations.
- [ ] All bundled Core Rules chapters are verified present in content/codex/ and queryable via public.codex_pages_view.
