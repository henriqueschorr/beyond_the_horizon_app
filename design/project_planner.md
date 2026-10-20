# Project Planner & Roadmap Register: Beyond the Horizon App

- **Document Title:** Project Planner & Roadmap Register
- **Project:** Beyond the Horizon - Digital Companion & Rules Platform ("Beyond the Horizon App")
- **Author:** Henrique Schorr
- **Last Updated:** 2026-10-20
- **Documentation Standard:** All technical features, architectural milestones, and companion toolsets are tracked here as tracer-bullet tickets in strict order of importance across five release phases. System Design Documents (01-sdd-overview.md, 02-sdd-database.md, 03-sdd-backend.md, 04-sdd-frontend.md) and GLOSSARY.md remain the canonical technical references.

---

## 1. Status Lifecycle Definitions

Every ticket progresses through the following standardized lifecycle states:

- **open:** Backlog item defined and prioritized; design and implementation not yet started.
- **in-progress:** Active implementation underway across packages.
- **blocked:** Cannot proceed until prerequisite tickets in Blocked By land.
- **done:** Fully implemented, verified with static analysis, tested, and accepted.

---

## 2. Release Phasing Matrix

```mermaid
flowchart TD
    P1["<b>PHASE 1: Rules Compendium & Universe Codex MVP</b><br/>Zero-Login Reader • Dual Browsing (Sources & Game Rules)<br/>Markdown Presentation Engine • Sticky TOC • Omnibar Search<br/>Slide-Over Drawer • Survival Tables • Local Asset Store"]
    P2["<b>PHASE 2: Character Creation & Interactive Play Sheet</b><br/>Character Creation Wizard • Personnel Dossier Play Sheet<br/>Core Dice Roller Engine • Local & Cloud Character Saves"]
    P3["<b>PHASE 3: Atmospheric Polish, Transitions & Micro-Animations</b><br/>Tactile CRT Scanlines • Phosphor Bloom • Dossier Opening Wipes<br/>Chromatic Alert Shifts • Retro Audio Cues • Responsive Polish"]
    P4["<b>PHASE 4: Facilitator & Campaign Operations</b><br/>Campaign Creation • Live Session Lobby • Encounter Runner<br/>Secret Transmissions • Facilitator Character Cockpit"]
    P5["<b>PHASE 5: The Mind Place & Advanced Expansions</b><br/>Alan Wake Case Board • Homebrew Studio • Encumbrance Grid<br/>Condition Automation • PDF Sheet Export • Offline PWA Sync"]

    P1 --> P2 --> P3 --> P4 --> P5
```

---

## 3. Phase 1: Rules Compendium & Universe Codex MVP (High Priority)

The goal of Phase 1 is to deliver a frictionless, high-aesthetic digital reference platform for the Beyond the Horizon universe, executed in five distinct milestones: (1) Database Schema & TOC Redesign, (2) Guidebook Content Authoring & Seeds, (3) UI Prototyping via the prototype skill, (4) Frontend Reader UI Implementation, and (5) Structured Database & Universal Keyword Hover Tooltip Engine.

