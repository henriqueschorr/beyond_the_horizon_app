# The Entropic Void: Visual Design Report of *Death in Space RPG*
*An exhaustive analysis of Scandinavian Minimal-Brutalism, Color Theory, Typography, and Gritty Textures in Stockholm Kartell's Dying-Universe Sci-Fi RPG.*

---

## Executive Summary

Created by **Christian Plogfors** and **Carl Niblaeus** (under the renowned **Stockholm Kartell** collective and published by **Free League Publishing**), *Death in Space* presents an austere, blue-collar vision of a dying cosmos. Set in the crumbling, resource-starved Tenebris system, its visual design rejects glossy space-opera wonder in favor of **Workmanlike Scandinavian Minimalism**, **Junk-Tech Brutalism**, and **High-Contrast Void Immersion**.

The visual language is characterized by:
1. **The Inverted Cosmos**: Printed nearly entirely as white, silver, and neon on pitch-black spreads, reflecting the cold existential vacuum of space.
2. **Workmanlike Restraint**: Unlike the chaotic kinetic maximalism of sister-game *Mörk Borg*, *Death in Space* utilizes disciplined Swiss grid layouts, vast negative space, and understated technical elegance.
3. **Salvaged Tactility**: Gritty stippling, xerox halftones, frayed wiring diagrams, and weathered hull schematics.

---

## 1. Color Palette: High-Contrast Void & Neon Punctuation

While *Death in Space* is famous for its inverted, pitch-black spreads, **the background is intentionally NOT pure digital black (`#000000`)**. 

### A. The Page Background Reality: The Textured Off-Black Void
1. **Why Pure `#000000` is Avoided**:
   * Pure `#000000` on digital screens causes harsh chromatic fringing (visual halation) and extreme eye fatigue over extended reading sessions. In physical CMYK offset printing, pure K100 ink without underprinting can look dull, while over-saturated 4-color black can smear and bleed on paper.
