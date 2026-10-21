# Lore Epigraphs and Archival Transmissions Engine Architecture

- **Status:** accepted
- **Date:** 2026-10-21

## Context & Decision
During Ticket 0003 design alignment, key architectural patterns were resolved for the lore transmissions system:
1. Pure Geometric Silhouette Standard: Epigraph frames contain zero text badges or category labels. The narrative type is communicated purely through the bespoke geometric vector frame and right-aligned source attribution.
2. A4 Vertical Folio Proportions for Documents: When rendering EpigraphType.document, the container width narrows from 420px to 360px, creating an authentic vertical A4 dossier silhouette reminiscent of classified case files in Remedy's Control.
3. 1,200-Character Content Ceiling: The database check constraint for epigraph content is set to 1,200 characters to comfortably accommodate substantive institutional memos with headers and multiple redacted passages without text bloat.
4. Top-Right Minimal Refresh Interaction: Lore transmissions expose manual re-roll through a minimal icon-only refresh actuator at the top-right corner outside the frame, which rotates smoothly during transmission decryption.
5. Backend-Encapsulated Locale Fallback: The backend repository and database RPC function automatically fall back to Portuguese (pt-BR) when an unseeded locale (such as English in Phase 1) is requested, preventing empty states or client-side retry cascades.
6. Pure Query Contracts: Random epigraph resolution is standardized through GetRandomLoreEpigraphRequestDto, supporting optional type filtering and locale selection with zero client-side logic.
7. In-Universe Error Boundaries: If transmission retrieval fails, the component renders a tactical signal interruption panel with standardized machine error codes (LoreEpigraphException) and a retry actuator.

## Consequences
- Positive: Upholds the minimalist brutalist aesthetic with vector clarity, provides authentic vertical document materiality, eliminates client-side localization fallbacks, and standardizes wire contracts across all backend services.
- Trade-offs: Requires custom rotation physics in LoreEpigraphBox and dedicated error mapping in LoreEpigraphController.
