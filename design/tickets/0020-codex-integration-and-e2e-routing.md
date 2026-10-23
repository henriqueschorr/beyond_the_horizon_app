# 0020: Codex Integration and End-to-End Routing

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / Routing
- **Blocked By:** 0011-codex-presentation-engine-and-core-rules-reader.md, 0019-codex-omnibar-and-local-preferences.md
- **Blocks:** None

---

## 1. Context & Objective
Wire the public Landing Page and authenticated Player Home Command Deck CODEX navigation buttons to /codex, verify frictionless unauthenticated access, validate seamless switching between Sources and Game Rules, and confirm zero regression across authentication and epigraph services.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Architecture: design/04-sdd-frontend.md
- ADR 0001: design/decisions/0001-codex-first-scope-and-phasing.md
- ADR 0002: design/decisions/0002-dual-browsing-codex-architecture.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Declarative Route Integration**: Wire GoRouter routes for /codex, /codex/sources/:slug, and /codex/rules/:category with full deep-linking support.
- [ ] **Portal & Home Navigation**: Connect CODEX buttons on the Landing Page and Player Home tactical menu directly to /codex.
- [ ] **Frictionless Guest Access**: Verify unauthenticated visitors can explore all public chapters without redirect loops or auth barriers.
- [ ] **Dual Browsing Switcher**: Implement persistent header toggle allowing immediate switching between linear Sources reader and Game Rules compendium.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics (flutter analyze / dart analyze).
- [ ] End-to-end user navigation verified from public portal through Codex reading and back.