2. **The Actual Sampled Background Formulation**:
   * Direct pixel sampling of the official PDF (including the front cover) reveals the background is **Warm Charcoal / Rich Off-Black** (<span style="display:inline-block;width:12px;height:12px;background:#231F20;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#231F20` / RGB 35, 31, 32). This corresponds to standard editorial "Rich Black" (the sRGB rendering of CMYK 0, 0, 0, 100 with standard printer profiles).
   * Crucially, the background is **never flat vector black**: it is infused with a fine layer of **photocopier dust, toner noise, and subtle paper grain**, giving the PDF and physical page the tactile sensation of a salvaged, photocopied flight manual.
3. **Typographic Softening & Cover Accents**:
   * Radiating vector elements and body text utilize stark white (<span style="display:inline-block;width:12px;height:12px;background:#FFFFFF;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#FFFFFF`) or softened **Bleached Bone Grey** (<span style="display:inline-block;width:12px;height:12px;background:#EDEDED;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#EDEDED`).
   * The iconic cover title and falling astronaut accent are rendered in visceral **Astronaut Crimson** (<span style="display:inline-block;width:12px;height:12px;background:#C6252A;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#C6252A` / RGB 198, 37, 42).

### B. The Tenebris System Color Palette

| Swatch | Color Name | HEX Code | In-Game & Layout Usage |
|---|---|---|---|
| <span style="display:inline-block;width:18px;height:18px;background:#231F20;border:1px solid #777;border-radius:3px;"></span> | **Tenebris Void Rich Black / Charcoal** | `#231F20` | Exact sampled PDF background; rich off-black that prevents digital halation. |
| <span style="display:inline-block;width:18px;height:18px;background:#E8E6E7;border:1px solid #777;border-radius:3px;"></span> | **Chalk Bone / Subtitle Off-White** | `#E8E6E7` | Sampled cover subtitle text (*"A science fiction..."*) and secondary informational labels. |
| <span style="display:inline-block;width:18px;height:18px;background:#EDEDED;border:1px solid #777;border-radius:3px;"></span> | **Bleached Bone Grey (Body Text)** | `#EDEDED` | Softened interior paragraph text (~85–90% luminance); eliminates halation/glare. |
| <span style="display:inline-block;width:18px;height:18px;background:#FFFFFF;border:1px solid #777;border-radius:3px;"></span> | **Stark Optical White (Display Only)** | `#FFFFFF` | Radiating geometric lines, primary title contrast, lunar phase icons (not for reading). |
| <span style="display:inline-block;width:18px;height:18px;background:#C6252A;border:1px solid #777;border-radius:3px;"></span> | **Astronaut / Tether Crimson** | `#C6252A` | Front cover title, falling astronaut silhouette, critical life-support failures. |
| <span style="display:inline-block;width:18px;height:18px;background:#DFFF00;border:1px solid #777;border-radius:3px;"></span> | **Acid Yellow / Neon Sulphur** | `#DFFF00` | Chapter navigation markers, generator power indicators, critical success callouts. |
| <span style="display:inline-block;width:18px;height:18px;background:#FF5E13;border:1px solid #777;border-radius:3px;"></span> | **Scrap Rust Orange** | `#FF5E13` | Hull breach warnings, combat damage, salvaged machinery ratings, warning borders. |
| <span style="display:inline-block;width:18px;height:18px;background:#8A4FFF;border:1px solid #777;border-radius:3px;"></span> | **Cosmic Void Violet** | `#8A4FFF` | Void corruption manifestations, cosmic anomaly tables, mysterious artifact tags. |
| <span style="display:inline-block;width:18px;height:18px;background:#353B45;border:1px solid #777;border-radius:3px;"></span> | **Junk-Steel Slate** | `#353B45` | Sub-level compartment floorplans, secondary table fills, inactive ship modules. |

---

## 2. Typographic Identity

The typography of *Death in Space* strikes a balance between **heavy industrial display titles** and **crystalline Swiss functionalism**.

```
    ____  ______ ___   ______ __  __   ____ _   __   _____ ____  ___   ______ ______
   / __ \/ ____//   | /_  __// / / /  /  _// | / /  / ___// __ \/   | / ____// ____/
  / / / / __/  / /| |  / /  / /_/ /   / / /  |/ /   \__ \/ /_/ / /| |/ /    / __/   
 / /_/ / /___ / ___ | / /  / __  /  _/ / / /|  /   ___/ / ____/ ___ / /___ / /___   
/_____/_____//_/  |_|/_/  /_/ /_/  /___//_/ |_/   /____/_/   /_/  |_\____//_____/   
   [    H  E  A  V  Y    G  R  O  T  E  S  Q  U  E    /    S  W  I  S  S    ]
```

### A. Display & Title Typography
* **Primary Headers**: **Heavy Grotesque / Sans-Serif Block Capitals** (inspired by **Neue Haas Grotesk Black**, **Compacta**, and **Druk Condensed**).
  * Rendered in all-caps, tightly tracked, with massive optical scale contrasting against generous negative space.
  * Replaces decorative sci-fi tropes with raw, brutalist architectural weight.
* **Secondary Chapter Title Treatment**: Heavy, unadorned sans-serif letters filled with neon spot colors (<span style="display:inline-block;width:12px;height:12px;background:#DFFF00;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#DFFF00` or <span style="display:inline-block;width:12px;height:12px;background:#FF5E13;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#FF5E13`), creating immediate visual anchors on deep black spreads.

### B. Body Copy & Typographic Color Hierarchy
* **Why `#FFFFFF` is Avoided for Reading**:
  * Setting continuous paragraphs in pure `#FFFFFF` against an off-black background produces an optical effect called **visual halation / irradiation**, where white letterforms appear to blur, vibrate, and bleed into surrounding shadows.
  * To combat this, Stockholm Kartell strictly reserves pure **Stark White** (<span style="display:inline-block;width:12px;height:12px;background:#FFFFFF;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#FFFFFF`) for bold graphic artwork (the cover sunburst) and primary metadata headers.
* **The Body Text Tone: Bleached Bone / Chalk Grey**:
  * Body copy, character descriptions, and subtitle text (such as the cover subtitle *"A science fiction roleplaying game"*) are dialed back to a softened **Chalk Bone / Pale Ash** (<span style="display:inline-block;width:12px;height:12px;background:#E8E6E7;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#E8E6E7` to `<span style="display:inline-block;width:12px;height:12px;background:#EDEDED;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#EDEDED` / RGB 232, 230, 231).
  * This ~10% drop in luminance preserves razor-sharp legibility while completely eliminating chromatic glare during gameplay sessions.
* **Core Body Typeface**: **Suisse Int'l** / **Helvetica Neue / Univers**.
  * Set with generous line-height (leading) and pristine kerning. Unlike traditional dense sci-fi manuals, *Death in Space* utilizes quiet, calm columns of text that feel clinical, isolated, and readable.
* **Tables, Dice Charts & Ship Telemetry**: **Space Mono** / **Letter Gothic / Monospace Regular**.
  * Used for modular ship upgrades, d66 loot tables, void corruption triggers, and bridge operational readouts.

---

## 3. Textures, Art Style & Materiality

*Death in Space* channels the aesthetic of a salvaged, photocopied ship technical manual that has survived decades in the greasy hold of an orbital mining vessel.

```
[ STOCKHOLM KARTELL MINIMALISM ]            [ JUNK-TECH INDUSTRIALISM ]
--------------------------------------------------------------------------
Total Solid Black Negative Space       ⟷    Welded Patch Seams & Scratched Metal
High-Contrast Stark Line Illustrations ⟷    Grimy Xerox Halftone Dot Screens
Fine Hairline Geometric Gridlines      ⟷    Loose Hand-Drawn Electrical Schematics
Sparse Monospaced Telemetry Tables     ⟷    Cosmic Dust Noise & Film Stippling
Monochrome Silhouette Spot Art         ⟷    Iridescent Void Distortion Artifacts
```

### A. The Junk-Tech Aesthetic
* **The "Used Universe" at the End of Time**:
  * Technology in *Death in Space* is not shiny or sleek; it is jury-rigged, cannibalized from abandoned wrecks, and held together by friction tape and weld beads.
  * Illustrations feature mechanical parts with rough cross-hatching, gritty stippling, and broken silhouette lines.

### B. Optical & Print Artifacts
* **Halftone Screens & Stipple Shading**:
  * Shading is achieved using oversized, screen-printed halftone dots and photocopy dust, reinforcing the feeling of physical print media produced in a decaying star system.
* **Void Corruptions**:
  * Where the "Void" bleeds into reality, page layouts distort: fine hairline grids fragment, vector lines tear, and purple ink overlays bleed across pristine typographic margins.

---

## 4. Geometric Forms, Silhouettes & Spatial Anatomy

The visual architecture of *Death in Space* relies on **Cosmic Minimalism, Stark Monolithic Blocks, and Celestial Orbital Geometry**:

### A. The Cosmic Circle & Planetary Orbits (The Dying Universe)
* **Planetary Discs in the Void**: Celestial bodies are rendered as stark, unadorned circular discs (either solid white, void black with white stroke, or half-eclipsed) suspended in vast black space.
* **Concentric Orbital Trajectory Lines**: 1px razor-thin ellipses and concentric circular rings tracing the orbital paths of crumbling space stations (the Iron Ring) around dead planets.
* **Lunar Phase Arcs & Horizon Curves**: Thin circular arcs carving through dark backgrounds to delineate astronomical sectors and radiation belts.

### B. Monolithic Rectangles & Negative Space
* **The Void Pillar**: Text and tables are composed into tall, slender rectangular monolithic columns flanked by immense margins of rich black negative space.
* **Asymmetrical Border Enclosures**: Rectangular data panels often omit one side (e.g., top and left border present, bottom and right open to the vacuum), evoking incomplete, salvaged hull architecture.

### C. Technical Crosshairs & Alignment Marks
* **Coordinate Crosshairs (`+`)**: Tiny, hairline registration crosses placed at the four corners of panels, tables, and celestial schematics.
* **Triangular Hazard Glyphs**: Inverted equilateral triangles indicating Void corruption, critical malfunctions, and structural strain.

---

## 5. Synthesis: Design Rules for *Death in Space*-Inspired Projects

1. **Color Rule**: Make Void Black (<span style="display:inline-block;width:12px;height:12px;background:#0A0A0B;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#0A0A0B`) the absolute foundation. Use bone white (<span style="display:inline-block;width:12px;height:12px;background:#EDEDED;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#EDEDED`) for information clarity, and choose *one* electric neon accent per section—either Acid Yellow (<span style="display:inline-block;width:12px;height:12px;background:#DFFF00;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#DFFF00`), Scrap Orange (<span style="display:inline-block;width:12px;height:12px;background:#FF5E13;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#FF5E13`), or Void Violet (<span style="display:inline-block;width:12px;height:12px;background:#8A4FFF;border:1px solid #777;border-radius:2px;vertical-align:middle;margin-right:4px;"></span>`#8A4FFF`).
2. **Typography Rule**: Champion disciplined Scandinavian brutalism. Use massive, monolithic sans-serifs (**Neue Haas Grotesk**, **Druk**) for headers and pristine Swiss sans (**Suisse Int'l**, **Univers**) with airy line-spacing for body text. Use monospace for dice tables.
3. **Form & Geometry Rule**: Juxtapose **monolithic rectangular text blocks** against **stark planetary circles, orbital trajectory rings, and corner crosshairs (`+`)**. Let celestial circular silhouettes anchor interactive focal points.
4. **Texture Rule**: Combine crisp vector wireframes with grimy analog distress—heavy halftone dot textures, photocopier toner dust, and jagged silhouette line work.
