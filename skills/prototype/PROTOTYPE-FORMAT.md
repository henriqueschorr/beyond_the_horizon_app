# UI Prototype Document Format Specification

All prototype documents in [design/prototypes/](file:///d:/Workspace%20Github/beyond_the_horizon_app/design/prototypes/) must adhere to this specification.

---

## 1. File Naming & Directory Convention

Prototypes are created exclusively during Stage 2 (On-Demand Escalation) and saved in the design/prototypes/ directory:

```
design/prototypes/[view-name].md
```

Associated hand-drawn wireframe images are saved in:

```
design/prototypes/assets/[view-name]-wireframe.png
```

Examples:
- design/prototypes/0002-landing-page.md
- design/prototypes/0007-codex-reader.md

Rules:
- Strictly English only.
- Prohibit inline backticks in prose and tables.
- Prohibit raw unclosed angle brackets in text.
- Center all image embeds using `<p align="center"><img src="..." /></p>`.
- **Pure UI/UX Scope**: Contain zero Dart code, zero class names, and zero implementation syntax.

---

## 2. Markdown Prototype Template

Every prototype file must follow this exact markdown structure:

````markdown
# UI Prototype: [NNNN] [View Name]

- **Ticket Reference:** [design/tickets/NNNN-slug.md](../tickets/NNNN-slug.md)
- **Target Platform:** Web Desktop (>=1024px) / Web Tablet (>=768px)
- **Aesthetic References:** design/04-sdd-frontend.md (Section 2), design/references/aesthetic/
- **Status:** [draft | aligned | approved]

---

## 1. Context & UX Objective
[1-3 sentences describing the screen purpose, primary user workflows, and ergonomic goals.]

---

## 2. Visual Drawn Wireframe

<p align="center">
  <img src="./assets/NNNN-slug-wireframe.png" alt="[View Name] Black and White Hand-Drawn Wireframe" width="700" />
</p>

*Figure 1: Black-and-white minimalist drawn-style wireframe illustrating spatial partitioning, primary reading corridor, and telemetry zones.*

---

## 3. Structural ASCII Layout & Spatial Measures

```
+-----------------------------------------------------------------------------------+
| TOP BAR: [Logo Brand Mark]               [Omnibar Jump: /]      [Status Telemetry]|
+-------------------+-------------------------------------------+-------------------+
| TOC / FILTER RAIL | CENTRAL READING CORRIDOR (~70ch measure)  | SLIDE-OVER DRAWER |
|                   |                                           | (Non-destructive) |
| - Chapter 01      | MONUMENTAL HEADER                         |                   |
| - Chapter 02      | Softened reading prose column...          | - Entity Dossier  |
| - Chapter 03      | Utilitarian paragraph blocks...           | - Rule Definition |
|                   |                                           |                   |
+-------------------+-------------------------------------------+-------------------+
| FOOTER: [Previous Chapter]                             [Next Chapter]             |
+-----------------------------------------------------------------------------------+
```

- **Left Rail Width:** 280px (fixed or collapsible accordion).
- **Central Reading Measure:** 65 to 75 characters (~70ch) centered with generous horizontal breathing gutters.
- **Right Slide-Over Drawer:** 420px width, sliding out without displacing reading scroll position.

---

## 4. Conceptual UI Block Hierarchy
[Indented outline grouping UI components by functional name and UX role, with zero code details]

- **Shell Layout**
  - **Telemetry Header**: Brand mark, quick-jump omnibar anchor, session telemetry indicator.
  - **Navigation Rail**: Collapsible table of contents, search filter pills, chapter status markers.
  - **Reading Viewport**: Monumental section header, breadcrumb trail, calibrated body text column, pagination dock.
  - **Auxiliary Overlay Deck**: Slide-over entity dossier drawer, keyboard shortcut cheatsheet popover.

---

## 5. UX Interaction & Affordances Table

| Trigger Zone | User Action | Viewport Transition / Response | Keyboard Hotkey |
| :--- | :--- | :--- | :--- |
| **Omnibar Button** | Click / Tap | Opens centered quick-jump autocomplete modal | / or Cmd+K / Ctrl+K |
| **TOC Section Link** | Click / Tap | Smooth scrolls viewport to selected section anchor | None |
| **Entity Keyword** | Click / Tap | Opens non-destructive Slide-Over Drawer on right | None |
| **Drawer Close Actuator** | Click / Tap | Dismisses Slide-Over Drawer and restores focus | Esc |
| **Noise Toggle** | Click / Tap | Toggles analog procedural grain surface pass | None |
````
