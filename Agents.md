# Agent Instructions & Guidelines

This document defines mandatory operational rules and conventions for all AI agents working within this repository.

---

## 1. Git Commit & Push Policy

- **Explicit User Request Only**: Never commit or push changes automatically, proactively, or autonomously.
- **Strict Prohibition**: Do **not** execute `git commit` or `git push` unless the user explicitly commands you to do so (e.g., "commit this", "commit and push", "please push"). Always keep changes in the working tree until explicitly commanded to commit/push.
- If code or documentation edits are finished, simply present your summary to the user and await explicit instructions before touching git commits or pushes.

---

## 2. Pre-Commit Wikilink Conversion Rule

Before executing any commit (once explicitly requested by the user), the agent **must** perform a scan for wikilinks and convert all of them into standard Markdown links.

### Wikilink Syntax vs. Standard Markdown Format

Every instance of Obsidian/Roam-style wikilinks (`[[...]]`) in files being committed must be converted to standard Markdown syntax:

1. **Internal Heading Links with Alias:**
   - Wikilink: `[[#Heading Name|Display Text]]`
   - Standard Markdown: `[Display Text](#heading-name-slug)`
   - *Anchor Slug Rules:* Lowercase, replace spaces with hyphens, and remove special characters (standard GitHub Markdown anchor format).

2. **Internal Heading Links without Alias:**
   - Wikilink: `[[#Heading Name]]`
   - Standard Markdown: `[Heading Name](#heading-name-slug)`

3. **Inter-Note Links without Alias:**
   - Wikilink: `[[Note Name]]`
   - Standard Markdown: `[Note Name](path/to/Note%20Name.md)` (use proper relative path from the current file to the target).

4. **Inter-Note Links with Alias:**
   - Wikilink: `[[Note Name|Display Text]]`
   - Standard Markdown: `[Display Text](path/to/Note%20Name.md)`

5. **Inter-Note Links with Anchor:**
   - Wikilink: `[[Note Name#Heading|Display Text]]`
   - Standard Markdown: `[Display Text](path/to/Note%20Name.md#heading-slug)`

6. **Embedded Files / Images:**
   - Wikilink: `![[image.png]]` or `![[image.png|Alt Text]]`
   - Standard Markdown: `![Alt Text](path/to/image.png)`

---

## 3. Pre-Commit Execution Workflow

When the user explicitly instructs you to commit:

1. **Identify Modified Files**:
   - Check which Markdown (`.md`) files have been created or modified (via `git status` / `git diff`).
2. **Search for Wikilinks**:
   - Scan the modified files for occurrences of `\[\[.*?\]\]`.
3. **Convert to Standard Markdown**:
   - Replace each wikilink with its standard relative Markdown link equivalent.
4. **Verify**:
   - Run a final search or regex check to ensure zero wikilinks remain in the staged/modified content.
5. **Stage & Commit**:
   - Run `git add` and `git commit` with a concise, descriptive message.
6. **Push (Only If Requested)**:
   - Run `git push` only if the user explicitly requested pushing to the remote repository.

---

## 4. Planning & Workflow Policy

- **Implementation Plan on "Plan"**: Whenever the user says "plan" or asks to plan, you MUST write or update the `implementation_plan.md` artifact and obtain explicit user approval before taking action or writing code.
- **Explicit File Editing Authorization**: Only start editing or writing project files when the user explicitly says so (e.g., "start writing", "proceed with edits", "apply the plan").
- **Mandatory Visual Swatches in Plans**: Always present color palettes with rendered visual HTML swatches and structured comparison tables inside the implementation plan artifact.

---

## 5. Communication & Documentation Language

- **English Only**: Always communicate with the user in English.
- **Strict English-Only Policy for Documentation & Artifacts**: All documentation, Software Design Documents (SDDs in `design/`), architecture notes, specifications, diagrams, roadmaps, task lists, and artifacts must be written strictly and exclusively in English.

---

## 6. Testing Policy

- **Do not run tests** (e.g., `flutter test`, `dart test`, or any test runners) unless explicitly commanded by the user.
- **Do not modify or edit test files** (anything in `test/`) unless the user explicitly asks you to do so.

---

## 7. Static Analysis & Compilation Verification

