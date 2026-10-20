# Agent Skills Environment

This directory houses modular, procedural playbooks (skills) for AI coding agents operating within this repository, inspired by Matt Pocock's skills framework.

---

## 1. Architecture: Skills vs. Agents.md

In this repository, agent intelligence is divided into two distinct, complementary layers:

| Layer | File / Directory | Nature | Role |
| :--- | :--- | :--- | :--- |
| **Rules & Guardrails** | `Agents.md` (root) | Always Active / Contextual | Sets inviolable laws: Git safety, OWASP compliance, coding constraints, and documentation syntax. |
| **Procedural Skills** | `skills/<skill_name>/` | On-Demand (Progressive Disclosure) | Multi-step recipes, interactive interview loops, runbooks, and task playbooks. |

Skills operate strictly within the guardrails defined in `Agents.md`. A skill does not redefine rules; it references and enforces `Agents.md` while orchestrating a complex workflow.

---

## 2. Standard Monorepo Structure

All skills in this repository assume the standard monorepo folder structure:

```
├── .agents/                  # Agent configurations and skill discovery (skills.json)
├── Agents.md                 # Universal agent constitution & coding rules
├── design/                   # Software Design Documents (SDDs) and Architecture Decisions
│   ├── GLOSSARY.md           # Ubiquitous domain language and terminology
│   ├── decisions/            # Architecture Decision Records (ADRs)
│   ├── 01-sdd-overview.md
│   ├── 02-sdd-database.md
│   ├── 03-sdd-backend.md
│   └── 04-sdd-frontend.md
├── skills/                   # Modular agent skills
│   ├── design/               # Interactive design grilling & live documentation sync
│   └── planner/              # to-tickets tracer-bullet breakdown & project planning skill
└── src/                      # Source code packages
    ├── backend/              # Domain services, server routes, database persistence
    ├── frontend/             # Client UI, reactive controllers, design system
    └── shared/               # Pure wire contracts, Request/Response DTOs, enums
```

---

## 3. Available Skills

### design (skills/design/SKILL.md)
- **Trigger**: When proposing a new feature, planning an architectural refactor, or updating Software Design Documents.
- **Workflow**: Relentless design-tree interview (grill-with-docs) testing assumptions against monorepo boundaries, state architecture, and security. Requires authoring an implementation plan artifact for user approval before writing any documentation or code into the repository.
- **References**:
  - skills/design/GLOSSARY-FORMAT.md
  - skills/design/ADR-FORMAT.md

### planner (skills/planner/SKILL.md)
- **Trigger**: When breaking an implementation plan, design specification, or conversation into actionable development tickets.
- **Workflow**: Tracer-bullet vertical slice decomposition (to-tickets) evaluating prefactoring, cutting across all layers, declaring explicit blocking dependencies, and publishing sequentially numbered local Markdown tickets in design/tickets/. Requires authoring an implementation plan artifact for user approval before writing any ticket files to disk.
- **References**:
  - skills/planner/TICKET-FORMAT.md

---

## 4. How to Add a New Skill

1. Create a directory: `skills/<skill-name>/`.
2. Add a `SKILL.md` file with YAML frontmatter:
   ```yaml
   ---
   name: your-skill-name
   description: >-
     A concise description of what the skill does and when the agent should use it.
   ---
   ```
3. Add any reference format or template files in the skill directory and link to them relatively from `SKILL.md`.
4. The Antigravity agent will automatically discover the new skill via `.agents/skills.json`.
