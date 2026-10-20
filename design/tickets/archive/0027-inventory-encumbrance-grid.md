# 0027: Slot-Based Inventory & Encumbrance Grid

- **Status:** open
- **Priority:** P3
- **Domain:** Characters / Inventory
- **Blocked By:** 0010-character-play-sheet.md
- **Blocks:** None

---

## 1. Context & Objective
Deliver visual slot-based grid inventory management calculating weight, encumbrance penalties, ammo clips, and biological symbiont integration.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.character_inventory_slots table with grid coordinate columns.
- [ ] **Backend Services**: InventoryService, encumbrance penalty calculation, and item equip verification.
- [ ] **Shared Contracts**: InventoryGridResponseDto, ItemMoveRequestDto, and EncumbranceStatusDto.
- [ ] **Frontend Presentation**: Drag-and-drop inventory grid, encumbrance capacity meter, and item detail card.
- [ ] **Localization (l10n)**: Slot labels, encumbrance penalty warnings, and weight units in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