- **Mandatory Static Analysis Before Completion**: ALWAYS run static analysis / compilation verification (`flutter analyze` for frontend and `dart analyze` for backend/shared) and verify that 0 errors and 0 diagnostics exist before declaring any task, plan, or implementation as completed or done.

---

## 8. Flutter Architecture & Widget Extraction Guidelines

- **Prohibited: `Widget _buildX(...)` helper methods.** Never create methods that return widgets inside a State or Widget class. Always extract them into dedicated `StatelessWidget` or `StatefulWidget` classes to preserve element-tree optimizations and prevent cascading rebuilds.
- **Dedicated Files vs. Local Widgets**:
  - Extract to separate files in features/[feature]/widgets/ or shared_widgets/[domain]/ whenever a widget:
    1. Contains internal state (hover, animations, controllers).
    2. Is reused across multiple files or screens.
    3. Represents an interactive primitive (e.g., buttons, badges, filter pills).
  - Private classes (class _LocalSubWidget extends StatelessWidget) in the same file are permitted *only* for single-use, stateless layout decomposition to keep files concise (fewer than 200 lines).

---

## 9. File, Directory & Identifier Naming Conventions

- **Prohibited: Abbreviations in names and identifiers.** Never use cryptic abbreviations in file names, directory paths, variables, parameters, or identifiers (e.g., use dependency_injection/ instead of di/, serviceLocator instead of sl, repository instead of repo, controller instead of ctrl). All directory, file, variable, parameter, and symbol names must be fully spelled out and self-documenting.

---

## 10. State Management & Controller Architecture

- **Strict Separation of Concerns (No Data Logic in Widgets)**:
  - Widgets MUST be purely presentational. NEVER perform data transformations inside widget build trees or State classes (e.g., regex checks, string splitting/joining, date formatting, or URL fallbacks).
  - All data formatting, validation, string manipulation, state transitions (e.g., counter increments, mode toggles), API dispatching, and route fallback resolution must reside in the feature's Controller or a dedicated domain helper.
  - **Prohibited: Sub-widgets calling `serviceLocator[T]()`** inside local callbacks or event handlers (e.g., `_handleBack()`). Sub-widgets must receive plain callbacks or rely on controllers injected via constructor or scoped hierarchy.
- **Dependency Injection & Service Locator (`get_it`)**:
  - Both frontend and backend utilize `get_it` as their centralized dependency injection / service locator container.
  - All services, controllers, repositories, and route handlers must register in their respective service locator configuration files.
  - **Strict Dependency Injection on Stateless Objects**: Every object that does not hold state (domain services, repositories, route controllers) MUST be registered in and fetched exclusively via dependency injection (`serviceLocator[T]()` or via `BackendService`). Direct constructor instantiation in application code (e.g., calling `AuthService()` directly) is strictly prohibited.
  - **Pure Constructor Injection (Prohibited: Fallback Defaults on Stateless Classes)**: Domain services, repositories, and route controllers must declare explicit `required` constructor parameters for their dependencies. They must NOT provide fallback defaults to `serviceLocator[T]()` in their constructors (e.g., prohibited: `repo ?? serviceLocator[Repo]()`) and must not import `serviceLocator` internally. In unit tests, mocks or test doubles are passed directly into the required constructor parameters.
  - **Prohibited: Global `static final instance` singletons** on controllers, services, or repositories (e.g., `Service.instance`).
- **Pages & Shells are `StatelessWidget`s with Constructor Initializers**:
  - Screen and shell layouts MUST be `StatelessWidget`s.
  - Controllers MUST be resolved in **constructor initializer lists** (`: controller = controller ?? serviceLocator[T]()`), ensuring fields are non-nullable `final T controller;` resolved once upon creation.
  - **Prohibited: Calling `serviceLocator[T]()` inside `build()` methods** of pages and shell layouts. The `build()` method must be purely presentational, reading already-bound fields or inherited scope.
  - Prohibited: Making a page a `StatefulWidget` solely to hold a controller in `initState` or call `dispose`.
