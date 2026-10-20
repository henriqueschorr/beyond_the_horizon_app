---
name: prototype
description: >-
  Interactive UI wireframing, layout experimentation, and visual ideation for
  Beyond the Horizon companion views before implementing frontend widgets.
---

# Prototype Skill (UI Ideation & Wireframing)

This skill guides the agent and user in collaboratively designing, wireframing, and reviewing user interface layouts before writing Flutter production widgets.

---

## 1. Core Principles

1. **Ideate Before Coding:** Never dive straight into implementing complex layouts or widget classes without first aligning on an ASCII wireframe, layout structure, or visual mockup.
2. **Brutalist Sci-Fi Design System:** Adhere strictly to the aesthetic foundation in design/04-sdd-frontend.md and design/studied_designs.md:
   - Off-black void canvas (#101214) and recessed well (#0C0E10).
   - Titanium white display headings (#F0ECE1) and softened body prose (#C8C4B8).
   - High-voltage single-channel spot accent: Cassette 90 Vibrant Orange (#FE6403).
   - Strict solid color immutability (prohibit alpha blending, withOpacity, or transparent text).
   - Optimal reading column measure: 65 to 75 characters (~70ch).
3. **Ergonomic Context Preservation:** Prioritize non-destructive side drawers (Slide-Over Drawer pattern) and quick-lookup overlays (Omnibar) over intrusive full-page navigations.

---

## 2. Interactive Prototyping Workflow

Follow this iterative loop when prototyping new views:

### Step 1: ASCII Wireframing
Present a clear, high-density ASCII layout showing:
- Global navigation & top bars.
- Sidebar Table of Contents / Filter trees.
- Main content pane dimensions and text columns.
- Slide-over drawers or detail cards.
- Interactive control buttons and hotkeys.

### Step 2: High-Fidelity Visual Mockup (Optional)
When visual texture, typography weight, or color mood needs validation, use the generate_image tool to generate a crisp desktop web UI mockup (aspect ratio 16:9, interface only, no laptop or phone device frames).

### Step 3: Interactive Alignment with ask_question
Present layout alternatives, component positions, and information densities to the user using the ask_question tool, allowing them to select their preferred configuration or provide direct feedback.

### Step 4: Component Decomposition & SDD Alignment
Once the wireframe is approved:
- Decompose the prototype into presentational StatelessWidget classes.
- Define the ChangeNotifier controller state (holding resolved models, loading booleans, error strings).
- Ensure all clickable actions use semantic typography tokens (Action typography).