| Number | Ticket | Domain | Status | Priority | Blocked By | Scope & Deliverables |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **0001** | [0001: Prototype UI Ideation Skill](./tickets/0001-prototype-ui-ideation-skill.md) | Tooling / Workflow | **done** | **P1 (Prerequisite)** | None | Create skills/prototype/SKILL.md defining interactive wireframing workflows, ASCII layouts, and UI ideation routines before building frontend widgets. |
| **0002** | [0002: Codex Database Schema and TOC Architecture](./tickets/0002-codex-database-schema-and-toc.md) | Database / Supabase | **open** | **P1 (Highest)** | 0001 | Author migration establishing public.codex_pages, translations, and dedicated Table of Contents table public.codex_index; provision codex storage bucket. |
| **0003** | [0003: Codex Guidebook Content and Seed Ingestion](./tickets/0003-codex-guidebook-content-and-seeds.md) | Content / Database | **open** | **P1** | 0002 | Author initial guidebook chapters in content/codex/; create database seed entries in supabase/seeds/codex_seed.sql. |
| **0004** | [0004: Codex Reader Layout Prototyping](./tickets/0004-codex-reader-ui-prototyping.md) | UI Prototyping / Design | **open** | **P1** | 0001, 0003 | Interactively wireframe and validate the desktop reading layout, sticky TOC accordion, and ~70ch typography measure using the prototype skill. |
| **0005** | [0005: Codex Presentation Engine and Chapter Reader](./tickets/0005-codex-presentation-engine-and-reader.md) | Frontend / Codex | **open** | **P1** | 0004 | Implement the Swiss brutalist Markdown renderer and linear reader view (/codex/sources/:slug) bound to public.codex_index with scrollspy and pagination. |
| **0006** | [0006: Database Structured Content and YAML Catalogs](./tickets/0006-database-structured-content-and-catalogs.md) | Database / Architecture | **open** | **P1** | 0005 | Establish content/database/ with YAML dictionaries for Survival Tables, Character Foundation, Equipment, and Keywords. |
| **0007** | [0007: Universal Keyword Hover Tooltip Engine](./tickets/0007-universal-keyword-hover-tooltip-engine.md) | Frontend / UI Primitives | **open** | **P1** | 0006 | In-process keyword registry and instant hover card widget operating across the entire application (Codex, Wizard, Play Sheet). |
| **0008** | [0008: Codex Compendium Filterable Databases and Drawer](./tickets/0008-codex-compendium-filterable-databases.md) | Frontend / Compendium | **open** | **P1** | 0006, 0007 | Searchable grid views (/codex/rules/:category) and non-destructive Slide-Over Drawer for inspecting full entity dossiers. |
| **0009** | [0009: Global Omnibar and Local Display Preferences](./tickets/0009-codex-omnibar-and-local-preferences.md) | Frontend / Navigation | **open** | **P1** | 0005, 0008 | Global Cmd+K quick-jump search palette and local storage display preferences (font scale, column measure, basic theme). |
| **0010** | [0010: Existing Features Alignment and Routing](./tickets/0010-existing-features-alignment-and-wiring.md) | Frontend / Routing | **open** | **P1** | 0005, 0009 | Wire existing landing page and player home CODEX buttons to /codex; preserve Auth and Epigraphs as non-blocking modules. |

---

## 4. Phase 2: Character Creation & Interactive Play Sheet (Medium-High Priority)

The goal of Phase 2 is to equip players with complete digital character agency: guided step-by-step creation, a tactile personnel dossier sheet, automated attribute calculation, and integrated dice rolling.

| Number | Scope & Deliverables | Target Architecture |
| :--- | :--- | :--- |
| **0010** | Step-by-Step Character Creation Wizard (Species selection, Origin, Path, attribute allocation, starting gear, and automated stat derivation). | Frontend / Characters / State |
| **0011** | Interactive Personnel Dossier Play Sheet (Real-time Vitality, Stress, equipped weapons, ability execution, and active Injury/Trauma tracking). | Frontend / UI / Controllers |
| **0012** | Core Dice Roller Engine (Polyhedral and custom formula roller, advantage/disadvantage handling, and clean visual result popups). | Frontend / Shared / Logic |
| **0013** | Character Dossier Persistence (Local client storage for offline sessions and optional Supabase cloud syncing for authenticated accounts). | Backend / Local Storage / DB |

---

## 5. Phase 3: Atmospheric Polish, Transitions & Micro-Animations (Medium Priority)

The goal of Phase 3 is to elevate the platform with cinematic industrial brutalism: tactile CRT scanline bloom, classified dossier wipes, chromatic shifts, and subtle retro audio cues across the Codex and Character Sheet.

| Number | Scope & Deliverables | Target Architecture |
| :--- | :--- | :--- |
| **0014** | Display Settings & Visual Enhancements (CRT scanline shader toggle, phosphor bloom intensity, UI theme accents, and typography scaling). | Settings / Frontend / Shaders |
| **0015** | Atmospheric UI Transitions & Animations (Classified dossier opening wipes, alert status chromatic shifts, and subtle screen micro-interactions). | Frontend / UI / Theme |
| **0016** | Atmospheric Staging & Environmental Immersion (Graphic anchors, procedural stipple dissolution, and ambient analog terminal hums). | Frontend / Artwork / Audio |
| **0017** | Comprehensive Multi-Device Ergonomics (Refined responsive breakpoint redistribution for tablet portrait/landscape and desktop wide formats). | Frontend / UI / Responsive |

