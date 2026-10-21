# 0013: Codex Integration and End-to-End Routing

- **Status:** open
- **Priority:** P1
- **Domain:** Frontend / Routing
- **Blocked By:** 0008-codex-presentation-engine-and-reader.md, 0012-codex-omnibar-and-local-preferences.md
- **Blocks:** None

---

## 1. Context & Objective
Wire the existing CODEX buttons on the revisited Landing Page access console and Player Home menu to navigate directly to the new /codex reader route, while verifying that Authentication and Lore Epigraph features remain intact and non-blocking.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Architecture: design/04-sdd-frontend.md
- ADR 0001: design/decisions/0001-codex-first-scope-and-phasing.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Landing Page Wiring**: Connect onOpenCodex callback in landing_page.dart so clicking CODEX in the logged-out access console navigates to /codex.
- [ ] **Player Home Wiring**: Update player_home_page.dart so clicking CODEX navigates to /codex instead of /blank.
- [ ] **Routing Definitions**: Register /codex, /codex/sources/:slug, and /codex/rules/:category in the app router (app_router.dart).
- [ ] **Non-Blocking Verification**: Ensure authentication remains completely optional and does not prevent users from accessing or reading the Codex.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 diagnostics.
- [ ] Manual verification confirms clicking CODEX from both logged-out and logged-in views routes seamlessly to /codex.
