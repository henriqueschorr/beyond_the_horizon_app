# Domain Glossary

This document defines canonical domain terminology for the project. When discussing features, designing APIs, or writing code, use these established terms.

## 1. App Domain (Platform & Architecture)

**Admin**:
A user account possessing system-wide maintenance privileges and configuration authority across platform instances.
_Avoid_: Superuser, root, operator

**Codex**:
The digital rules and reference compendium platform for Beyond the Horizon, accessible with zero authentication.
_Avoid_: Wiki, docs, manual

**Content-First Schema Derivation**:
The architectural practice of authoring, formatting, and calibrating manuscript chapters in modular Markdown files prior to designing relational database tables, ensuring the schema accurately reflects document hierarchies and navigation nodes.
_Avoid_: Schema-first authoring, speculative modeling, hardcoded seeds

**Entity Dossier**:
A structured tactical record summarizing the mechanical attributes, traits, and lore of a specific game entity or hazard.
_Avoid_: Card, item page, statblock

**Facilitator**:
The narrative director and game master who facilitates session play, mediates rules disputes, and orchestrates scenario hazards.
_Avoid_: Game master, GM, dungeon master, DM, host

**Game Rules**:
The filterable, sortable compendium databases categorized by entity type for quick tactical lookup during active play.
_Avoid_: Database, tables, list view

**Geometric Frame Silhouette**:
The pure vector CustomPainter framing style (document, news, poem, quote, transmission) that uniquely identifies an epigraph narrative type without text labels.
_Avoid_: Border style, card outline, frame label

**Omnibar**:
The global quick-jump search bar (activated via keyboard shortcut or header) providing instant autocomplete across all chapters, rules, and compendium entities.
_Avoid_: Search box, finder, spotlight

**Page Presentation**:
A dedicated, tailored Flutter reading page layout template designed for a specific content archetype (such as a Species dossier, Origin folio, or Path progression track), establishing unique visual hierarchy, tabular sidebars, and thematic staging.
_Avoid_: Generic markdown page, standard view, article template

**Player**:
An authenticated participant who creates characters, manages inventory, and takes part in game sessions.
_Avoid_: Operative, user, agent, account holder

**Slide-Over Drawer**:
A non-destructive side panel that slides out from the right viewport to display an entity dossier or rule definition without displacing the active reading position.
_Avoid_: Modal, popup, dialog

**Sources**:
The linear, chapter-by-chapter rulebook reader mirroring physical manuscript reading, complete with a sticky table of contents and section anchors.
_Avoid_: Book mode, reader, chapters

**UI Wireframe Prototype**:
A pure UI/UX structural layout specification and hand-drawn black-and-white visual wireframe persisted in design/prototypes/ prior to implementing frontend code.
_Avoid_: Mockup, widget draft, screen stub

## 2. Game Domain (In-Universe & System Mechanics)

**Ability**:
A specialized tactical action, active technique, or passive modification available to characters through their training or cybernetics.
_Avoid_: Skill, power, feat

**Ability Card**:
A specialized, tactile Flutter visual container widget designed to render a discrete tactical action, active technique, or passive modification embedded within the linear reading flow.
_Avoid_: Statblock, ability block, flat text block

**Condition**:
A persistent physical or environmental status effect (such as Suffocation, Bleeding, or Radiation) that impairs character performance or vitality.
_Avoid_: Status, debuff, affliction

**Injury**:
A severe physical trauma or bodily impairment sustained when damage exceeds a character's protective threshold.
_Avoid_: Wound, critical damage

**Lore Epigraph**:
An evocative in-universe narrative excerpt, distress signal, classified government folio, or news bulletin rendered on the Command Deck with specialized geometric framing.
_Avoid_: Lore snippet, quote card, transmission box

**Origin**:
The cultural, planetary, or environmental background that established a character's initial proficiencies and worldview.
_Avoid_: Background, upbringing, home planet

**Panic**:
An acute behavioral breakdown triggered when stress or terrifying stimuli shatter a character's composure.
_Avoid_: Fear check, freakout, madness

**Path**:
The professional archetype, training discipline, and progression track that shapes a character's core capabilities, traits, and unlocked abilities.
_Avoid_: Class, job, role

**Species**:
The biological or synthetic lineage of a character, dictating baseline physiological traits, sensory ranges, and environmental tolerances.
_Avoid_: Race, ancestry, lineage

**Stress**:
The psychological and neurological pressure accumulated through terror, isolation, and cognitive overload.
_Avoid_: Sanity, tension, strain

**Trauma**:
A lasting psychological, neurological, or psychosomatic scar resulting from extreme stress or mental rupture.
_Avoid_: Mental illness, madness scar

**Void**:
The silent, lethal vacuum and cosmic emptiness beyond planetary perimeters, containing unmapped anomalous phenomena.
_Avoid_: Space, outer space, dark
