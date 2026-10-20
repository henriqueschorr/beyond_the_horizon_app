# Rulebook 04: Frontend & Design System Standards

This document defines mandatory UI architecture, state management patterns, and design system constraints for the Flutter Web frontend package.

---

## 1. Flutter Architecture & Widget Extraction Guidelines

- **Prohibited: Widget _buildX(...) helper methods.** Never create methods that return widgets inside a State or Widget class. Always extract them into dedicated StatelessWidget or StatefulWidget classes to preserve element-tree optimizations and prevent cascading rebuilds.
- **Dedicated Files vs. Local Widgets**:
  - Extract to separate files in features/[feature]/widgets/ or shared_widgets/[domain]/ whenever a widget:
    1. Contains internal state (hover, animations, controllers).
    2. Is reused across multiple files or screens.
    3. Represents an interactive primitive (such as buttons, badges, filter pills).
  - Private classes (class _LocalSubWidget extends StatelessWidget) in the same file are permitted only for single-use, stateless layout decomposition to keep files concise (fewer than 200 lines).

---

## 2. State Management & Controller Architecture

- **Strict Separation of Concerns (No Data Logic in Widgets)**:
  - Widgets MUST be purely presentational. NEVER perform data transformations inside widget build trees or State classes (such as regex checks, string splitting/joining, date formatting, or URL fallbacks).
  - All data formatting, validation, string manipulation, state transitions (such as counter increments, mode toggles), API dispatching, and route fallback resolution must reside in the feature Controller or a dedicated domain helper.
  - **Prohibited: Sub-widgets calling serviceLocator[T]()** inside local callbacks or event handlers. Sub-widgets must receive plain callbacks or rely on controllers injected via constructor or scoped hierarchy.
- **Dependency Injection & Service Locator (get_it)**:
  - Both frontend and backend utilize get_it as their centralized dependency injection and service locator container.
  - All services, controllers, repositories, and route handlers must register in their respective service locator configuration files.
  - **Strict Dependency Injection on Stateless Objects**: Every object that does not hold state (domain services, repositories, route controllers) MUST be registered in and fetched exclusively via dependency injection (serviceLocator[T]() or via BackendService). Direct constructor instantiation in application code is strictly prohibited.
  - **Pure Constructor Injection (Prohibited: Fallback Defaults on Stateless Classes)**: Domain services, repositories, and route controllers must declare explicit required constructor parameters for their dependencies. They must NOT provide fallback defaults to serviceLocator[T]() in their constructors and must not import serviceLocator internally.
  - **Prohibited: Global static final instance singletons** on controllers, services, or repositories.
- **Pages & Shells are StatelessWidgets with Constructor Initializers**:
  - Screen and shell layouts MUST be StatelessWidgets.
  - Controllers MUST be resolved in **constructor initializer lists** (: controller = controller ?? serviceLocator[T]()), ensuring fields are non-nullable final T controller resolved once upon creation.
  - **Prohibited: Calling serviceLocator[T]() inside build() methods** of pages and shell layouts. The build() method must be purely presentational, reading already-bound fields or inherited scope.
  - Prohibited: Making a page a StatefulWidget solely to hold a controller in initState or call dispose.
- **Controllers Hold State, Not Futures**:
  - Prohibited: Getters with lazy side-effects (such as Future[T] get future => _future ??= ApiService...).
  - Controllers (ChangeNotifier) must hold resolved data models, granular loading booleans (isLoading...), and error strings (String? errorMessage).
  - Fetching must be triggered via explicit asynchronous methods (loadData(), refresh()).
  - Widgets must observe state via ListenableBuilder (or AnimatedBuilder) instead of FutureBuilder and caching futures in initState.
- **No Phantom ScrollControllers**:
  - Prohibited: Instantiating a ScrollController on pages or inside controllers unless actively calling programmatic scroll methods (animateTo / jumpTo) or registering a scroll listener.
- **Guaranteed Controller Scoping**:
  - Prohibited: Treating controllers as optional (maybeOf(context)) in child widgets, layout views, or sections where the controller scope is architecturally guaranteed to exist.
  - Always use Controller.of(context) (with assertion) inside scoped subtree widgets.
- **Data Model Respect in Resolvers**:
  - Image and metadata resolvers must prioritize backend DTO fields before falling back to static endpoints or asset fallbacks.
  - Favor instance methods or getters on controllers over static class methods to keep widgets decoupled from global singletons.
