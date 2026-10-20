# 0004: Atmospheric Graphic Staging (Character / Monster Artwork)

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / Artwork
- **Blocked By:** 0002-landing-pages-command-deck.md
- **Blocks:** None

---

## 1. Context & Objective
Stage large character and cosmic monster illustrations in the bottom-right quadrant of the Command Deck, featuring procedural alpha/toner stipple dissolve into darkBgCanvas (#101214) underneath epigraph frames.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: Artwork metadata table for asset registration, artist credits, and dimensions.
- [ ] **Backend Services**: Storage bucket configuration for high-resolution webp artwork assets.
- [ ] **Shared Contracts**: ArtworkAssetDto with URL, dimensions, and atmospheric tint properties.
- [ ] **Frontend Presentation**: AtmosphericGraphicStagingWidget with custom shader or procedural opacity mask dissolve, layered behind epigraph framing against the cosmic starfield canvas.
- [ ] **Localization (l10n)**: Artwork captions and artist attribution labels in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