- **Controllers Hold State, Not Futures**:
  - Prohibited: Getters with lazy side-effects (e.g., `Future[T] get future => _future ??= ApiService...`).
  - Controllers (`ChangeNotifier`) must hold resolved data models, granular loading booleans (`isLoading...`), and error strings (`String? errorMessage`).
  - Fetching must be triggered via explicit asynchronous methods (`loadData()`, `refresh()`).
  - Widgets must observe state via `ListenableBuilder` (or `AnimatedBuilder`) instead of `FutureBuilder` and caching futures in `initState`.
- **No Phantom `ScrollController`s**:
  - Prohibited: Instantiating a `ScrollController` on pages or inside controllers unless actively calling programmatic scroll methods (`animateTo`/`jumpTo`) or registering a scroll listener.
- **Guaranteed Controller Scoping**:
  - Prohibited: Treating controllers as optional (`maybeOf(context)`) in child widgets, layout views, or sections where the controller scope is architecturally guaranteed to exist.
  - Always use `Controller.of(context)` (with assertion) inside scoped subtree widgets.
- **Data Model Respect in Resolvers**:
  - Image and metadata resolvers must prioritize backend DTO fields before falling back to static endpoints or asset fallbacks.
  - Favor instance methods/getters on controllers (e.g., `controller.avatarUrl`) over static class methods to keep widgets decoupled from global singletons.
- **Form Submission & Async Orchestration in Controllers**:
  - Modal dialogs, forms, and views MUST NOT manage local submitting state, local loading booleans, local error messages, or raw submit orchestration handlers.
  - The Controller layer MUST own the entire flow: input coordination, validation invocation, loading state transitions (isLoading), error message mapping, and backend dispatch.
  - Widgets observe the controller via ListenableBuilder and only trigger high-level controller methods (e.g., controller.register(...)), with the view strictly handling immediate navigation or dismissal on successful completion.

---

## 11. Design System & Typography Rules

- **Prohibited: Raw `Text(...)` and inline `TextStyle(...)`**. Never instantiate `Text(...)` directly in feature or shared code.
- **Strict Typography Widgets**:
  - All text must use dedicated semantic text widgets defined in the design system (e.g., `TitleText`, `BodyText`) rather than raw `Text(...)`.
  - **No ad-hoc sizing in text widgets**: Font sizes, weights, and letter spacing MUST come strictly from predefined styles. Widgets do not take arbitrary `fontSize`, `letterSpacing`, or `color` overrides.
  - **Highlight/Accent Texts**: For text that reflects or reacts to active theme/accent colors, use dedicated highlighted text widgets or primitives provided by the design system rather than wrapping widgets in local listeners or copying styles manually.
- **Universal Button Action Typography Rule**:
  - Every interactive button, actuator, clickable control, or menu action that the user can click MUST strictly use an Action typography token (`actionLabel*`, `navAnchor*`) and its corresponding semantic text widget.
  - **Prohibited in clickable elements:** Using non-action tokens (such as `fieldLabel`, `legend`, `body`, or `sectionTitle`) inside interactive buttons, actuators, or clickable choices.
- **Strict Prohibition of `.copyWith(...)` on Typography Tokens in UI Code**:
  - Never call `.copyWith(...)` to override font size, color, letter spacing, or weight on `AppTypography` tokens in feature or shared UI code.
  - If a specific state, color, or role is needed (such as `fieldLabelMuted` for placeholder hints, or `fieldInput` for typed form values), a dedicated style token and semantic widget must be explicitly declared in the design system.
- **Strict Color Token Immutability (Prohibited: `withAlpha`, `withOpacity`, `withValues`, `Color.alphaBlend`)**:
  - The color palette defined in `AppColors` must be used strictly as-is across all application widgets, containers, borders, icons, and text.
  - **Prohibited in UI code:** Calling `.withAlpha(...)`, `.withOpacity(...)`, `.withValues(...)`, `Color.alphaBlend(...)`, or any programmatic runtime opacity/alpha modification on `AppColors` tokens.
  - Colors must be applied as pure, solid tokens. Blurry colored glow washes and low-alpha box shadows are prohibited in UI layouts, preserving the unyielding structural crispness of Minimalist Brutalism.
  - **Shader & Structural Divider Exemption:** The ONLY components authorized to compute or attenuate colors via alpha or opacity are the procedural canvas shaders and painters (`StarSurface`, `GrainSurface`, `CrtSurface`, and `EventHorizonArc`), and the structural console seam divider (`VerticalSeamDivider` for its vertical edge fade gradient).

