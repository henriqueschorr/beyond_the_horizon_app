# 0024: Homebrew & Custom Content Creator

- **Status:** open
- **Priority:** P3
- **Domain:** Codex / Backend
- **Blocked By:** 0005-documentation-storage-catalog.md, 0018-campaign-game-creation.md
- **Blocks:** None

---

## 1. Context & Objective
Enable Facilitators to create custom abilities, homebrew species, bespoke equipment, and original threats scoped to their campaigns with automated schema validation.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.homebrew_items, campaign scope association, and custom content JSON schemas.
- [ ] **Backend Services**: HomebrewContentService, schema validator, and permission enforcement.
- [ ] **Shared Contracts**: HomebrewItemRequestDto, HomebrewCatalogResponseDto, and ContentValidationDto.
- [ ] **Frontend Presentation**: Homebrew authoring studio, live preview pane, and campaign content selector.
- [ ] **Localization (l10n)**: Studio tooltips, validation warnings, and content category tabs in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
