# Rulebook 02: Documentation & Markdown Standards

This document defines mandatory documentation, language, and Markdown formatting standards for all AI agents working within this repository.

---

## 1. Communication & Documentation Language

- **English Only**: Always communicate with the user in English.
- **Strict English-Only Policy for Documentation & Artifacts**: All documentation, Software Design Documents (SDDs in design/), architecture notes, specifications, diagrams, roadmaps, task lists, and artifacts must be written strictly and exclusively in English.

---

## 2. Software Design Documents (SDD) Maintenance Policy

- **Mandatory SDD Synchronization**: Always keep the Software Design Documents (located in the design/ directory, including 01-sdd-overview.md, 02-sdd-database.md, 03-sdd-backend.md, 04-sdd-frontend.md, etc.) synchronized and updated whenever introducing architectural changes, renaming services, modifying data models, or altering system behavior.
- **SDD Overview Scope Boundary (No UI Presentation Details in SDD 01)**:
  - The Overview SDD (01-sdd-overview.md) is strictly high-level, architectural, and capability-focused.
  - Never include UI presentation details, font tokens, CSS/styling rules, layout geometry, or specific micro-interactions (such as brand mark letter alignments, hover arrows, button colors, corner bracket glyphs) in 01-sdd-overview.md.
  - All visual design, layout composition, typography tokens, and interaction details belong exclusively in the Frontend SDD (04-sdd-frontend.md).
- **Strict Prohibition of Non-English (pt-BR) Text in SDDs & Documentation**:
  - All Software Design Documents (SDDs), architecture notes, specifications, roadmaps, and technical documentation must be written strictly and exclusively in English.
  - Natural language Portuguese (pt-BR) text, UI labels, button names, section headers, and descriptions are strictly prohibited in SDDs and documentation prose.
  - Always use standard English terms when specifying user interface components, buttons, menus, and layouts in SDDs.
  - The ONLY context where pt-BR or other language codes may appear in documentation is when explicitly referencing localization files (such as app_pt.arb), documenting multi-language support (l10n architecture), or specifying database/API locale seed data parameters (such as locale: 'pt-BR').

---

## 3. Prohibition of Inline Backticks in Documentation

- **Strict Prohibition**: Never wrap words, identifiers, types, file paths, keywords, or text in inline backticks within Markdown documentation files (.md). Use plain text or standard typographic formatting (such as bold or italics) instead. Code blocks with language fences are permitted only for full multiline code snippets, but inline backticks are strictly prohibited in text and tables.

---

## 4. Prohibition of Angle Brackets in Markdown Documentation

- **Strict Prohibition of Angle Brackets in Prose, Tables, and Headings**:
  - Never use raw angle brackets or unclosed pseudo-tags (such as placeholders like [Name], [slug], [id], [T], or arrows with angle brackets) in Markdown documentation files (.md).
  - Markdown parsers and tools like Obsidian interpret angle brackets as raw HTML tags. An unclosed or unrecognized tag causes the parser to treat all subsequent document text as HTML children, breaking headers, bullet points, code blocks, bold text, and tables.
  - **Permitted Substitutes**:
    - For placeholders: Use square brackets **[Name]**, **[slug]**, **[id]**, or braces **{name}**, **{slug}**.
    - For generic type parameters: Use square brackets (such as **serviceLocator[T]()**, **List[String]**, **Future[AuthResponseDto]**) or parentheses.
    - For bidirectional relationships or comparisons: Use unicode arrows (such as **←→**, **⟷**) or dashes **---** instead of angle bracket arrows.
    - Pure multiline fenced code blocks (such as language code blocks) are the only acceptable context where programming language generics using angle brackets may appear, as fenced code blocks are not evaluated as HTML. In prose, tables, lists, and headings, angle brackets are strictly prohibited.

---

## 5. Centered Image Embeds in Documentation

- **Mandatory Centering for All Documentation Images**:
  - All image embeds in Software Design Documents (SDDs) and auxiliary Markdown documentation (.md files) must be centered to ensure clean visual presentation across Obsidian reading mode, live preview, and GitHub.
  - Standard Markdown image syntax aligns left by default, and pipe center extensions are not supported across all renderers.
  - **Required Centering Syntax**: Always wrap image embeds using standard HTML centering tags:
    ```html
    <p align="center">
      <img src="./assets/filename.png" alt="Descriptive Alt Text" />
    </p>
    ```