---

## 12. Internationalization & Localization (l10n) Policy

- **Prohibited: Hardcoded user-facing strings, validation/error texts, and fallback literals**:
  - Never provide hardcoded string literals as fallbacks or error messages in code (especially in DTOs, controllers, repositories, services, routers, or widgets).
  - Validation messages and errors must never be hardcoded in pt-BR, en-US, or any natural language within business logic or data structures.
  - All user-facing UI text, validation feedback, and errors MUST originate exclusively and directly from **AppLocalizations.of(context)!** (or non-nullable **l10n.errors.*** / **l10n.[domain].***).
  - Routers and route parameters must never declare hardcoded fallback text (e.g., prohibited: *state.uri.queryParameters['module'] ?? 'Módulo Geral'*). Use nullable parameters and let views resolve default headers through **AppLocalizations**.
  - If a translation key does not exist, add it to **app_en.arb** and **app_pt.arb** and synchronize **app_localizations.dart** rather than writing inline fallback strings.

---

## 13. UI Primitives & DRY Standards

- **Standardized Interactive Primitives**:
  - Use established button and badge primitives rather than hand-rolling `MouseRegion` + `GestureDetector` + `setState(_isHovered)`.
  - Interactive components must reuse shared design primitives to maintain consistent focus, hover, and press states across the application.
- **Centralized Surfaces & Borders**:
  - Use tokens from the design system and shared primitives for surfaces, borders, and decorations instead of duplicated inline `BoxDecoration` and `Border.all`.

---

## 14. Architectural Boundary & Package Separation of Concerns

- **Backend-Only External Communication**:
  - Every external communication (e.g., Supabase database queries, Supabase Storage, email dispatch via Resend, Edge Functions, or third-party web APIs) MUST originate strictly and exclusively from the `backend` package.
  - The `frontend` package must be strictly limited to frontend concerns: UI presentation, layout composition, user input handling, reactive state management, routing, and local client storage (`UserLocalStorageService`).
  - Prohibited: Frontend making direct network calls to Supabase, external APIs, or mail services. Frontend interacts with domain data exclusively via `BackendService` and shared DTOs.

---

## 15. Software Design Documents (SDD) Maintenance Policy

- **Mandatory SDD Synchronization**:
  - Always keep the Software Design Documents (located in the `design/` directory, including `01-sdd-overview.md`, `02-sdd-database.md`, `03-sdd-backend.md`, `04-sdd-frontend.md`, etc.) synchronized and updated whenever introducing architectural changes, renaming services, modifying data models, or altering system behavior.
- **SDD Overview Scope Boundary (No UI Presentation Details in SDD 01)**:
  - The Overview SDD (`01-sdd-overview.md`) is strictly high-level, architectural, and capability-focused.
  - Never include UI presentation details, font tokens, CSS/styling rules, layout geometry, or specific micro-interactions (e.g., brand mark letter alignments, hover arrows, button colors, corner bracket glyphs) in `01-sdd-overview.md`.
  - All visual design, layout composition, typography tokens, and interaction details belong exclusively in the Frontend SDD (`04-sdd-frontend.md`).
- **Strict Prohibition of Non-English (pt-BR) Text in SDDs & Documentation**:
  - All Software Design Documents (SDDs), architecture notes, specifications, roadmaps, and technical documentation must be written strictly and exclusively in English.
  - Natural language Portuguese (pt-BR) text, UI labels, button names, section headers, and descriptions (e.g., prohibited in SDDs: `Códice`, `Configurações`, `[ JOGAR COM PERSONAGEM ]`, `[ SAIR ]`, `[ ENTRAR ]`, `Bem Vindo`, `Módulo em Construção`) are strictly prohibited in SDDs and documentation prose.
  - Always use standard English terms (such as `Codex`, `Settings`, `[ PLAY WITH CHARACTER ]`, `[ CREATE CHARACTER ]`, `[ CODEX ]`, `[ SETTINGS ]`, `[ ⏻ SIGN OUT ]`, `Welcome, [Callsign]`) when specifying user interface components, buttons, menus, and layouts in SDDs.
  - The ONLY context where `pt-BR` or other language codes may appear in documentation is when explicitly referencing localization files (e.g., `app_pt.arb`), documenting multi-language support (l10n architecture), or specifying database/API locale seed data parameters (e.g., `locale: 'pt-BR'`).

