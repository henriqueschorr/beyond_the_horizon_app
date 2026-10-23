# 0004: Player Home Page & Session Experience

- **Status:** closed
- **Priority:** P1
- **Domain:** Frontend / UI / State
- **Blocked By:** 0003-epigraph-lore-transmissions.md
- **Blocks:** 0005-codex-information-architecture-and-organization.md

---

## 1. Context & Objective
Revisit and refine the authenticated Player Home Page. The view acts as the tactical command hub for authenticated players, featuring a balanced two-column brutalist layout, the monumental home brand mark, middle-left tactical menu, player user session controls, and the embedded lore epigraph box.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Architecture: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md
- Studied Designs: design/studied_designs.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [x] **Layout Architecture**: Balance the two-column grid (Left: HomeBrandMark, PlayerMenu, Session controls; Right: Player greeting and LoreEpigraphBox) with responsive padding and telemetry guards.
- [x] **Tactical Navigation Menu**: Provide actions for Play With Character, Create Character, Codex, and Settings with tactile arrow-hover micro-interactions.
- [x] **User Menu & Session Management**: Dedicated player user controls displaying active session state, callsign telemetry, and clean sign-out routing.
- [x] **Epigraph Integration**: Embed the LoreEpigraphBox with live controller binding, graceful loading/error states, and atmospheric styling.
- [x] **Constructor Dependency Injection**: PlayerHomePage resolves controllers in constructor initializer lists complying strictly with Rule 10 of Agents.md.
- [x] **Localization (l10n)**: Tactical menu options, greeting templates, telemetry subtitles, and session actions localized in English and Portuguese.

---

## 4. Verification & Done Definition
- [x] Static analysis passes with 0 diagnostics.
- [x] Authenticated user sees balanced Player Home Page, player greeting, tactical menu, and reactive lore epigraph.
