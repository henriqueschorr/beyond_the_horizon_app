# 0003: Lore Epigraphs & Archival Transmissions Catalog

- **Status:** In Progress
- **Priority:** P1
- **Domain:** Database / Backend / UI
- **Blocked By:** None
- **Blocks:** None

---

## 1. Context & Objective
Store and serve atmospheric worldbuilding lore snippets, archival transmissions, and in-universe news clippings with randomized database selection and specialized geometric framing widgets on the Command Deck.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.lore_epigraphs and public.lore_epigraph_translations tables, public.epigraph_type enum (document, news, poem, quote, transmission), and public.get_random_lore_epigraph RPC function.
- [ ] **Backend Services**: LoreEpigraphRepository with full CRUD capabilities, randomized query endpoint, and seeded pt-BR content.
- [ ] **Shared Contracts**: LoreEpigraphSummaryResponseDto, LoreEpigraphDetailResponseDto, and EpigraphTypeEnum.
- [ ] **Frontend Presentation**: Randomized epigraph widget with four pure geometric framing styles (vertical folio caps, double ticker rules, asymmetric corner brackets, 4-corner reticles) with right-aligned source outside the frame.
- [ ] **Localization (l10n)**: Category labels, narrative markers ([REDACTED] / [OMITIDO]), and attribution labels in app_en.arb and app_pt.arb.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