---

## 16. Security & OWASP Top 10 Compliance Policy

- **Mandatory OWASP Top 10 Standards Compliance**:
  - The entire codebase (Flutter Web frontend, Shelf backend, Supabase PostgreSQL schema, RLS policies, and Deno Edge Functions) MUST strictly adhere to the OWASP Top 10 Security Standards at all times.
  - **A01 & A07 (Access Control & Authentication)**:
    - Row-Level Security (RLS) must strictly safeguard data. Mutations on administrative tables (`subscribers`, `works`, `authors`) require authenticated author identity (`auth.uid()`).
    - Author secret tokens and cryptographic signatures must always be verified using timing-safe comparison (`constantTimeEquals`).
    - Client-side auth state (`AuthController`) must never mark sessions authenticated without backend validation (`validateAuthorToken`).
  - **A02 (Cryptographic Security)**:
    - Never use weak custom hashes or hardcoded default keys for security tokens.
    - Token generation (e.g., newsletter unsubscriptions, email verification) MUST use standard HMAC-SHA256 (`package:crypto` and Web Crypto API).
  - **A03 & A04 (Injection & Insecure Design)**:
    - Enforce character length limits and format validation on all incoming DTO fields and database schemas.
    - All dynamic parameters rendered in transactional and broadcast HTML emails must be properly escaped (`htmlEscape`).
    - Public mutating endpoints (`/api/newsletter/subscribe`, `/api/contact/transmit`, `/api/engagement/works/{id}/comments`) MUST be protected with sliding-window rate limiting.
    - Contact transmission endpoints must never mirror unsolicited emails (prohibited: open relay CC).
  - **A05 (Security Misconfiguration)**:
    - Production hosting (`_headers`) must include strict modern headers: `Strict-Transport-Security` (HSTS), `Content-Security-Policy` (CSP), `Permissions-Policy`, `X-Frame-Options: DENY`, `X-Content-Type-Options: nosniff`.
    - Internal exceptions, raw stack traces, and database errors must NEVER be returned in production HTTP responses.
    - Sensitive keys and author tokens must never be logged to terminal stdout or console logs.
  - **A10 (Server-Side Request Forgery & Traversal)**:
    - Static file handlers must prohibit outside directory traversal (`serveFilesOutsidePath: false`).
    - Remote content fetching must strictly prohibit loopbacks (`127.0.0.1`, `localhost`), link-local metadata (`169.254.169.254`), and private IP ranges (`10.x`, `172.16.x`, `192.168.x`).

---

## 17. Supabase Management & Instructions Policy

- **Dashboard-First Instructions (Prohibited: Supabase CLI)**:
  - The user does not use the Supabase CLI. NEVER instruct the user to run `supabase ...` or `npx supabase ...` CLI commands.
  - Always provide clear, step-by-step instructions for managing database migrations, SQL scripts, Edge Functions, secrets, and settings directly through the Supabase web dashboard interface.

---

## 18. Prohibition of Inline Backticks in Documentation

