# 0004: Rapid UI Wireframing and Progressive Prototyping Pipeline

- **Status:** accepted
- **Date:** 2026-10-21

## Context & Decision
Frontend screen design in Beyond the Horizon requires balancing strict Brutalist Sci-Fi aesthetics with ergonomic usability (such as the 65 to 75ch reading measure and non-destructive slide-over drawers). Generating heavy visual assets or complete specification files up front slows down early discovery and prevents rapid divergent exploration.

We decided to establish a progressive two-stage prototyping pipeline:
1. **Stage 1 (Rapid Summarized Ideation)**: Default mode when invoking the prototype skill. The agent presents 3 to 5 distinct layout options in conversation, each formatted with a compact ASCII wireframe and a 3-bullet summary (layout philosophy, spatial balance/70ch measure, and trade-offs) for quick interactive selection via ask_question. Zero repository files are created.
2. **Stage 2 (Detailed Prototyping on Demand)**: Triggered only when the user explicitly requests more detail. Generates a hand-drawn black-and-white visual wireframe via generate_image (black ink on white canvas, zero color, brutalist boxes, no device frames) and authors a dedicated document in design/prototypes/[view-name].md with assets in design/prototypes/assets/.
3. **Strict UI/UX Content Scope**: Both stages are strictly confined to UI/UX and wireframing details (spatial layout, conceptual component blocks, and UX interaction tables), completely omitting Dart code, widgets, or implementation syntax.

## Consequences
- Positive: Enables immediate comparison across 3 to 5 options without cognitive or file clutter. Ensures detailed documents and image assets are generated only for validated directions.
- Trade-offs: Requires an explicit request to escalate from quick options to a published prototype document in design/prototypes/.
