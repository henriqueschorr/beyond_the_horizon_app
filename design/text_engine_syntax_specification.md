# Text Engine Syntax & Document Presentation Specification

- **Document Title:** Text Engine Syntax & Document Presentation Specification
- **Project:** Beyond the Horizon - Digital Companion & Rules Platform
- **Module Identifier:** OP-03B
- **Author:** Henrique Schorr
- **Last Updated:** 2026-10-18
- **Canonical Architecture References:** [01-sdd-overview.md](./01-sdd-overview.md), [02-sdd-database.md](./02-sdd-database.md), [03-sdd-backend.md](./03-sdd-backend.md), [04-sdd-frontend.md](./04-sdd-frontend.md), [compendium_keywords_plan.md](./compendium_keywords_plan.md), [project_planner.md](./project_planner.md)

---

## 1. Scope & Architectural Purpose

This document establishes the official authoring syntax, formatting grammar, and layout conventions for the Beyond the Horizon text engine (OP-03B). The text engine functions as the universal typographic presentation foundation across the primary application domains:

1. **Short-Form Lore Epigraphs (Command Deck):** Brief narrative quotes, telemetry interceptions, classified government folios, colony news ticker bulletins, and poetry fragments displayed on the Authenticated Player Home Page.
2. **Long-Form Documentation Markdowns (Codex):** Extensive rulebook chapters, character species dossiers, background origin records, tactical path trees, and equipment catalogs delivered via the Codex documentation storage catalog.

Both content domains are authored using standardized Markdown with inline and block-level extensions defined in this specification, ensuring unified visual rendering, high aesthetic fidelity, and intuitive authoring across rulebooks, lore dossiers, and game references. (Future integration: Keyword hover tooltips and micro-overlays in OP-03A will build upon this foundation in a subsequent phase.)

---

## 2. Core Typographic Tokens & Font Scale Hierarchy

The Beyond the Horizon design system employs three primary typefaces, each assigned a deliberate architectural voice:

- **Space Grotesk:** Monumental brand marks, architectural headers, display titles, and tactical menu actions.
- **Space Mono:** Technical telemetry, radio frequencies, sensor transcripts, classified directives, terminal inputs, and monospaced data blocks.
- **Inter:** Highly legible reading prose, long-form lore chapters, rules explanations, and biological descriptions.

### 2.1 Standardized Typographic Scale

The typography scale of Beyond the Horizon maps directly to the design system tokens in the frontend:

| Scale Token Name | Numeric Size | Typeface | Semantic Style Token | Target Domain & Semantic Usage |
| :--- | :--- | :--- | :--- | :--- |
| **legend** | 11.5px | Space Mono | legend | Telemetry timestamps, footnotes, image captions, keyword badges. |
| **body** (Default) | 14.0px | Inter | body | Standard reading prose, rules explanations, codex dossiers. |
| **bodyMono** | 14.0px | Space Mono | bodyMono | Technical telemetry, terminal transcripts, radio logs, epigraph copy. |
| **bodyMedium** | 16.0px | Inter | bodyMedium | Featured dossier introductions, prominent species/origin overviews. |
| **sectionTitleSmall** | 18.0px | Space Grotesk | sectionTitleSmall | Subsection headers (H3), group headers, dossier classification caps. |
| **sectionTitleMedium** | 26.0px | Space Grotesk | sectionTitleMedium | Major section titles (H2), operational protocols, dossier names. |
| **sectionTitleLarge** | 32.0px | Space Grotesk | sectionTitleLarge | Document / Chapter titles (H1), monumental volume dividers. |

