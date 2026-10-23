# 0007: Codex Database Schema and TOC Architecture

- **Status:** open
- **Priority:** P1
- **Domain:** Database / Supabase
- **Blocked By:** 0006-core-rules-content-authoring-and-syntax-calibration.md
- **Blocks:** 0008-core-rules-yaml-frontmatter-enrichment.md

---

## 1. Context & Objective
Derive the relational database schema and Table of Contents (TOC) architecture for the Rules Compendium directly from the completed Core Rules manuscript structure, creating public.codex_pages, public.codex_page_translations, and public.codex_index while provisioning the codex storage bucket.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Domain Glossary: design/GLOSSARY.md
- ADR 0002: design/decisions/0002-dual-browsing-codex-architecture.md
- ADR 0007: design/decisions/0007-content-first-codex-authoring-and-schema-derivation.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Relational Migration**: Author SQL migration establishing public.codex_pages, public.codex_page_translations, and public.codex_index calibrated from real Core Rules heading depths, slugs, and categories.
- [ ] **TOC Hierarchy**: Model parent-child relationships and sibling ordering within public.codex_index to support both flat reading and accordion navigation.
- [ ] **Storage Bucket**: Provision public storage bucket named codex in Supabase storage and attach public read RLS policies.
- [ ] **View & RLS Policies**: Create public.codex_pages_view and verify Row-Level Security allows frictionless unauthenticated reading.
- [ ] **Verification**: Validate SQL syntax and schema execution against the local Supabase instance.

---

## 4. Verification & Done Definition
- [ ] Migration applies cleanly with zero SQL errors.
- [ ] Automated updated_at triggers fire correctly on record modifications.
