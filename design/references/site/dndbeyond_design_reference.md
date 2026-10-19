# Web Platform UX & Presentation Report: *D&D Beyond*
*An exhaustive analysis of Web Information Architecture, Digital Character Sheet Ergonomics, Slide-Over Drawers, Tooltip Engines, and Design Tokens in the World's Leading Tabletop Web Application.*

---

## Executive Summary: The Web Application Revolution

**D&D Beyond** (`https://www.dndbeyond.com`) revolutionized the tabletop roleplaying industry upon its launch in 2017 (originally developed by Curse/Fandom and later acquired by Wizards of the Coast / Hasbro). While traditional PDF digital readers merely replicate physical paper pages on screens—forcing awkward pinching, zooming, and scrolling—D&D Beyond redesigned the roleplaying experience into a **dynamic, relational, interactive web ecosystem**.

At its core, D&D Beyond solves the central friction of tabletop gaming: **cognitive load and retrieval latency during active sessions**. By integrating an interconnected rules database directly into dynamic character sheets, step-by-step builders, and combat trackers, it reduces a 3-minute rule lookup in a physical book to a **100-millisecond hover or slide-over drawer click**.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                 THE CORE DESIGN AXIOMS OF D&D BEYOND                    │
├─────────────────────────────────────────────────────────────────────────┤
│ 1. Non-Destructive Context (The Slide-Over Drawer): Users never leave   │
│    their active context (character sheet, encounter, reading pane).     │
│    Inspecting an item, spell, or rule slides out a side-drawer pane.    │
│ 2. The Living Compendium (Hover Tooltips): Every entity (monster,       │
│    spell, condition, magic item) is automatically hyperlinked with an   │
│    instant hover preview card.                                          │
│ 3. Action-Economy Partitioning: Character sheets organize mechanics by  │
│    tactical action types (Actions, Bonus Actions, Reactions, Other)     │
│    rather than alphabetical skill lists.                                │
│ 4. Progressive Disclosure (The Stepper Builder): Complex character     │
│    creation involving 50+ choices is staged into a 6-step linear wizard.│
│ 5. Diegetic-Modern Hybrid Aesthetics: Modern responsive web components  │
│    (cards, tabs, sliders) are skinned with digital parchment tones and  │
│    editorial fantasy typography (Tiamat, Roboto, D&D Crimson #E40712).  │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 1. Information Architecture & Macro Navigation

D&D Beyond organizes its web platform into four primary functional pillars, accessible through an overarching global mega-menu:

```
[ GLOBAL NAVIGATION: MEGA-MENU ]
├── COLLECTIONS  ──> My Characters, My Campaigns, Encounters, Combat Tracker, Maps
├── SOURCES      ──> Books & Compendiums (Core Rules, Sourcebooks, Adventures)
├── GAME RULES   ──> Filterable Databases (Spells, Monsters, Magic Items, Classes, Feats)
└── TOOLS        ──> Character Builder, Encounter Builder, Dice Roller, Homebrew Studio
```

### A. The Three Operational States of a Player / DM
1. **The Study State (Compendium Reader)**: High-comfort, editorial reading mode for learning lore, rules, and adventure chapters.
2. **The Creation State (Character Builder)**: Guided, linear wizard mode minimizing cognitive friction through constrained choices.
3. **The Play State (Digital Character Sheet & Combat Tracker)**: High-density, real-time tactical dashboard designed for split-second decisions and live state mutations (HP, spell slots, conditions).

---

## 2. The Compendium & Rules Reader UX

The digital rules reader (`/sources/dnd/...`) translates dense print sourcebooks into responsive web documentation:

```
┌─────────────────┬───────────────────────────────────────────────────────┐
│ [ TOC SIDEBAR ] │ [ BREADCRUMB: Sources > Basic Rules > Chapter 9 ]     │
│                 │                                                       │
│ ▼ Chapter 9:    │ CHAPTER 9: COMBAT                                     │
│   Combat        │ In a combat encounter, characters face off against... │
│   • Order       │                                                       │
│   • Movement    │ ┌─ PARCHMENT CALLOUT BOX ───────────────────────────┐ │
│   • Actions     │ │ COMBAT STEP-BY-STEP                               │ │
│   • Making an   │ │ 1. Determine surprise.                            │ │
│     Attack      │ │ 2. Establish positions.                           │ │
│   • Damage      │ │ 3. Roll initiative (Clickable: [1d20+DEX]).       │ │
│                 │ └───────────────────────────────────────────────────┘ │
│ ► Chapter 10:   │                                                       │
│   Spellcasting  │ MAKING AN ATTACK                                      │
│                 │ Whether you strike with a [longsword] or cast a       │
│                 │ [fireball] (Hover triggers instant card preview)...   │
└─────────────────┴───────────────────────────────────────────────────────┘
```

### A. Anatomical Features of the Rules Reader
1. **Sticky Collapsible Table of Contents (TOC)**:
   - Fixed to the left viewport on desktop (`width: 280px`).
   - Accordion-style nested tree hierarchy allowing instant jumping across 15+ sub-sections.
   - Highlights the user's active reading position dynamically based on scroll depth.
2. **Breadcrumb Anchoring**:
   - Persistent top breadcrumb (`Sources > Free Rules > Chapter 9: Combat > Making an Attack`) prevents disorientation within massive compendiums.
3. **Digital Parchment Callout Boxes (`p-callout`)**:
   - Important operational summaries, GM tips, and variant rules are pulled out into **warm-parchment containers** (`#F9F6EF` fill, `#C3BC9E` border) with subtle drop shadows and distressed flourishes, echoing traditional physical rulebooks.
4. **Interactive Inline Dice Triggers**:
   - Formulas in prose (such as `1d20 + 5` or `8d6 fire damage`) are wrapped in interactive triggers (`.dice-roller`). Clicking the formula fires a 3D simulated dice throw across the screen and logs the result.

---

## 3. The Cross-Reference & Hover Tooltip Engine

The greatest ergonomic achievement of D&D Beyond is its **Entity Recognition & Tooltip System**. Rather than requiring users to search an external index or flip to an appendix, entities are semantically parsed and styled:

```
┌────────────────────────────────────────────────────────┐
│ Whether you strike with a longsword or cast [fireball] │
│                                             │          │
│      ┌─ FLOATING TOOLTIP PREVIEW ───────────┴────────┐ │
│      │ FIREBALL                                      │ │
│      │ 3rd-Level Evocation                           │ │
│      │ Casting Time: 1 action                        │ │
│      │ Range: 150 feet (20-foot-radius sphere)       │ │
│      │ Components: V, S, M (a tiny ball of bat       │ │
│      │             guano and sulfur)                 │ │
│      │ Duration: Instantaneous                       │ │
│      │ A bright streak flashes from your finger...   │ │
│      │ Damage: 8d6 fire damage (DEX save half).      │ │
│      └───────────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────┘
```

### A. Entity Categorization & Color Codes
D&D Beyond assigns distinct thematic colors to every rule category across tooltips, tags, and message logs:

| Entity Type | Swatch | HEX Code | CSS Variable | Usage & Interaction |
|---|---|---|---|---|
| **Monster** | <span style="display:inline-block;width:16px;height:16px;background:#C60000;border-radius:2px;"></span> | `#C60000` | `--ttui_color-reference--monster` | Red text link; hover reveals AC, HP, Speed, CR, and statblock. |
| **Spell** | <span style="display:inline-block;width:16px;height:16px;background:#C364E7;border-radius:2px;"></span> | `#C364E7` | `--ttui_color-reference--spell` | Violet text link; hover reveals level, school, components, effect. |
| **Magic Item** | <span style="display:inline-block;width:16px;height:16px;background:#41A9F2;border-radius:2px;"></span> | `#41A9F2` | `--ttui_color-reference--magicItem` | Sky blue link; hover reveals rarity, attunement, properties. |
| **Skill / Check** | <span style="display:inline-block;width:16px;height:16px;background:#7EBE15;border-radius:2px;"></span> | `#7EBE15` | `--ttui_color-reference--skill` | Lime green link; hover reveals ability score anchor and usage. |
| **Character / Condition** | <span style="display:inline-block;width:16px;height:16px;background:#EE8600;border-radius:2px;"></span> | `#EE8600` | `--ttui_color-reference--character` | Orange link; hover reveals condition rules (Blinded, Prone, Stunned). |

---

## 4. The Digital Character Sheet Architecture

The D&D Beyond Character Sheet (`/characters/...`) is the most widely analyzed interface in digital TTRPG history. It rejects paper's static constraint by treating the character sheet as an **interactive operational dashboard**.

```
┌─────────────────────────────────────────────────────────────────────────┐
│ [PORTRAIT] THORIN OAKENSHIELD  | Fighter 5 (Battle Master) | Dwarf       │
│ HP: [ 45 / 45 ] (+0 Temp)   [DAMAGE / HEAL]   Hit Dice: [ 5d10 ]        │
│ AC: 18  |  INIT: +1  |  SPEED: 25ft  |  PROF: +3  |  INSPIRATION: [●]    │
├──────────────┬──────────────────────────────────────────────────────────┤
│ STR: 18 (+4) │ [ACTIONS]  [SPELLS]  [INVENTORY]  [FEATURES]  [NOTES]    │
│ DEX: 12 (+1) ├──────────────────────────────────────────────────────────┤
│ CON: 16 (+3) │ ACTION ECONOMY SUB-TABS:                                 │
│ INT: 10 (+0) │ [ALL]  [ATTACK]  [ACTION]  [BONUS ACTION]  [REACTION]     │
│ WIS: 13 (+1) │                                                          │
│ CHA:  8 (-1) │ ⚔️ GREATAXE                                              │
│              │    Range: 5 ft  |  To Hit: +7  |  Damage: 1d12 + 4 S     │
│ SAVES &      │                                                          │
│ SKILLS LIST  │ 🛡️ SECOND WIND (Bonus Action)                            │
│ Athletics +7 │    Regain 1d10 + 5 HP once per short/long rest. [USE]    │
│ Perception +4│                                                          │
│ Survival +4  │ ⚡ ACTION SURGE (Action)                                 │
│              │    Take one additional action on your turn. [ 1 / 1 ]    │
└──────────────┴──────────────────────────────────────────────────────────┘
```

### A. The Master Anatomy
1. **The Sticky Vitals Header**:
   - Positioned permanently at the top. Houses Character Avatar, Class/Level, Health Bar, Hit Dice, Temporary HP, Death Saves, AC, Initiative, Speed, and Inspiration.
   - Quick Health Calculator: clicking `[DAMAGE / HEAL]` opens a mini calculator where typing `14` and clicking `Damage` automatically subtracts from temp HP first, then current HP, with animated visual feedback.
   - Rest Engines: Dedicated buttons for `Short Rest` and `Long Rest` automate hit dice recovery, spell slot restoration, and once-per-rest feature resets.
2. **Left Column: Ability Scores & Skill Ledger**:
   - Six prominent ability score boxes (STR, DEX, CON, INT, WIS, CHA) displaying large modifiers (`+4`) and smaller base scores (`18`).
   - Integrated skill list with filled pip indicators: empty circle (untrained), single dot (proficient), double dot / star (expertise). Clicking any skill automatically rolls the d20 + modifier into the digital dice log.
3. **Right Area: Multi-Tab Functional Partitioning**:
   - **Actions Tab**: Categorized strictly by action economy (*Action, Bonus Action, Reaction, Other*). Instead of hunting across three pages for what a character can do on their turn, every valid combat action is compiled into a single scannable list.
   - **Spells Tab**: Organizes spells by level (Cantrips through 9th Level). Each level has interactive checkboxes/pips for tracking expended spell slots.
   - **Inventory Tab**: Tracks currency (CP, SP, EP, GP, PP), equipped weapons/armor, weight capacity/encumbrance, and three diamond attunement slots (`Attuned: 2/3`).
   - **Features & Traits Tab**: Hierarchical breakdown of Class Features, Subclass Features, Species Traits, Feats, and Background perks.
   - **Extras Tab**: Dedicated sub-sheets for animal companions, familiars, wild shapes, sidekicks, and vehicles.

---

## 5. The Slide-Over Drawer ("Non-Destructive Context")

The single most influential UX design pattern pioneered by D&D Beyond is the **Slide-Over Sidebar Drawer (`sidebar-pane`)**.

```
┌──────────────────────────────────────┬──────────────────────────────────┐
│ [ ACTIVE CHARACTER SHEET ]           │ [ SLIDE-OVER DRAWER (380px) ]    │
│                                      │                                  │
│ User clicks:                         │ ⚔️ GREATAXE                      │
│ ⚔️ GREATAXE                         │ Martial Melee Weapon             │
│                                      │ Damage: 1d12 Slashing            │
│ (Sheet dims slightly in background,  │ Properties: Heavy, Two-Handed    │
│  but remains completely visible      │ Weight: 7 lbs | Cost: 30 gp      │
│  and accessible)                     │                                  │
│                                      │ DESCRIPTION:                     │
│                                      │ A massive, double-bladed axe...  │
│                                      │                                  │
│                                      │ [ CUSTOMIZE WEAPON ]             │
│                                      │ Bonus to Hit: [+0 ]              │
│                                      │ Damage Bonus: [+0 ]              │
│                                      │                                  │
│                                      │ [ 🎲 ROLL TO HIT: +7 ]           │
│                                      │ [ 🎲 ROLL DAMAGE: 1d12+4 ]       │
│                                      │ [ ✕ CLOSE DRAWER ]               │
└──────────────────────────────────────┴──────────────────────────────────┘
```

### Why the Slide-Over Drawer is Revolutionary:
1. **Zero Context Loss**: In traditional web apps, clicking an item navigates to a new URL (`/items/greataxe`), destroying the user's active game state. D&D Beyond's drawer slides in over the right third of the screen without unloading the sheet.
2. **Inline Modification**: Players can customize the weapon (e.g., adding `+1` from a magic oil, changing damage types) directly inside the drawer and see their sheet numbers update in real time.
3. **Direct Action Triggers**: The drawer contains its own action buttons (`[Cast Spell]`, `[Roll Damage]`), allowing the player to inspect and execute in one fluid motion.

---

## 6. The Step-by-Step Character Builder (Progressive Disclosure)

Character creation in a d20 system requires resolving more than 50 interdependent variables (race, class, subclass, ability scores, proficiencies, equipment, spells, backstory). D&D Beyond manages this through a **Linear Stepper Wizard**:

```
[ STEPPER NAVIGATION BAR ]
(1) HOME  ──>  (2) SPECIES  ──>  (3) CLASS  ──>  (4) ABILITIES  ──>  (5) DESCRIPTION  ──>  (6) EQUIPMENT
```

1. **Step 1: Home (Game Configuration)**: Setting rules toggles (Advancement type: Milestone vs XP, Hit Point type: Fixed vs Manual, Feats & Multiclassing allowed, Sources enabled).
2. **Step 2: Species / Race**: Filtering species options; selecting a species immediately expands sub-species and racial trait choices.
3. **Step 3: Class**: Selecting class reveals Hit Die, core proficiencies, and subclass decision gates. Subclass features are locked until the required class level is chosen.
4. **Step 4: Abilities**: Offers three distinct input methods: *Standard Array, Point Buy (with a dynamic 27-point calculator), or Manual/Rolling*. Racial bonuses are automatically added with calculated final totals.
5. **Step 5: Description**: Personality traits, ideals, bonds, flaws, alignment, background, deity.
6. **Step 6: Equipment**: Binary choice between *Starting Equipment* (packaged by class/background) or *Starting Gold* (shopping cart mode).
7. **Progressive Disclosure**: Choices at each step filter the available options in subsequent steps, preventing illegal character builds and eliminating decision paralysis.

---

## 7. Filterable Database Engines (Facet Filtering)

The compendium databases (`/spells`, `/monsters`, `/magic-items`) handle thousands of entries through an ultra-fast **Facet Filtering UX**:

```
┌────────────────────────────────────────────────────────────────────────┐
│ SEARCH SPELLS: [ Fire                              ] [🔍 SEARCH]       │
├────────────────────────────────────────────────────────────────────────┤
│ CLASS:     [x] Wizard   [ ] Cleric   [ ] Druid   [x] Sorcerer          │
│ LEVEL:     [ ] Cantrip  [ ] 1st  [ ] 2nd  [x] 3rd  [ ] 4th  [ ] 5th    │
│ SCHOOL:    [x] Evocation   [ ] Necromancy   [ ] Abjuration             │
│ TAGS:      [x] Concentration   [ ] Ritual   [ ] Material Component     │
├────────────────────────────────────────────────────────────────────────┤
│ NAME             LEVEL   SCHOOL        CASTING TIME    RANGE    CONC?  │
├────────────────────────────────────────────────────────────────────────┤
│ Fireball         3rd     Evocation     1 Action        150 ft   No     │
│ Flame Arrows     3rd     Transmutation 1 Action        Touch    Yes    │
└────────────────────────────────────────────────────────────────────────┘
```

- **Instant URL State Synchronization**: Filter parameters are serialized directly into query parameters (`?filter-class=wizard&filter-level=3&filter-school=evocation`), enabling bookmarkable, shareable search results.
- **Responsive View Switching**: Users can toggle between **Table View** (compact tabular data for fast scanning) and **Card View** (expanded cards with full descriptions).

---

## 8. Design System, Typography & Color Tokens (TTUI / Lexicon)

D&D Beyond utilizes a sophisticated proprietary design system named **TTUI (Tabletop UI) / Lexicon**, built with CSS variables layered in modern `@layer theme` specifications:

### A. The Core Color Spectrum

| Swatch | Token Name | HEX / Value | In-App Meaning & Role |
|---|---|---|---|
| <span style="display:inline-block;width:18px;height:18px;background:#E40712;border:1px solid #777;border-radius:3px;"></span> | `--ttui_red-500` | `#E40712` | **The Signature D&D Red**: Active tabs, focus underlines, critical attack badges, brand logos. |
| <span style="display:inline-block;width:18px;height:18px;background:#374045;border:1px solid #777;border-radius:3px;"></span> | `--ttui_color-primary--main` | `#374045` | Slate grey workhorse; button borders, secondary headers, dark UI outlines. |
| <span style="display:inline-block;width:18px;height:18px;background:#12181C;border:1px solid #777;border-radius:3px;"></span> | `--ttui_color-primary--dark` | `#12181C` | Inky deep charcoal; primary text ink, dark navigation bars. |
| <span style="display:inline-block;width:18px;height:18px;background:#242527;border:1px solid #777;border-radius:3px;"></span> | `--ttui_common-500` | `#242527` | Dark mode container backgrounds, character sheet outer framing. |
| <span style="display:inline-block;width:18px;height:18px;background:#FFFFFF;border:1px solid #777;border-radius:3px;"></span> | `--ttui_color-bg--paper` | `#FFFFFF` | Pure white background for high-contrast card interiors. |
| <span style="display:inline-block;width:18px;height:18px;background:#F4F5F5;border:1px solid #777;border-radius:3px;"></span> | `--ttui_color-bg--default` | `#F4F5F5` | Muted cool grey page canvas background. |
| <span style="display:inline-block;width:18px;height:18px;background:#F9F6EF;border:1px solid #777;border-radius:3px;"></span> | `--ttui_color-bg--pane` | `#F9F6EF` | Warm digital parchment tone for rule callout panels. |
| <span style="display:inline-block;width:18px;height:18px;background:#EEE8DB;border:1px solid #777;border-radius:3px;"></span> | `--ttui_color-bg--scroll` | `#EEE8DB` | Deep aged parchment for blockquotes and historical epigraphs. |

### B. Magic Item Rarity Matrix
D&D Beyond standardizes item rarity badges across inventory and compendiums using an MMO-style visual spectrum:

| Rarity Tier | Swatch | HEX Code | CSS Variable |
|---|---|---|---|
| **Common** | <span style="display:inline-block;width:14px;height:14px;background:#666666;border-radius:2px;"></span> | `#666666` | `--ttui_color-rarity--common` |
| **Uncommon** | <span style="display:inline-block;width:14px;height:14px;background:#7EBE15;border-radius:2px;"></span> | `#7EBE15` | `--ttui_color-rarity--uncommon` |
| **Rare** | <span style="display:inline-block;width:14px;height:14px;background:#41A9F2;border-radius:2px;"></span> | `#41A9F2` | `--ttui_color-rarity--rare` |
| **Very Rare**| <span style="display:inline-block;width:14px;height:14px;background:#C364E7;border-radius:2px;"></span> | `#C364E7` | `--ttui_color-rarity--veryRare` |
| **Legendary**| <span style="display:inline-block;width:14px;height:14px;background:#FFB62A;border-radius:2px;"></span> | `#FFB62A` | `--ttui_color-rarity--legendary` |
| **Artifact** | <span style="display:inline-block;width:14px;height:14px;background:#F77558;border-radius:2px;"></span> | `#F77558` | `--ttui_color-rarity--artifact` |

### C. Typography System

```css
:root {
  --ttui_font-tiamat: "Tiamat", serif;
  --ttui_font-tiamat-condensed: "Tiamat Condensed SC";
  --ttui_font-majesty: "Majesty", serif;
  --ttui_font-roboto: Roboto, Helvetica, sans-serif;
  --ttui_font-roboto-condensed: "Roboto Condensed", Helvetica, sans-serif;
}
```

1. **Tiamat (Serif)**: Bespoke editorial fantasy typeface designed specifically for D&D Beyond. Used in Medium, Semi-Bold, Bold, and Italic for compendium titles, chapter headers, and spell names.
2. **Tiamat Condensed SC**: All-caps, small-cap condensed serif used for monster statblock attributes (STR, DEX, CON), saving throw tags, and table labels.
3. **Majesty (Serif)**: Monumental, high-display serif with sharp neoclassical serifs and extreme contrast. Used for book titles, marketing splash screens, and cover logos.
4. **Roboto & Roboto Condensed (Sans-Serif)**: The Google-developed neo-grotesque sans-serif. Used for all core interface controls: navigation links, button text, numerical modifiers, hit points, and body copy.
5. **Roboto Flex**: Variable font delivering responsive font-weight morphing on mobile viewports.

---

## 9. Key Takeaways & Actionable Codex UX Strategies for Web Applications

When designing a modern web-based codex or interactive tabletop companion, D&D Beyond establishes the following universal best practices:

1. **The Slide-Over Drawer is Mandatory for Deep Inspection**:
   - Never force a user to navigate away from their active sheet, battle map, or reading page just to inspect an item or ability. Implement a sliding side-drawer that renders full rules inline.
2. **Semantic Hover Tooltips for All Recognized Entities**:
   - Parse all rich text content for recognized entities (rules, conditions, items, spells, units) and wrap them with instantaneous hover tooltips.
3. **Action Economy Partitioning Over Alphabetical Listings**:
   - In tactical games, players think in terms of *“What can I do right now with my bonus action or reaction?”* Always provide an action-economy view that filters abilities by trigger type.
4. **Stateful Facet Filtering with Shareable URLs**:
   - Ensure every search filter (tags, levels, categories) serializes directly to URL search parameters so players and GMs can share exact filtered views with one click.
5. **Progressive Disclosure in Creation Wizards**:
   - Break multi-variable character generation into discrete, gated steps. Show only the options valid for the current selection to prevent choice paralysis.
6. **Dual-Layered Design System (Theme Layering)**:
   - Use CSS custom property layers (like TTUI) that separate semantic tokens (`--color-reference-monster`, `--color-rarity-rare`) from raw hex values, allowing effortless theming and dark/light mode transitions.
