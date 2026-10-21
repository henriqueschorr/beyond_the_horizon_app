# Canonical User Roles and Landing Asymmetric Scaling Architecture

- **Status:** accepted
- **Date:** 2026-10-21

## Context & Decision
During Ticket 0002 implementation, two foundational architectural standards were established:
1. The ambiguous term operative is permanently deprecated across documentation, code contracts, and user interface telemetry in favor of three canonical user roles: player, facilitator, and admin.
2. On viewport heights below 920px (such as tablets and laptops in the 768px-900px range), the monumental CrosswordBrandMark and EventHorizonArc scale down fluidly while the login form well and action controls remain fixed at standard ergonomic dimensions (320px width), avoiding vertical clipping or scrollbars.
3. The unauthenticated CODEX actuator navigates immediately to /blank, which is unshielded from auth redirect guards until the full Codex reader engine is wired in Ticket 0008.

## Consequences
- Positive: Eliminates terminology confusion between in-universe fiction and platform roles, and guarantees the landing portal remains fully balanced and ergonomic across desktop and tablet viewports without vertical scrolling.
- Trade-offs: Requires responsive scaling calculations in LandingPage and dedicated letter tile widgets in CrosswordBrandMark.