---

## 6. Phase 4: Facilitator & Campaign Operations (Medium-Low Priority)

The goal of Phase 4 is to provide the Facilitator with full session running command: campaign lobbies, encounter tracking, secret player transmissions, and a live party cockpit.

| Number | Scope & Deliverables | Target Architecture |
| :--- | :--- | :--- |
| **0018** | Campaign & One-Shot Game Creation (Facilitator game suite, premise descriptions, player roster management, and shareable join links). | Games / Backend / UI |
| **0019** | Live Session Orchestration & Lobby (Real-time participant presence, session timers, and shared objective trackers). | Sessions / Realtime |
| **0020** | Tactical Encounter Runner (Turn-order initiative sorting, adversary stat cards, live monster adjustments, and environmental hazards). | Encounters / Backend / UI |
| **0021** | Secret Transmissions & Classified Handouts (Encrypted sensor logs, private transcripts, and classified notes dispatched directly to player screens). | Messaging / UI / Realtime |
| **0022** | Facilitator Live Party Cockpit & Hidden Rolls (Single-screen GM cockpit monitoring party vitality, stress, and sustained injuries in real-time). | Facilitator / UI / Realtime |

---

## 7. Phase 5: The Mind Place & Advanced Expansions (Nice-to-Haves)

The goal of Phase 5 is to introduce tactile investigative depth, homebrew content creation, and offline table convenience.

| Number | Scope & Deliverables | Target Architecture |
| :--- | :--- | :--- |
| **0023** | The Mind Place / Investigative Case Board (Alan Wake 2-inspired cork and concrete operations board linking clues, NPC dossiers, and plot threads). | Campaign / Canvas UI |
| **0024** | Homebrew & Custom Content Studio (In-app creation suite enabling Facilitators to build custom abilities, species, and equipment). | Codex / Backend |
| **0025** | Slot-Based Inventory & Encumbrance Grid (Visual slot grid calculating weight thresholds, ammo clips, and biological symbionts). | Characters / Inventory |
| **0026** | Automated Condition & Affliction Ticks (Turn-based status effect automation applying bleeding, radiation, or panic penalties at round starts). | Combat / State |
| **0027** | Character Sheet Offline Export (High-contrast printable PDF character sheets and clean Obsidian-compatible Markdown export). | Export / File Generation |
| **0028** | Progressive Web App (PWA) Offline Synchronization (Service worker caching and background sync enabling complete offline table play). | PWA / Service Workers |

---

## 8. Architectural Alignment & Cross-References

- **System Overview & Aesthetic Foundation:** [01-sdd-overview.md](./01-sdd-overview.md)
- **Database Schema & RLS Policies:** [02-sdd-database.md](./02-sdd-database.md)
- **In-Process Backend Services:** [03-sdd-backend.md](./03-sdd-backend.md)
- **Frontend Architecture & Design Tokens:** [04-sdd-frontend.md](./04-sdd-frontend.md)
- **Live Domain Glossary:** [GLOSSARY.md](./GLOSSARY.md)
- **Architecture Decision Records:**
  - [ADR 0001: Codex-First Scope and 5-Phase Lifecycle](./decisions/0001-codex-first-scope-and-phasing.md)
  - [ADR 0002: Dual Browsing Information Architecture](./decisions/0002-dual-browsing-codex-architecture.md)
  - [ADR 0003: Obsidian-Native Markdown and YAML Content Pipeline](./decisions/0003-obsidian-native-markdown-yaml-content-pipeline.md)
- **Comparative Research & Aesthetic Studies:**
  - [Studied Designs & Comparative Research Archive](./studied_designs.md)
  - [D&D Beyond Information Architecture Reference](./references/site/dndbeyond_design_reference.md)
  - [Remedy Aesthetic Study (Control & Alan Wake)](./references/aesthetic/remedy_design_reference.md)