- **Form Submission & Async Orchestration in Controllers**:
  - Modal dialogs, forms, and views MUST NOT manage local submitting state, local loading booleans, local error messages, or raw submit orchestration handlers.
  - The Controller layer MUST own the entire flow: input coordination, validation invocation, loading state transitions (isLoading), error message mapping, and backend dispatch.
  - Widgets observe the controller via ListenableBuilder and only trigger high-level controller methods, with the view strictly handling immediate navigation or dismissal on successful completion.

---

## 3. Design System & Typography Rules

- **Prohibited: Raw Text(...) and inline TextStyle(...)**. Never instantiate Text(...) directly in feature or shared code.
- **Strict Typography Widgets**:
  - All text must use dedicated semantic text widgets defined in the design system (such as TitleText, BodyText) rather than raw Text(...).
  - **No ad-hoc sizing in text widgets**: Font sizes, weights, and letter spacing MUST come strictly from predefined styles. Widgets do not take arbitrary fontSize, letterSpacing, or color overrides.
  - **Highlight and Accent Texts**: For text that reflects or reacts to active theme/accent colors, use dedicated highlighted text widgets or primitives provided by the design system rather than wrapping widgets in local listeners or copying styles manually.
- **Universal Button Action Typography Rule**:
  - Every interactive button, actuator, clickable control, or menu action that the user can click MUST strictly use an Action typography token (actionLabel*, navAnchor*) and its corresponding semantic text widget.
  - **Prohibited in clickable elements:** Using non-action tokens (such as fieldLabel, legend, body, or sectionTitle) inside interactive buttons, actuators, or clickable choices.
- **Strict Prohibition of copyWith(...) on Typography Tokens in UI Code**:
  - Never call copyWith(...) to override font size, color, letter spacing, or weight on AppTypography tokens in feature or shared UI code.
  - If a specific state, color, or role is needed, a dedicated style token and semantic widget must be explicitly declared in the design system.
- **Strict Color Token Immutability (Prohibited: withAlpha, withOpacity, withValues, Color.alphaBlend)**:
  - The color palette defined in AppColors must be used strictly as-is across all application widgets, containers, borders, icons, and text.
  - **Prohibited in UI code:** Calling withAlpha(...), withOpacity(...), withValues(...), Color.alphaBlend(...), or any programmatic runtime opacity or alpha modification on AppColors tokens.
  - Colors must be applied as pure, solid tokens. Blurry colored glow washes and low-alpha box shadows are prohibited in UI layouts.
  - **Shader & Structural Divider Exemption:** The ONLY components authorized to compute or attenuate colors via alpha or opacity are procedural canvas shaders/painters and structural seam dividers explicitly documented in the design system.

---

## 4. Internationalization & Localization (l10n) Policy

- **Prohibited: Hardcoded user-facing strings, validation and error texts, and fallback literals**:
  - Never provide hardcoded string literals as fallbacks or error messages in code (especially in DTOs, controllers, repositories, services, routers, or widgets).
  - Validation messages and errors must never be hardcoded in pt-BR, en-US, or any natural language within business logic or data structures.
  - All user-facing UI text, validation feedback, and errors MUST originate exclusively and directly from AppLocalizations.of(context)! (or non-nullable l10n.errors.* / l10n.[domain].*).
  - Routers and route parameters must never declare hardcoded fallback text. Use nullable parameters and let views resolve default headers through AppLocalizations.
  - If a translation key does not exist, add it to app_en.arb and app_pt.arb and synchronize app_localizations.dart rather than writing inline fallback strings.

---

## 5. UI Primitives & DRY Standards

- **Standardized Interactive Primitives**:
  - Use established button and badge primitives rather than hand-rolling MouseRegion + GestureDetector + setState(_isHovered).
  - Interactive components must reuse shared design primitives to maintain consistent focus, hover, and press states across the application.
- **Centralized Surfaces & Borders**:
  - Use tokens from the design system and shared primitives for surfaces, borders, and decorations instead of duplicated inline BoxDecoration and Border.all.

---

## 6. Prohibition of Barrel Export Files

- **Strict Prohibition of Barrel Files**:
  - Never create barrel or re-export files that simply bundle and re-export other files within a directory.
  - The only acceptable library export files are the canonical package-level entrypoints explicitly required by Dart (such as lib/shared.dart, lib/backend.dart).
  - Everywhere else across feature modules and shared directories, consumers must import the specific file where a class, widget, or function is declared directly.
