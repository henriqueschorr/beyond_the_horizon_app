# ADR Format

Architecture Decision Records (ADRs) live in `design/decisions/` and use sequential numbering: `0001-slug.md`, `0002-slug.md`, etc.

Create the `design/decisions/` directory lazily: only when the first ADR is needed.

## When to Offer an ADR

All three of these gates must be true:

1. **Hard to reverse**: The cost of changing your mind later is meaningful.
2. **Surprising without context**: A future reader will look at the code and wonder "why on earth did they do it this way?"
3. **The result of a real trade-off**: There were genuine alternatives and you picked one for specific reasons.

If a decision is easy to reverse, skip it: you'll just reverse it. If it's not surprising, nobody will wonder why. If there was no real alternative, it's a constraint, not a decision.

## Template

```md
# [Short Title of the Decision]

- **Status:** [proposed | accepted | deprecated | superseded by 000X-slug.md]
- **Date:** [YYYY-MM-DD]

## Context & Decision
[1-3 sentences: what was the context, what did we decide, and why.]

## Consequences
- Positive: [Key benefits]
- Trade-offs: [Costs or rejected alternatives worth remembering]
```

An ADR can be brief. The value is in recording *that* a decision was made and *why*, not in filling out bureaucratic paperwork.

## Numbering
Scan `design/decisions/` for the highest existing number and increment by one (e.g., `0001-slug.md`).
