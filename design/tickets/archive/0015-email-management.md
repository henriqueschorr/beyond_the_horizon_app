# 0015: E-mail Management & Communications

- **Status:** open
- **Priority:** P1
- **Domain:** Backend / Auth / Email
- **Blocked By:** 0001-user-auth-session.md
- **Blocks:** None

---

## 1. Context & Objective
Implement transactional email workflows: password reset verification links, account confirmation emails, facilitator campaign alerts, and email delivery service integration.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: public.email_logs and delivery status tracking table.
- [ ] **Backend Services**: EmailService adapter (Resend/SendGrid/SMTP), transactional HTML/text templates, and retry queue.
- [ ] **Shared Contracts**: EmailDispatchRequestDto and EmailStatusResponseDto.
- [ ] **Frontend Presentation**: Email verification banner and resent confirmation notification.
- [ ] **Localization (l10n)**: Email subject lines, body copy, and verification status alerts in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
