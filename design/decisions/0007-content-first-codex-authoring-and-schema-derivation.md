# 0007: Content-First Codex Authoring, Page Presentations, and Phased Roadmap

- **Status:** accepted
- **Date:** 2026-10-23

## Context & Decision
The rules compendium and universe codex require deep narrative prose, tactical rules, and atmospheric vignettes that cannot be modeled accurately in relational database schemas prior to writing. An initial schema-first approach risked frequent database migrations, schema churn, and premature constraints on editorial formatting.

We decided to establish an iterative 4-milestone pipeline:
1. **Milestone 1A (Core Rules End-to-End)**:
   - Analyze Beyond the Horizon game rules and award-winning TTRPG documentation references to organize chapter hierarchy.
   - Author Core Rules in modular Markdown using the unified text engine syntax grammar, calibrating tokens and layout rules during writing.
   - Derive the relational database schema (public.codex_pages, public.codex_index) directly from the finalized Core Rules structure.
   - Enrich Markdown files with standard YAML frontmatter headers before generating database seed scripts.
   - Prototype the reader UI and implement the Flutter presentation engine, verifying full reading functionality in the app.
2. **Milestone 1B (Evo'raz Character Foundation)**:
   - Author complete Evo'raz Species dossier (prose, Origins, Paths, Abilities).
   - Implement dedicated Page Presentations (distinct full-page templates for Species, Origins, and Paths) and tactile Ability Card widgets.
   - Ingest data and integrate into the live reader.
3. **Milestone 1C (Full Codex Content Expansion)**:
   - Author remaining species, equipment tables and cards, and survival tables.
   - Complete database ingestion for the entire compendium and verify comprehensive reader navigation.
4. **Milestone 1D (Interactive Overlays & Compendium)**:
   - Design and implement the universal keyword tooltip engine, exploring custom Markdown tags versus automated scanners.
   - Implement filterable compendium database views, Slide-Over Drawer, global Cmd+K Omnibar, and local display preferences.

## Consequences
- Positive: Eliminates speculative database schemas and avoidable migrations. Guarantees Table of Contents hierarchy mirrors the exact editorial structure. Verifies the complete end-to-end reading pipeline on screen with a thin slice before scaling content. Separates rich full-page layouts (Page Presentations) from discrete tactical chips (Ability Cards). Prevents premature interactive overlay complexity during initial content authoring.
- Trade-offs: Increases the total number of tracked tickets in Phase 1 to capture each milestone explicitly. Requires frontmatter parsing tooling to bridge Markdown files into database seed scripts.
