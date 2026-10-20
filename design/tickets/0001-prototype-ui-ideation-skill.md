# 0001: Prototype UI Ideation Skill

- **Status:** done
- **Priority:** P1 (Prerequisite)
- **Domain:** Tooling / Workflow
- **Blocked By:** None
- **Blocks:** 0004-codex-markdown-presentation-engine.md, 0005-codex-chapter-reader-and-sticky-toc.md, 0006-codex-compendium-filterable-databases.md, 0007-codex-slide-over-drawer-and-hover-tooltips.md

---

## 1. Context & Objective
Establish a specialized agent skill (skills/prototype/SKILL.md) that facilitates interactive ASCII wireframing, layout experimentation, and UI design ideation between the agent and user prior to coding frontend presentation widgets.

---

## 2. Architectural References
- SDD Overview: design/01-sdd-overview.md
- Frontend Design System: design/04-sdd-frontend.md
- Domain Glossary: design/GLOSSARY.md
- Studied Designs Reference: design/studied_designs.md

---

## 3. Tracer-Bullet Scope & Acceptance Criteria
- [x] **Skill Definition**: Author skills/prototype/SKILL.md following the Antigravity skill structure with frontmatter name, description, and interactive wireframing workflows.
- [x] **Configuration Registry**: Register the prototype skill in .agents/skills.json alongside design and planner.
- [x] **Wireframing Playbook**: Document conventions for terminal ASCII layouts, typography sizing rules, desktop split-pane measures, and interactive feedback loops.
- [x] **Verification**: Verify that the skill can be invoked seamlessly to guide upcoming UI design tickets.

---

## 4. Verification & Done Definition
- [ ] Static analysis passes with 0 errors and 0 diagnostics.
- [ ] Skill file passes validation and is discoverable by the agent environment.