Authoring Constraint: For inline and paragraph text styling, authors interact strictly with reading copy tokens (body, bodyMedium, bodyMono, legend) via the type attribute. Heading tokens (sectionTitleLarge, sectionTitleMedium, sectionTitleSmall) are generated exclusively via standard Markdown heading markers (#, ##, ###) and cannot be declared via type attributes.

---

## 3. Standard Markdown Formatting

The engine natively parses standard CommonMark and GitHub Flavored Markdown (GFM) syntax across both short-form and long-form texts:

### 3.1 Bold, Italic & Strikethrough

```markdown
**Diretiva Primária**: Todos os operadores devem reportar ao convés médico.
*O vácuo entre as estrelas observa sem pestanejar.*
~~Protocolo de Contenção 12-A revogado pelo Comando.~~
```

### 3.2 Lists (Unordered & Ordered)

Unordered lists use hyphens or asterisks, while ordered lists use numbers followed by periods:

```markdown
- Filtro de purificação atmosférica ativo
- Injetores de deuterônio sincronizados
- Sensor de massa gravitacional calibrado

1. Travar as comportas da eclusa principal
2. Iniciar despressurização do setor 04
3. Confirmar selagem do traje de vácuo
```

### 3.3 Structural Headings (Strict 3-Tier Hierarchy: H1 to H3)

The document engine enforces a strict 3-tier heading structure (H1, H2, and H3). Level 4 headings (H4) are deliberately omitted to preserve a clean information hierarchy, prevent excessive nesting depth, and keep document outlines disciplined and scannable.

#### Heading Typographic Specifications

| Heading Level | Markdown Syntax | Typeface | Size | Weight | Letter Spacing | Line Height | Color | Semantic Role & Token |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **H1** | # Title | Space Grotesk | 32.0px | Bold (w700) | -0.5px | 1.25 | #F0ECE1 (Titanium White) | Document / Chapter title, major volume name (sectionTitleLarge). |
| **H2** | ## Section | Space Grotesk | 26.0px | Bold (w700) | -0.2px | 1.15 | #F0ECE1 (Titanium White) | Major section title, operational protocol (sectionTitleMedium). |
| **H3** | ### Subsection | Space Grotesk | 18.0px | Bold (w700) | -0.1px | 1.20 | #F0ECE1 (Titanium White) | Tactical subtopic, feature block, ability name (sectionTitleSmall). |

#### Authoring Conventions & Absence of H4

```markdown
# Capítulo 2: Testes de Habilidade e Tensão
## 2.1 Modificadores Circunstanciais
### Testes Opostos e Dificuldade
```

When authors need to categorize items beneath an H3 subsection without introducing deeper heading levels, they use one of the following standard patterns:

1. **Bold Lead-In Paragraph Labels:**
   ```markdown
   **Manobras em Gravidade Zero**: Os operadores sofrem desvantagem em testes de Agilidade caso não estejam ancorados.
   ```
2. **Bulleted Trait or Effect Lists:**
   ```markdown
   - **Propulsão Reativa**: Permite reposicionamento imediato como Ação Menor.
   - **Inércia Residual**: Requer teste de Força para desaceleração abrupta.
   ```
3. **Classified Section Callouts:**
   ```markdown
   > [!SECTION|surface=dark_concrete]
   > Protocolo de Despressurização: O convés é isolado automaticamente.
   ```

### 3.4 Blockquotes & Horizontal Rules

```markdown
> Não olhe diretamente para as fissuras no casco durante o salto gravitacional.
> — Manual de Segurança da Frota Mercante

---
```

---

## 4. Underline Formatting

Because standard Markdown syntax reserves underscores for emphasis, vector underlines are authored using standard HTML formatting tags:

```markdown
O operador deve declarar uma <u>Ação Tática</u> antes de rolar os dados.
```

The alternative tag syntax is also supported as a direct synonym:

```markdown
Protocolo de contenção sob <ins>Quarentena Nível 4</ins> ativo.
```

---

## 5. Newlines, Blank Lines & Stanza Preservation

Line break processing adapts intentionally between atmospheric epigraphs and structured documentation prose:

### 5.1 Epigraphs, Transmissions & Poetry (Preserved Line Breaks)

For short-form epigraphs (such as poems, transmissions, documents, news bulletins, and quotes), single line breaks are preserved natively as visual line breaks without requiring trailing double spaces or explicit break tags:

```markdown
O vácuo não responde quando chamamos.
Ele apenas ecoa o que tememos esquecer.
Entre as estrelas frias, somos cinza e poeira.
E o horizonte nos observa sem pestanejar.
```

Blank lines (double newlines) create distinct stanza separations or paragraph pauses:

```markdown
-- INTERCEPTAÇÃO DE SINAL // FREQ 1420.45 MHz --
AQUI É O CARGUEIRO OMNIS-9. MOTORES INOPERANTES NO SETOR 04.

SOLICITAMOS RESGATE IMEDIATO. ALGO PENETROU A ECLUSA.
```

### 5.2 Documentation Chapters (Standard Flow & Paragraph Spacing)

In long-form rulebook chapters, standard prose flows naturally with soft line wrapping. A blank line (double newline) creates a standardized 16px paragraph gap. Authors can force a single line break within standard documentation text using the break tag:

```markdown
Primeira linha de instrução operacional.<br>Segunda linha vinculada imediatamente abaixo.
```

---

## 6. Semantic Typographic Switching via Type Attributes

In strict alignment with the Beyond the Horizon design system, authors never declare ad-hoc font families or arbitrary font sizes. Instead, typography is declared through the semantic type attribute on paragraph blocks and inline spans.

### 6.1 Permitted Authoring Type Tokens

The text engine restricts author-facing typography strictly to reading copy tokens. Headings are handled exclusively via Markdown heading markers (#, ##, ###), and form controls are handled by the UI engine:

| Type Token Value | Typeface | Size | Weight | Line Height | Semantic Role |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **type="body"** (Default) | Inter | 14.0px | Regular (w400) | 1.60 | Standard reading prose, rules explanations, long-form lore. |
| **type="bodyMedium"** | Inter | 16.0px | Regular (w400) | 1.70 | Featured dossier introductions, prominent species and origin overviews. |
| **type="bodyMono"** | Space Mono | 14.0px | Regular (w400) | 1.60 | Technical telemetry readouts, terminal logs, radio transmissions, epigraph body copy. |
| **type="legend"** | Space Mono | 11.5px | Regular (w400) | 1.25 | Epigraph citations, timestamps, image captions, footnote annotations. |

### 6.2 Prohibited Type Tokens

To maintain design system integrity and prevent visual distortion of the document hierarchy, the following types are strictly unavailable and prohibited in markdown authoring:

- **fieldLabel**: Dedicated strictly to frontend interactive form inputs and metadata field titles.
- **sectionTitle**: Deprecated token; superseded by the 3-tier heading structure.
- **sectionTitleLarge**, **sectionTitleMedium**, **sectionTitleSmall**: Headings must be authored using standard Markdown #, ##, or ### syntax.
- **displayTitle**, **displayTitleLarge**: Dedicated to application shell titles, drawer headers, and dialog modals.

If an unsupported type value is specified, the parser gracefully falls back to the domain default (body for documentation, or bodyMono for epigraphs).

### 6.3 Block-Level Paragraph Typography

To assign a semantic typographic style to an entire paragraph, authors specify the type attribute on the paragraph tag:

```html
<p type="bodyMono">
TELEMETRIA // SENSOR DE MASSA // CICLO 812.4
Anomalia de curvatura detectada a 400 km do limiar de evento.
</p>

<p type="bodyMedium">
Os primeiros colonizadores de Ganimedes não anteciparam a velocidade com que a radiação jupiteriana corroeria as ligas externas das cúpulas residenciais.
</p>

<p type="legend">
Fonte: Banco de Dados de Navegação da Estação Kepler-9.
</p>
```

### 6.4 Inline Typographic Spans

To switch typography within a flowing sentence, authors use the span tag with a permitted type attribute:

```html
Durante o salto, o terminal de bordo registrou a sequência <span type="bodyMono">WARP_STABILIZER_OFFLINE</span> antes do blecaute total.
```

---

## 7. Paragraph Alignment & Indentation

Paragraph alignment and first-line indentation are controlled through dedicated attributes on the paragraph tag:

### 7.1 Text Alignment Modes

The engine supports four alignment modes:

- **align="left"**: Flush left alignment with ragged right (default for English/Western reading).
- **align="center"**: Centered text for monumental chapter subtitles, epigraph poems, and solemn decrees.
- **align="right"**: Flush right alignment for attribution signatures, author notes, and telemetry header tags.
- **align="justify"**: Formal justified text with balanced line spacing for rulebook lore dossiers and institutional records.

```html
<p align="center" type="bodyMono">
CENTRAL EXECUTIVE // SEÇÃO DE ARQUIVAMENTO
</p>

<p align="justify" type="body">
Os espécimes encontrados na cratera boreal exibem propriedades bioelétricas incomuns. A estrutura molecular de seus tecidos reage instantaneamente a pulsos de micro-ondas de alta intensidade.
</p>

<p align="right" type="legend">
— Doutor Aris Thorne, Relatório Preliminar de Patologia
</p>
```

### 7.2 Paragraph Indentation

To apply a traditional book-style first-line paragraph indentation, authors specify the indent attribute:

```html
<p align="justify" indent="true">
A expansão para além do Cinturão de Kuiper não foi impulsionada pela curiosidade científica, mas pelo colapso gradual das colônias de hélio em Marte.
</p>
```

When **indent="true"** is present, a 24px indentation is applied to the first line of the paragraph. Authors can also pass custom numeric values such as **indent="32"** to adjust the indent depth.

---

## 8. In-Text Image Positioning & Side-by-Side Layouts

Documentation markdowns support responsive image integration within body text using the figure container tag:

### 8.1 Centered Diagram or Illustration

For diagrams, tactical blueprints, and general illustrations displayed below or above paragraphs, authors center the image:

```html
<p align="center">
  ![Diagrama de Dano](storage://documentation/images/damage_diagram.webp)
</p>
```

With an accompanying caption:

```html
<figure position="center" width="600">
  <img src="storage://documentation/images/damage_diagram.webp" alt="Diagrama de Dano" />
  <figcaption>Figura 1.2: Fluxo de Dano e Trauma Balístico</figcaption>
</figure>
```

### 8.2 Side-by-Side: Image Docked to the Right of a Paragraph

For character dossiers, species profiles, and item catalog entries, images can be positioned to the right of descriptive text:

```html
<figure position="right" width="280">
  <img src="storage://documentation/images/species/evoraz_profile.webp" alt="Espécime Evo'raz" />
  <p type="body" align="justify">
  Os Evo'raz desenvolveram adaptações respiratórias sintéticas após a catástrofe de Nova Cydonia. Sua fisiologia combina exoesqueleto de grafite e circuitos bioelétricos integrados ao sistema nervoso central.
  </p>
  <figcaption>Registro Fotográfico // Setor 7</figcaption>
</figure>
```

#### Responsive Desktop and Mobile Behavior
- **Desktop (Width 768px or greater):** Renders a two-column layout where the descriptive paragraph expands across the left column and the image is docked on the right with a fixed width of 280px and a 24px gutter.
- **Mobile / Constrained Viewport (Width under 768px):** Stacks automatically, rendering the image above the descriptive text while preserving readable full-width typography.

### 8.3 Side-by-Side: Image Docked to the Left of a Paragraph

```html
<figure position="left" width="280">
  <img src="storage://documentation/images/equipment/plasma_cutter.webp" alt="Cortador de Plasma" />
  <p type="body" align="justify">
  O cortador de plasma modelo Mark IV utiliza cilindros de xenônio superaquecido para fundir blindagens de casco até 150mm de espessura.
  </p>
  <figcaption>Equipamento Tático Industrial</figcaption>
</figure>
```

### 8.4 Full-Width Narrative Banner

For cinematic chapter headers and panoramic planetary landscapes:

```html
<figure position="banner">
  <img src="storage://documentation/images/banners/void_landscape.webp" alt="O Horizonte Profundo" />
  <figcaption>O Abismo Além da Singularidade de Kepler</figcaption>
</figure>
```

---

## 9. Binary Highlighting & Background Surface Styling

In strict accordance with the Beyond the Horizon design system, arbitrary color properties (such as color="orange" or color="#FE6403") are completely prohibited in authoring syntax. Text colors are deterministically derived from the typographic role and the binary **highlighted** state.

### 9.1 The Binary Highlighting Model

Text elements exist in either of two deterministic visual states:

1. **Default State (highlighted="false"):**
   - Headings (H1, H2, H3): High-contrast Titanium White (#F0ECE1, AppColors.darkTextPrimary).
   - Body and BodyMono (type="body", type="bodyMono"): Reading Titanium (~85% luminance, #C8C4B8, AppColors.darkTextSecondary).
   - Legend (type="legend"): Calibrated Slate (#7B8491, AppColors.darkTextMuted).
2. **Highlighted State (highlighted="true" or ==highlight==):**
   - Applies the universal interactive accent color: Signal Orange (#FE6403, AppColors.accentOrange).
   - For type="legend", resolves directly to AppTypography.legendHighlighted.
   - For type="body" and type="bodyMono", renders in solid Signal Orange.

### 9.2 Supported Background Surfaces

Blocks can declare background container surfaces for visual callouts and recessed telemetry terminals:

| Background Parameter | Target Hex Code | Semantic Role in Document Presentation |
| :--- | :--- | :--- |
| **bg="well"** | #0C0E10 | Recessed dark well fill for terminal readouts, technical code insets, and telemetry cards. |
| **bg="surface"** | #16191D | Standard chassis dark surface for callout blocks, notes, and dossier cards. |
| **bg="elevated"** | #20252C | Elevated dark surface for interactive popovers and micro-overlays. |

### 9.3 Syntax Examples for Highlighting & Backgrounds

#### Inline Highlight Marker (Obsidian Standard)
To highlight a phrase with the accent color:

```markdown
O reator entrou em estado de ==ressonância crítica== após o salto.
```

#### Inline Highlighted Span
Explicit HTML syntax providing identical rendering:

```html
O reator entrou em estado de <span highlighted="true">ressonância crítica</span> após o salto.
```

#### Block-Level Highlighted Paragraph
```html
<p type="bodyMono" highlighted="true">
ALERTA GERAL: Eclusa despressurizada no setor 04.
</p>

<p type="legend" highlighted="true">
// DIAGNÓSTICO PRIORITÁRIO ATIVO
</p>
```

#### Recessed Background Paragraph Well
```html
<p bg="well" type="bodyMono">
DIRETIVA DE SEGURANÇA: O acesso a este terminal requer credencial de nível 4.
</p>
```

---

## 10. Classified Narrative Redactions

To evoke the aesthetic of declassified intelligence archives and institutional case files (*Control*, FBC dossiers), the text engine supports two distinct redaction formats:

### 10.1 Literal Classification Text Markers

When written as standard bracketed markers, the tokens remain literal textual characters in the active font, preserving explicit administrative classification stamps:

```markdown
O incidente ocorreu nas proximidades da estação [OMITIDO] durante o ciclo solar 44.
```

*Visual Output:* The characters [OMITIDO] are displayed as literal text in the active typeface.

### 10.2 Parametric Black Redaction Token Blocks

When a word or specific name must be visually blacked out with solid vector tape matching the length of the concealed term, authors use the parametric token:

```
[REDACTED-TOKENS-X]
```

or for Portuguese content:

```
[OMITIDO-TOKENS-X]
```

Where **X** represents the integer quantity of character blocks to render, matching the character count of the redacted word.

#### Visual Execution
- Each token block is rendered as a discrete solid block with width proportional to a monospaced character, matching font line height.
- Filled in solid dark well black (#0C0E10) with a 0.8px hairline border in prominent framing gray (#444D5A).
- Multiple token blocks join seamlessly with 1px micro-gaps to emulate physical redaction tape.

#### Authoring Examples

```markdown
O oficial responsável pela quebra do selo foi o Capitão [REDACTED-TOKENS-6].
```
*Visual Output:* Conceals a 6-letter name (e.g., KEPLER) with 6 consecutive solid black vector token blocks.

```markdown
A transmissão foi originada a partir da lua [OMITIDO-TOKENS-4].
```
*Visual Output:* Conceals a 4-letter destination (e.g., ARES) with 4 consecutive solid black vector token blocks.

---

## 11. Section Callouts & Storage Image Resolution

### 11.1 Obsidian-Compatible Section Callouts

Authors can wrap critical rules exceptions, GM tactical sidebars, and hazard warnings in section callouts:

```markdown
> [!SECTION|surface=dark_concrete|border=glow]
> ## Protocolo de Ressonância Crítica
> Durante combate tático, qualquer falha crítica com armas de plasma impõe 1 ponto de Estresse ao operador.
```

The callout syntax parameterizes surface background, border treatment, and icon badges without requiring nested HTML tags.

### 11.2 Storage Image URI Resolution

Images stored within the documentation assets repository are referenced using the canonical storage URI scheme:

```markdown
![Diagrama de Dano](storage://documentation/images/diagrams/damage_flow.webp)
```

The URI scheme storage://documentation/... references relative image paths within the documentation assets repository, providing consistent asset resolution and caching.

---

## 12. In-Documentation & Cross-Page Navigation Links

The documentation engine provides native hyperlinking to enable seamless navigation within a single chapter or across the entire Codex documentation catalog.

### 12.1 Same-Page Anchor Links (Intra-Document Jumps)

To navigate operatives to a specific section or heading within the currently loaded document, authors use standard anchor hash syntax:

```markdown
Para detalhes sobre penalidades circunstanciais, consulte os [Modificadores de Tensão](#21-modificadores-circunstanciais).
```

#### Heading Slugification Algorithm
Heading targets generate deterministic anchor slugs following these standardized rules:
1. All characters are converted to lowercase.
2. Spaces, underscores, and forward slashes are converted to single hyphens (-).
3. Diacritical marks and accents are normalized to their ASCII equivalents (e.g., ã becomes a, é becomes e, ç becomes c).
4. All punctuation and non-alphanumeric characters (such as periods, colons, parentheses, commas, question marks, and exclamation marks) are stripped.
5. Consecutive hyphens are collapsed into a single hyphen.
6. Leading and trailing hyphens are trimmed.

Examples:
- Heading: ### 2.1 Modificadores Circunstanciais -> Slug: #21-modificadores-circunstanciais
- Heading: ## Resolução de Dano & Trauma -> Slug: #resolucao-de-dano-trauma

#### Explicit Anchor Markers
For jumping to non-heading elements such as specific data tables, diagrams, or lore callouts, authors can place an explicit anchor marker:

```html
<span id="tabela-modificadores-gravidade"></span>
```

Navigated via:
```markdown
[Visualizar Tabela de Gravidade](#tabela-modificadores-gravidade)
```

### 12.2 Cross-Page Documentation Links (Inter-Document Navigation)

The engine supports navigation across distinct rulebook chapters, character species dossiers, background origin records, and equipment catalogs.

#### Canonical Document URI Scheme
The canonical document URI scheme references documentation pages by their category and document slug, matching the storage organization:

```markdown
[Consulte as Regras de Combate](doc://core_rules/combat)
[Acesse o Dossiê da Espécie Evo'raz](doc://species/evoraz)
[Visualizar Equipamentos Industriais](doc://equipment/industrial_tools)
```

The document engine resolves doc://category/slug against the active player locale (e.g., pt-BR or en-US) and loads the corresponding Markdown page.

#### Relative File Path Scheme
For compatibility with Obsidian, GitHub, and local Markdown previewers, relative file paths are also natively supported:

```markdown
[Consulte as Regras de Combate](./combat.md)
[Acesse o Dossiê da Espécie Evo'raz](../species/evoraz.md)
```

Both relative file paths and canonical document URIs resolve to the identical document node in the Codex navigation tree.

#### Cross-Page Navigation with Anchor Targets
Authors can link directly to a specific subsection within a different document by appending the anchor hash to the document reference:

```markdown
[Consulte a Resolução de Dano em Combate](doc://core_rules/combat#resolucao-de-dano)
[Consulte a Resolução de Dano em Combate](./combat.md#resolucao-de-dano)
```

When activated, the documentation reader loads the target document, pushes the new route to the navigation stack, and smoothly scrolls the viewport to position the target heading at the top reading offset.

### 12.3 External Web Links

Hyperlinks pointing outside the Beyond the Horizon platform use standard absolute URL syntax:

```markdown
[Repositório de Dados Externos](https://beyondthehorizon.app)
```

External links open in the operative's external system browser and display an external arrow glyph (↗) to clearly distinguish them from internal documentation routes.

### 12.4 Link Visual Materiality & Interactive States

Links adhere strictly to the project's minimalist brutalist aesthetic:
- **Resting State:** Reading Titanium (#C8C4B8, AppColors.darkTextSecondary) with a subtle hairline underline in prominent framing gray (#444D5A, AppColors.darkBorderProminent).
- **Hover State:** Transitions smoothly to Signal Orange (#FE6403, AppColors.accentOrange) with a pointer cursor and subtle accent illumination.
- **Active / Pressed State:** Micro-scale tactile feedback on mouse press or touch down.
- **Visited State:** Links remain in their clean resting state, preventing colored browser-history pollution.

---

## 13. Verification & Compliance Checklist

When authoring or validating Markdown content against this specification, verify the following standards:

1. **Rule 5 Compliance (English Documentation):** All technical specifications, SDDs, and documentation notes are authored strictly in English.
2. **Rule 18 Compliance (No Inline Backticks):** Documentation prose, tables, and lists must contain zero inline backticks. Use bold, italics, or fenced code blocks.
3. **Rule 22 Compliance (No Raw Angle Brackets in Prose):** Tag names in documentation prose are referred to by name (e.g., paragraph tag, span tag, figure tag) or formatted inside fenced code blocks.
4. **Rule 23 Compliance (Centered Documentation Images):** Image embeds in SDDs and auxiliary documentation must be wrapped in centered paragraph containers.
5. **Color Token Purity:** All colors correspond strictly to canonical tokens in the design system palette with zero runtime opacity modifications.
6. **Universal Domain Compatibility:** Markdown strings authored for Lore Epigraphs (Command Deck) and Documentation Pages (Codex) must render through the unified text engine without bespoke parsing exceptions.
