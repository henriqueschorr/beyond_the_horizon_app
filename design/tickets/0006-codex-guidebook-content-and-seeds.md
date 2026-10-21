# 0006: Codex Guidebook Content and Seed Ingestion

- **Status:** open
- **Priority:** P1
- **Domain:** Content / Database / Codex
- **Blocked By:** 0005-codex-database-schema-and-toc.md
- **Blocks:** 0007-codex-reader-ui-prototyping.md, 0008-codex-presentation-engine-and-reader.md

---

## 1. Context & Objective
Scaffold the guidebook chapter directory structure in content/codex/, author the initial rulebook chapters in Markdown (pt-BR canonical), and create the initial database seed script in supabase/seeds/ to populate public.codex_pages, translations, and the public.codex_index Table of Contents.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Architecture: design/02-sdd-database.md
- ADR 0003: design/decisions/0003-obsidian-native-markdown-yaml-content-pipeline.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Directory Layout**: Scaffold content/codex/ with designated subdirectories for guidebook chapters.
- [ ] **Content Authoring**: Author or import initial guidebook chapters in Markdown covering core rules and universe introduction.
- [ ] **Seed Script**: Author supabase/seeds/codex_seed.sql inserting the initial pages, pt-BR translations, and hierarchical navigation nodes into public.codex_index.
- [ ] **Local Asset Bundling**: Configure pubspec.yaml asset paths to bundle content/codex/ into the application build.

---

## 4. Verification & Done Definition
- [ ] Seed script executes cleanly in PostgreSQL without foreign key violations.
- [ ] All bundled chapters are verified present in content/codex/.
