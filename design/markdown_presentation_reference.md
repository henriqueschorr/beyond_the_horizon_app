# Markdown Presentation & Layout Reference

*This document defines the presentation syntax and layout conventions for Documentation Markdown pages rendered by the Beyond the Horizon App frontend. Formally tracked for upcoming implementation.*

---

## 1. Page-Level Layouts (public.documentation_layout)

Each documentation page specifies a layout in its base database record, dictating the top-level Flutter screen composition:

| Layout Identifier | Target Use Case | Presentation Structure |
| :--- | :--- | :--- |
| documentation | General rulebook chapters, mechanics, lore | Standard reading view with floating table of contents and responsive reading width. |
| species | Playable species dossiers (Evo'raz, Symbion, Synthetic, Human) | Classified operative record: biological taxonomy, anatomical sketches, racial traits cards. |
| origin | Background origins | Narrative provenance dossier, starting equipment loadouts, background proficiencies. |
| path | Career & tactical paths | Skill trees, tactical archetype matrix, advancement paths. |
| abilities | Ability catalogs & power cards | Interactive card gallery, action costs, trigger conditions, keyword hover links. |

---

## 2. Section-Level Presentation Blocks

Authors can define specialized section styling directly in Markdown using Obsidian-compatible callout syntax:

```markdown
> [!SECTION|surface=dark_concrete|border=glow]
> ## Protocolo de Ressonância: Alerta Vermelho
> Durante um combate tático, os monitores de telemetria entram em alerta de alta voltagem.
```

The Flutter markdown renderer ElementBuilder extracts the callout parameters and wraps the section in the corresponding design system surface and container.

---

## 3. Storage Image Resolution

Images stored in Supabase Storage (documentation bucket) are embedded using relative or custom URI schemes:

```markdown
![Diagrama de Dano](storage://documentation/images/diagrams/damage_flow.webp)
```

The frontend imageBuilder automatically resolves storage://documentation/... to the Supabase CDN URL, caching assets and providing interactive lightbox zoom.

---

## 4. Atmospheric Text Formatting

- **Monumental Typography Headers**: Uppercase architectural headers inspired by *Control* (CENTRAL EXECUTIVE).
- **Redaction Bars**: Native Unicode blocks (████████) that can reveal declassified lore on tap or clearance.
- **Administrative Stamps**: Typewriter badges ([OPERATIVO ATIVO], [CLASSIFICADO]).
