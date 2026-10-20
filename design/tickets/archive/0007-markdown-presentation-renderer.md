# 0007: Markdown Presentation Engine & Layout Renderer

- **Status:** Designed
- **Priority:** P1
- **Domain:** Codex / Frontend
- **Blocked By:** 0005-documentation-storage-catalog.md, 0006-codex-keyword-overlay-engine.md
- **Blocks:** 0008-rulebook-markdown-content.md

---

## 1. Context & Objective
Render rich, beautifully formatted game rules and codex chapters with custom layout composition, species/origin/ability cards, section callouts, image caching, and atmospheric typography.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Database Schema: design/02-sdd-database.md
- Backend Services: design/03-sdd-backend.md
- Frontend UI: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [ ] **Database / Schema**: None (presentation engine consuming storage markdown and keywords).
- [ ] **Backend Services**: None (pure frontend presentation parser and component composer).
- [ ] **Shared Contracts**: Custom syntax parser tokens and AST node definitions.
- [ ] **Frontend Presentation**: MarkdownPresentationRenderer supporting specialized callout boxes, tabular layouts, dice-roll chips, and integrated keyword tooltips.
- [ ] **Localization (l10n)**: Presentation element labels, copy button feedback, and layout toggles in English and Portuguese.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics (flutter analyze / dart analyze).
- [ ] Manual verification check confirmed.