- **Strict Prohibition**: Never wrap words, identifiers, types, file paths, keywords, or text in inline backticks (`` ` ``) within Markdown documentation files. Use plain text or standard typographic formatting (such as bold or italics) instead. Code blocks with language fences are permitted only for full multiline code snippets, but inline backticks are strictly prohibited in text and tables.

---

## 19. DTO Naming & Request/Response Explicitness

- **Strict Request/Response Suffixing**:
  - When designing, declaring, or referencing Data Transfer Objects (DTOs), always be completely explicit about whether the object represents a request or a response.
  - Suffix DTO class names and identifiers explicitly with RequestDto or ResponseDto (e.g., UserProfileResponseDto instead of UserProfileDto, UpdateProfileRequestDto, DocumentationPageSummaryResponseDto, DocumentationPageDetailResponseDto).
  - Prohibited: Ambiguous, unqualified, or generic DTO names (e.g., prohibited: UserProfileDto, PageDto, AuthDto).

---

## 20. Input Validation Architecture & Pure DTO Policy (Validator -> Controller Flow)

- **Pure DTO Policy (No Validation in DTOs)**:
  - Data Transfer Objects (DTOs) in the shared package are strictly pure wire contracts (properties, constructors, toMap, fromMap serialization).
  - Prohibited: validate() methods or UI validation logic inside DTOs. DTOs must NEVER return user-facing error strings, natural language feedback, or localized text.
- **Dedicated Frontend Validators**:
  - All input field and form validations (presence, email RFC format, character lengths, password minimums) MUST be encapsulated in specialized frontend validator classes (e.g., AuthValidator).
  - Validators take AppLocalizations as an argument and return localized error strings from l10n.errors.* (or null if valid).
- **Validator -> Controller Flow**:
  - Feature controllers consume these validator objects to validate inputs before submitting requests to backend services.
  - Validators can also be directly reused across frontend UI widgets or form fields to validate individual fields as the user types or unfocuses.
  - Backend domain exceptions use machine-readable error codes (e.g., invalid_credentials, email_already_exists via AuthException), which the frontend controller maps directly to l10n.errors.* before surfacing error state to UI screens.

---

## 21. Specific Exceptions Policy

- **Exceptions Locations**:
  - All exception definitions in the backend package must reside in a dedicated exceptions directory (e.g., backend/lib/exceptions/).
- **Specific Typed Exceptions for Every Subsystem**:
  - Never throw generic StateError, Exception, or raw String instances from repositories, services, or data sources.
  - Every subsystem must define dedicated, strongly-typed machine-readable exceptions (such as AuthException, ProfileException, etc.) implementing the Exception interface.
  - Each specific exception must provide standardized machine-readable error code constants (such as AuthException.invalidCredentials, ProfileException.profileNotFound) and an optional message.
  - Natural language or localized text (pt-BR or en-US) is strictly prohibited in exception codes and messages.
  - Frontend controllers catch these specific exceptions and map their machine codes strictly to localized messages via AppLocalizations.

---

## 22. Prohibition of Angle Brackets in Markdown Documentation

- **Strict Prohibition of Angle Brackets in Prose, Tables, and Headings**:
  - Never use raw angle brackets (&lt; and &gt;) or unclosed pseudo-tags (such as placeholders like &lt;name&gt;, &lt;slug&gt;, &lt;id&gt;, &lt;T&gt;, or arrows with angle brackets) in Markdown documentation files (.md).
  - Markdown parsers and tools like Obsidian interpret angle brackets as raw HTML tags. An unclosed or unrecognized tag causes the parser to treat all subsequent document text as HTML children, breaking headers, bullet points, code blocks, bold text, and tables.
  - **Permitted Substitutes**:
    - For placeholders: Use square brackets **[Name]**, **[slug]**, **[id]**, or braces **{name}**, **{slug}**.
    - For generic type parameters: Use square brackets (e.g., **serviceLocator[T]()**, **List[String]**, **Future[AuthResponseDto]**) or parentheses.
    - For bidirectional relationships or comparisons: Use unicode arrows (e.g., **←→**, **⟷**) or dashes **---** instead of angle bracket arrows.
    - Pure multi-line fenced code blocks (e.g., language code blocks) are the only acceptable context where programming language generics using angle brackets may appear, as fenced code blocks are not evaluated as HTML. In prose, tables, lists, and headings, angle brackets are strictly prohibited.

---

## 23. Centered Image Embeds in Documentation

- **Mandatory Centering for All Documentation Images**:
  - All image embeds in Software Design Documents (SDDs) and auxiliary Markdown documentation (.md files) must be centered to ensure clean visual presentation across Obsidian reading mode, live preview, and GitHub.
  - Standard Markdown image syntax `![alt](url)` aligns left by default, and `![alt|center](url)` is not supported across all renderers.
  - **Required Centering Syntax**: Always wrap image embeds using standard HTML centering tags:
    ```html
    <p align="center">
      <img src="./assets/filename.png" alt="Descriptive Alt Text" />
    </p>
    ```

