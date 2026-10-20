---
name: design
description: >-
  A relentless interview to sharpen a plan or design, which maps decisions as a design tree
  and prepares live documentation updates (glossary, SDDs, ADRs). Based on Matt Pocock's grill-with-docs.
---

# Design Skill (grill-with-docs)

Interview the user relentlessly until you reach a shared understanding. Map this as a **design tree**: every decision branches into the decisions that hang off it.

Work the tree in **rounds**. The **frontier** is every decision whose prerequisites are already settled: the questions you can ask *now* without guessing at answers you have not heard yet.

### Rules for the Interview:
1. **The User Makes Every Decision**: Never make decisions on behalf of the user, and never answer your own questions. Present the question with clear options, rationale, and your recommendation clearly labeled as `(Recommended)`.
2. **Interactive Questioning**: Use the interactive `ask_question` tool to present the round's frontier directly to the user as a modal with clear selectable options and a write-in response.
3. **If formatting in text**: Always present numbered questions with distinct selectable options (e.g., Option A, Option B) and clearly designate `(Recommended Option)` so the user can easily select or provide their own direction. Never print an answer that appears as if the agent already settled the decision.
4. **Facts vs Decisions**: When a question turns on a **fact** you can look up in the codebase, do not ask it. Look it up. When a question turns on a **decision**, do not decide it. Ask the user, giving options and your recommendation.

Each round the user answers reshapes the tree: settled decisions push the frontier outward and unblock questions that depended on them. Recompute the frontier and ask the next round.

---

## Architectural Gates to Check in Code

Before asking a question, inspect the monorepo packages to resolve facts:
- **design/**: Read SDDs (01-sdd-overview.md through 04-sdd-frontend.md) and [design/GLOSSARY.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/GLOSSARY.md) to check existing patterns.
- **src/backend/**: Owns database persistence, shelf routes, and external services.
- **src/frontend/**: Owns UI widgets, client controllers (ChangeNotifier), and localized views.
- **src/shared/**: Owns pure wire contracts (*RequestDto, *ResponseDto) with no validation logic.

Always respect the universal rules in [Agents.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/Agents.md).

---

## Mandatory Implementation Plan Gate (Before Writing Anything)

Before creating or modifying ANY files in the repository (including [design/GLOSSARY.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/GLOSSARY.md), ADRs in [design/decisions/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/decisions/), SDDs in [design/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/), or code in [src/](file:///d:/Workspace%20Github/beyond_the_horizon_app/src/)):

1. **Synthesize the Agreed Design**: Summarize the decisions resolved across all interview rounds.
2. **Author an Implementation Plan Artifact**: Create an implementation plan markdown artifact (following the **/plan** skill standard) in the agent artifact directory. The artifact must include:
   - User objective and architectural context.
   - Proposed file changes: explicit list of files to create, modify, or delete.
   - Exact definitions for GLOSSARY entries, ADR drafts, and SDD section diffs.
   - Verification plan and definition of done.
3. **Request User Feedback**: Publish the artifact with **RequestFeedback: true** and **UserFacing: true**.
4. **Await User OK**: The agent must stop execution and await the user's explicit confirmation or "Proceed" action. Under no circumstances may the agent edit or create repository files before this approval is given.

---

## Writing Documentation (The Paper Trail)

Once the user approves the implementation plan:

### 1. The Glossary (design/GLOSSARY.md)
Record or update agreed domain terms in [design/GLOSSARY.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/GLOSSARY.md) following the rules and layout specified in [GLOSSARY-FORMAT.md](./GLOSSARY-FORMAT.md).

### 2. Architecture Decision Records (ADRs in design/decisions/)
When a decision clears the three evaluation gates:
1. It is **hard to reverse**.
2. It is **surprising without context**.
3. It represents a **real trade-off** between viable alternatives.

Write an ADR in [design/decisions/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/decisions/) immediately, following the format in [ADR-FORMAT.md](./ADR-FORMAT.md).

### 3. SDD Updates
Update the respective SDD in [design/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/):
- 01-sdd-overview.md for capabilities, platforms, and high-level architecture.
- 02-sdd-database.md for schemas, tables, and RLS policies.
- 03-sdd-backend.md for endpoints, services, repositories, and typed exceptions.
- 04-sdd-frontend.md for controllers, pages, widgets, and design system tokens.

All documentation must follow [Agents.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/Agents.md) (written in English, zero inline backticks in prose and tables, zero unclosed angle brackets, centered images).

---

## Ending the Session

The interview ends when the frontier is empty: every branch has reached a leaf. Present the implementation plan artifact for the user's ok, and only apply the agreed documentation changes after confirmation.
