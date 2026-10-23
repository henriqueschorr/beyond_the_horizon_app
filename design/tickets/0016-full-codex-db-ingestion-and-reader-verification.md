# 0016: Full Codex Database Ingestion and Reader Verification

- **Status:** open
- **Priority:** P1
- **Domain:** Database / Frontend / Codex
- **Blocked By:** 0015-complete-system-content-authoring.md
- **Blocks:** 0017-universal-keyword-tooltip-engine.md

---

## 1. Context & Objective
Execute comprehensive database seed ingestion for all authored rules, species, equipment, survival, and worldbuilding chapters into public.codex_pages and public.codex_index, and verify full end-to-end reading navigation in the application.

---

## 2. Architectural References
- SDD Database: design/02-sdd-database.md
- SDD Frontend: design/04-sdd-frontend.md
- ADR 0007: design/decisions/0007-content-first-codex-authoring-and-schema-derivation.md
- Ticket 0009: design/tickets/0009-codex-database-seed-ingestion.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Comprehensive Seed Generation**: Generate complete supabase/seeds/codex_seed.sql covering all chapters across all categories.
- [ ] **Database Application**: Execute seed migration against Supabase, validating zero foreign key or index collisions.
- [ ] **Full Navigation Verification**: Verify that the Table of Contents tree displays all volumes, chapters, and sections with accurate breadcrumb tracking.
- [ ] **Asset Delivery Check**: Confirm all referenced images in content/codex/assets/ render smoothly across chapters.

---

## 4. Verification & Done Definition
- [ ] All guidebook chapters load and render cleanly in the reader view.
- [ ] Static analysis passes with 0 diagnostics.
