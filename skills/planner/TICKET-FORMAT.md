# Ticket Format Specification

All ticket files in [design/tickets/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/tickets/) must adhere to this specification.

---

## 1. File Naming Convention

Tickets are saved in the design/tickets/ directory using a zero-padded 4-digit sequential integer and a descriptive kebab-case slug:

```
design/tickets/<NNNN>-<slug>.md
```

Examples:
- 0001-user-auth-session.md
- 0002-landing-pages-command-deck.md
- 0006-codex-keyword-overlay-engine.md

Rules:
- Never prefix tickets with OP or other legacy identifiers.
- Never use subticket letters (such as 02A or 03B). Every ticket is a flat, independent, sequentially numbered file.
- All files are authored strictly in English.

---

## 2. Markdown Ticket Template

Every ticket file must follow this exact markdown structure:

````markdown
# [NNNN]: [Title]

- **Status:** [open | in-progress | blocked | done]
- **Priority:** [P1 | P2 | P3]
- **Domain:** [Domain / Packages affected, e.g., Auth / Backend / UI]
- **Blocked By:** [Comma-separated list of ticket filenames or None]
- **Blocks:** [Tickets waiting on this one or None]

---

## 1. Context & Objective
[1-3 sentences describing the user need, feature scope, and deliverables.]

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: Tables, RPC functions, and RLS policies (if applicable).
- [ ] **Backend Services**: Domain services, Shelf endpoints, and typed exceptions (if applicable).
- [ ] **Shared Contracts**: Pure wire DTOs suffixed with RequestDto or ResponseDto.
- [ ] **Frontend Presentation**: Dedicated widgets (no raw Text), constructor controllers, immutable color tokens, action typography.
- [ ] **Localization (l10n)**: Zero hardcoded strings; keys added to app_en.arb and app_pt.arb.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
````

---

## 3. Status Lifecycle Definitions

- **open**: Backlog item defined; design and implementation not yet started.
- **in-progress**: Active implementation underway across packages.
- **blocked**: Cannot proceed until prerequisite tickets in Blocked By land.
- **done**: Fully implemented, passing all static analysis, tested, and accepted.
