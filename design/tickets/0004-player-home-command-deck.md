# 0004: Player Home Command Deck & Session Experience

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / UI / State
- **Blocked By:** 0003-epigraph-lore-transmissions.md
- **Blocks:** 0005-codex-database-schema-and-toc.md

---

## 1. Context & Objective
Revisit and refine the authenticated Player Home (Command Deck). The view acts as the tactical command hub for authenticated players, featuring a balanced two-column brutalist layout, the monumental home brand mark, middle-left tactical menu, player user menu / session controls, and the embedded lore epigraph box.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Architecture: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md
- Studied Designs: design/studied_designs.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Layout Architecture**: Balance the two-column grid (Left: HomeBrandMark, PlayerMenu, Session controls; Right: Player greeting and LoreEpigraphBox) with responsive padding and telemetry guards.
- [ ] **Tactical Navigation Menu**: Provide actions for Play With Character, Create Character, Codex, and Settings with tactile arrow-hover micro-interactions.
- [ ] **User Menu & Session Management**: Dedicated player user controls displaying active session state, callsign telemetry, and clean sign-out routing.
- [ ] **Epigraph Integration**: Embed the LoreEpigraphBox with live controller binding, graceful loading/error states, and atmospheric styling.
- [ ] **Constructor Dependency Injection**: PlayerHomePage resolves controllers in constructor initializer lists complying strictly with Rule 10 of Agents.md.
- [ ] **Localization (l10n)**: Tactical menu options, greeting templates, telemetry subtitles, and session actions localized in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics.
- [ ] Authenticated user sees balanced Command Deck, player greeting, tactical menu, and reactive lore epigraph.
