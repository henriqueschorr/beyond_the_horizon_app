# 0001: User Creation, Auth & Session Management

- **Status:** Designing
- **Priority:** P1
- **Domain:** Auth / Backend / UI
- **Blocked By:** None
- **Blocks:** 0005-documentation-storage-catalog.md, 0009-character-creation-wizard.md, 0015-email-management.md, 0018-campaign-game-creation.md

---

## 1. Context & Objective
Provide secure player authentication, account registration with email/password, session persistence via Supabase Auth and local secure storage, password recovery, and authenticated JWT handling across client and server.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: User profile table, public.profiles, user metadata triggers, and row-level security (RLS) policies isolating user data.
- [ ] **Backend Services**: Authentication service, token verification middleware, and Shelf endpoints for session refresh and logout.
- [ ] **Shared Contracts**: UserRegistrationRequestDto, UserLoginRequestDto, UserProfileResponseDto, and AuthSessionResponseDto.
- [ ] **Frontend Presentation**: Access console modal, registration form with client-side validation, password reset dialog, and reactive AuthStateController.
- [ ] **Localization (l10n)**: Localized authentication error messages, button labels, and validation hints in app_en.arb and app_pt.arb.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
