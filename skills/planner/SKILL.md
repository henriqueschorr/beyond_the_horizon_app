---
name: planner
description: >-
  Break a plan, spec, or conversation into tracer-bullet vertical slice tickets, each declaring
  its blocking dependencies, published as local Markdown files in design/tickets/. Based on Matt Pocock's to-tickets.
---

# Planner Skill (to-tickets)

Break an implementation plan, design specification, or conversation into **tickets**: tracer-bullet vertical slices published as individual Markdown files in [design/tickets/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/tickets/), each declaring the tickets that **block** it.

---

## Process

### 1. Gather Context
Work from the current conversation, an implementation plan, or a Software Design Document in [design/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/).
Read relevant SDDs (01-sdd-overview through 04-sdd-frontend) and [design/GLOSSARY.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/GLOSSARY.md) to ensure domain terminology is consistent.
Inspect [design/project_planner.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/project_planner.md) to locate existing milestones and active ticket sequences.

### 2. Identify Prefactoring Opportunities
Scan the codebase before creating feature tickets. Look for opportunities to prefactor existing code to make the implementation straightforward: **"Make the change easy, then make the easy change."**
Prefactoring steps must be sequenced as their own prerequisite tickets rather than buried inside feature tickets.

### 3. Draft Vertical Slices (Tracer Bullets)
Break the work into tracer-bullet tickets following these rules:
- **Vertical, Not Horizontal**: Each ticket cuts through all affected layers (database schema/RLS, backend service, shared DTO, frontend UI, localized strings). Do not create pure backend or pure frontend tickets unless strictly unavoidable.
- **Independently Verifiable**: A completed ticket must be demoable and verifiable on its own.
- **Sized for One Context Window**: Sized so an agent in a fresh session with zero prior conversational context can pick up the ticket and execute it completely.
- **No Subtickets**: Every ticket is a flat, first-class citizen with its own sequential number. Do not create compound child letters (such as 02A, 02B).
- **No OP Prefixes**: Use clean, sequential four-digit numbering: 0001, 0002, etc.
- **Wide Refactors Exception**: For mechanical changes with high blast radius across multiple packages, sequence as expand–contract:
  1. **Expand**: Add the new signature or abstraction alongside the old.
  2. **Migrate**: Move call sites over in batches across sequential tickets.
  3. **Contract**: Remove the old signature once all call sites are migrated.

### 4. Establish Blocking Edges
Assign explicit blocking edges to every ticket:
- **Blocked By**: List the exact filenames of tickets that must land before this ticket can begin.
- **Blocks**: List tickets waiting on this ticket.
- Identify clearly what one ticket needs from another (such as a database table, a shared DTO contract, or an authenticated user session).
- A ticket with no blockers can start immediately.

---

## Mandatory Implementation Plan Gate (Before Writing Anything)

Before creating, publishing, or modifying ANY files in the repository (including tickets in [design/tickets/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/tickets/), [design/project_planner.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/project_planner.md), SDDs, or source code):

1. **Author an Implementation Plan Artifact**: Create an implementation plan markdown artifact (following the **/plan** skill standard) in the agent artifact directory. The artifact must include:
   - Goal description and scope of the planned initiative.
   - Proposed ticket sequence: table detailing ticket numbers, slugs, domains, priorities, and **Blocked By:** dependency rationale.
   - Tracer-bullet breakdown for each ticket across all five layers: Database/Schema, Backend Services, Shared Contracts, Frontend Presentation, and Localization.
   - Exact list of files to be created, modified, or deleted.
   - Verification plan and definition of done.
2. **Request User Feedback**: Publish the artifact with **RequestFeedback: true** and **UserFacing: true**.
3. **Await User OK**: The agent must halt execution and await the user's explicit approval ("ok" or "Proceed" button). Under no circumstances may the agent write ticket files or modify repository files before receiving this approval.

---

## Publishing Local Markdown Tickets

Once the user approves the implementation plan:

1. Scan [design/tickets/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/tickets/) for the highest existing ticket number and increment sequentially (0001, 0002, etc.).
2. Write each ticket file under design/tickets/NNNN-slug.md following [TICKET-FORMAT.md](./TICKET-FORMAT.md).
3. Update the roadmap index in [design/project_planner.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/project_planner.md) with links to the new tickets.

All ticket files must strictly follow [Agents.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/Agents.md) (written in English, zero inline backticks in prose and tables, zero unclosed angle brackets, and zero git commits without explicit command).
