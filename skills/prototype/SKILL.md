---
name: prototype
description: >-
  Rapid UI wireframing, layout comparison, and progressive visual ideation for
  Beyond the Horizon companion views before implementing frontend widgets.
---

# Prototype Skill (to-wireframes)

Collaboratively explore, compare, and refine user interface layouts before coding Flutter widgets. Generate rapid wireframe options in conversation, then escalate to detailed black-and-white visual prototypes only on demand.

---

## Architectural References & Aesthetic Gates

Before presenting layouts, verify spatial and visual constraints against active project documentation:
- **Aesthetic Foundation**: Adhere strictly to the aesthetic philosophy in Section 2 of [design/04-sdd-frontend.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/04-sdd-frontend.md) and cross-universe studies in [design/references/aesthetic/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/references/aesthetic/).
- **Platform Scope (Phase 1)**: Web Desktop (viewports at or above 1024px) and Web Tablet (viewports at or above 768px). Mobile viewports below 768px are deferred to subsequent phases.
- **Reading Measure**: Constrain primary reading columns to 65 to 75 characters (~70ch).
- **Pure UI/UX Scope Boundary**: Prototype sessions and artifacts contain strictly UI/UX details (spatial layouts, measures, conceptual blocks, interaction tables). Prohibit Dart classes, widgets, and state code.

---

## The Two-Stage Process

Prototyping operates in two stages: **Rapid Summarized Ideation** by default, escalating to **Detailed Prototyping** only when explicitly requested.

### 1. Stage 1: Rapid Summarized Ideation (Default)

When invoked (e.g. `/prototype [view-name]`), present **3 to 5 distinct wireframe options** directly in conversation without creating repository files or running heavy image generation:

1. **Compact ASCII Wireframe**: 8 to 15 lines of clean monospaced ASCII showing panel placements and reading columns.
2. **3-Bullet Summary**:
   - **Layout Concept**: Core UX hierarchy and visual flow.
   - **Spatial Balance**: How the 65 to 75ch reading measure and negative space are partitioned.
   - **Ergonomic Trade-offs**: Strengths and trade-offs compared to the other options.
3. **Interactive Selection**: Use the **ask_question** tool with selectable options so the user can quickly pick a direction, combine ideas, or request more variations.

### 2. Stage 2: Detailed Prototyping (On-Demand Escalation Only)

Escalate to Stage 2 **only when the user explicitly asks for details** (e.g., *"give me more details on Option B"*, *"make a detailed prototype"*, or *"deepen this idea"*):

1. **Hand-Drawn B&W Wireframe Image**: Generate a black-and-white sketched wireframe via the **generate_image** tool:
   - **Style**: Hand-drawn minimalist wireframe sketch on plain white paper.
   - **Line Quality**: Clean black ink marker strokes, crisp geometric layout boxes, hand-lettered labels.
   - **Color**: Pure black and white only. Zero color, zero gradients, zero photographic textures.
   - **Framing**: Pure UI viewport (16:9 aspect ratio). Strictly prohibit laptop, tablet, or phone frames.
2. **Author Prototype Specification**:
   - Save the image to **design/prototypes/assets/[view-name]-wireframe.png**.
   - Author **design/prototypes/[view-name].md** following [PROTOTYPE-FORMAT.md](./PROTOTYPE-FORMAT.md).
   - Wrap the image in HTML centering tags:
     ```html
     <p align="center">
       <img src="./assets/filename.png" alt="Alt text" width="700" />
     </p>
     ```
   - Document conceptual UI blocks (indented hierarchy) and a UX interaction & hotkey table.
3. **Link to Ticket**: Reference the new prototype document under Architectural References in the corresponding ticket file in [design/tickets/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/tickets/).

---

## Rules for Prototyping

1. **Zero Premature Files**: Never create files in design/prototypes/ during Stage 1. Keep rapid ideation in conversation.
2. **Aesthetic Authority**: Never invent ad-hoc design systems. Reference [design/04-sdd-frontend.md](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/04-sdd-frontend.md) Section 2 directly.
3. **Black and White Simplicity**: Visual wireframe images must strictly be hand-drawn black-and-white sketches. Do not introduce colored mockups during wireframing.
4. **Clean Markdown & Agents.md**: Prohibit inline backticks in prose and tables. Prohibit raw unclosed angle brackets in prose. Center all images with HTML tags.
