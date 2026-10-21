# 0005: Codex Database Schema and TOC Architecture

- **Status:** open
- **Priority:** P1 (Highest)
- **Domain:** Database / Supabase
- **Blocked By:** 0004-player-home-command-deck.md
- **Blocks:** 0006-codex-guidebook-content-and-seeds.md

---

## 1. Context & Objective
Revisit and redesign the database schema for the Rules Compendium, replacing the legacy documentation tables with public.codex_pages, public.codex_page_translations, and a dedicated Table of Contents table public.codex_index, while provisioning the codex storage bucket.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Domain Glossary: design/GLOSSARY.md
- ADR 0002: design/decisions/0002-dual-browsing-codex-architecture.md
- SQL Migration: supabase/migrations/20261010000003_create_codex_pages.sql

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Relational Migration**: Author 20261010000003_create_codex_pages.sql establishing public.codex_pages, public.codex_page_translations, and public.codex_index with parent-child relationships and sibling ordering.
- [ ] **Storage Bucket**: Provision the public storage bucket named codex in Supabase storage and attach public read RLS policies.
- [ ] **View & RLS Policies**: Create public.codex_pages_view and verify Row-Level Security allows frictionless unauthenticated reading.
- [ ] **Verification**: Validate SQL syntax and schema execution against the local Supabase instance.

---

## 4. Verification & Done Definition
- [ ] Migration applies cleanly with zero SQL errors.
- [ ] Automated updated_at triggers fire correctly on record modifications.
