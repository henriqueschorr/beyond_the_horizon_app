# 0018: Campaign & One-Shot Game Creation

- **Status:** open
- **Priority:** P2
- **Domain:** Games / Backend / UI
- **Blocked By:** 0001-user-auth-session.md, 0010-character-play-sheet.md
- **Blocks:** 0019-live-session-lobby.md, 0024-homebrew-content-creator.md

---

## 1. Context & Objective
Deliver the Facilitator game creation suite: campaign titles, premises, scheduling metadata, player roster management, and shareable player invite codes/links.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.campaigns, public.campaign_members, and public.campaign_invites tables with RLS policies.
- [ ] **Backend Services**: CampaignService, invite token generator, and roster assignment endpoints.
- [ ] **Shared Contracts**: CampaignCreateRequestDto, CampaignDetailResponseDto, and CampaignInviteDto.
- [ ] **Frontend Presentation**: Campaign creation wizard, invite link generator card, and campaign settings tab.
- [ ] **Localization (l10n)**: Campaign setup prompts, invite copy messages, and roster status tags in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
