# Agent Constitution & Repository Guidelines

This document defines the master constitution, architectural principles, and operational rules for all AI agents working within the Beyond the Horizon App repository.

---

## 1. Modular Rulebook Index

Detailed domain-specific policies are modularized inside the .agents/rules/ directory. Agents MUST review and comply with all applicable rulebooks for their tasks:

- [.agents/rules/01-git-and-workflow.md](./.agents/rules/01-git-and-workflow.md): Git commit and push policies, pre-commit wikilink conversion, planning gate, and visual swatches requirement.
- [.agents/rules/02-documentation-and-markdown.md](./.agents/rules/02-documentation-and-markdown.md): Strict English-only rule, SDD scope boundaries, prohibition of inline backticks, prohibition of raw angle brackets, and centered HTML image formatting.
- [.agents/rules/03-backend-architecture.md](./.agents/rules/03-backend-architecture.md): Backend-only external calls, fully spelled identifiers, pure DTO wire contracts, specific typed exceptions, OWASP top 10 security standards, and Supabase dashboard policy.
- [.agents/rules/04-frontend-and-design-system.md](./.agents/rules/04-frontend-and-design-system.md): Presentational widgets, dedicated widget classes (no widget helper methods), ChangeNotifier controllers, GetIt dependency injection, semantic typography widgets, solid color immutability (no withOpacity), and l10n localization.
- [.agents/rules/05-quality-and-gtm.md](./.agents/rules/05-quality-and-gtm.md): Mandatory static analysis (0 diagnostics), testing restrictions, zero-cost quotas, in-universe error boundaries, and release build gating.

---

## 2. The 10 Inviolable Golden Rules

1. **Git Safety**: Never execute git commit or git push proactively or autonomously. Only execute Git commits or pushes when the user explicitly commands it.
2. **Wikilink Conversion**: Before committing, scan all modified Markdown files and convert every Obsidian wikilink into standard relative Markdown links.
3. **Strict English & Clean Markdown**: All technical documentation, artifacts, and SDDs must be written strictly in English. Prohibit inline backticks in prose and tables. Prohibit raw angle brackets in prose. Wrap all documentation image embeds in HTML centering tags.
4. **Backend-Only External Communications**: All database queries, cloud storage requests, email dispatches, and third-party API interactions originate strictly and exclusively from the backend package. Frontend interacts solely via BackendService and shared DTOs.
5. **Pure DTOs & Dedicated Validators**: DTOs in the shared package are pure serialization wire contracts without validation methods or localized strings. Forms use dedicated frontend validators taking AppLocalizations.
6. **Specific Machine-Readable Exceptions**: Never throw generic exceptions or raw strings. Subsystems use dedicated typed exceptions with standardized machine error codes mapped to localized messages in frontend controllers.
7. **Presentational Widgets & State Management**: Prohibit widget build helper methods. Pages are StatelessWidgets with controllers resolved in constructor initializer lists. Controllers (ChangeNotifier) hold resolved state, not futures.
8. **Semantic Design System & Action Typography**: Never instantiate raw Text(...) or inline TextStyle(...). Every clickable element must use an Action typography token. Prohibit copyWith(...) on typography tokens in UI code.
9. **Strict Solid Color Immutability**: Prohibit withOpacity(...), withAlpha(...), withValues(...), or color alpha blending in UI layout code. Colors from AppColors must be applied as pure solid tokens.
10. **Zero-Diagnostic Static Analysis**: Always run flutter analyze and dart analyze before declaring any task complete. Zero errors, warnings, or hints are permitted.

---

## 3. Skills Environment & Workflows

Procedural agent playbooks (`design`, `planner`, `prototype`, `wait-what`) are provided globally via the centralized `toolkit` repository (`D:\Workspace Github\toolkit`) and are available on-demand across all sessions.
