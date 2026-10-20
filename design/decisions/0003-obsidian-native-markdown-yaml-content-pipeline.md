# 0003: Segregated Content Architecture (Codex Markdown and Database YAML)

- **Status:** accepted
- **Date:** 2026-10-20

## Context & Decision
The game design requires both continuous prose for the rules guidebook and strictly typed data for system mechanics (such as Conditions, Panic, Injuries, Paths, and Equipment) to power the universal keyword hover tooltip feature. We decided to strictly segregate content into two top-level directories: content/codex/ for narrative guidebook chapters written in pure Markdown, and content/database/ for structured mechanical entities authored as typed YAML data dictionaries. Development is sequenced into two milestones: authoring and rendering the guidebook first, followed by the structured database and universal keyword tooltip engine.

## Consequences
- Positive: Eliminates file clutter by grouping short entities into typed YAML catalogs (avoiding 50+ tiny Markdown files for one-sentence conditions). Provides an unambiguous boundary between editorial reading prose and machine-indexed game mechanics. Allows the keyword tooltip engine to index all terms for universal reuse across the Codex, Character Wizard, and Play Sheet.
- Trade-offs: The backend must support both a pure Markdown chapter loader and a YAML dictionary deserializer.
