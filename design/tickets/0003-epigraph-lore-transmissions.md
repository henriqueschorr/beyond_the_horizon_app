# 0003: Lore Epigraphs and Archival Transmissions Engine

- **Status:** closed
- **Priority:** P1
- **Domain:** Database / Backend / UI Primitives
- **Blocked By:** 0002-landing-page-auth-and-guest-access.md
- **Blocks:** 0004-player-home-command-deck.md

---

## 1. Context & Objective
Revisit and solidify the worldbuilding lore epigraph system across all layers. Epigraphs serve atmospheric lore snippets, archival transmissions, and in-universe news clippings with randomized database selection and specialized geometric framing widgets across the application, especially on the Player Home Command Deck.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md
- ADR 0006: design/decisions/0006-lore-epigraphs-and-archival-transmissions-engine.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [x] **Database / Schema**: Verify public.lore_epigraphs, translations, epigraph_type enum, 1,200-char content limit, and randomized query RPC function with appropriate public read RLS and pt-BR fallback.
- [x] **Backend Services**: LoreEpigraphRepository and service returning pure DTOs with typed exceptions (LoreEpigraphException) and standard machine error codes.
- [x] **Shared Contracts**: Pure serialization DTOs for epigraph summary, detail, create, update, and GetRandomLoreEpigraphRequestDto.
- [x] **Frontend Presentation**: Polish the four geometric framing styles (vertical folio caps, double ticker rules, asymmetric corner brackets, 4-corner reticles) with right-aligned source attribution, dynamic A4 width (360px for documents vs 420px for others), minimal top-right rotating refresh actuator, and in-universe signal loss error boundary.
- [x] **State Management**: Ensure LoreEpigraphController holds resolved state via ChangeNotifier without raw Future builders and provides refresh() re-scan capability.
- [x] **Localization (l10n)**: Transmission tooltips, signal interruption markers, and retry actions localized in app_en.arb, app_pt.arb, and strongly typed in AppLocalizations.

---

## 4. Verification & Done Definition
- [x] Static analysis passes with 0 diagnostics.
- [x] Database query returns valid random epigraphs with correct framing styles rendered cleanly in the UI.
