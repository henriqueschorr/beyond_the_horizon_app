# GLOSSARY.md Format

The project glossary lives in `design/GLOSSARY.md`.

## Structure

```md
# Domain Glossary

## Language

**Order**:
A customer request for delivery of goods.
_Avoid_: Purchase, transaction, booking

**Subscriber**:
An individual who has opted into receiving published communications.
_Avoid_: User, member, account
```

## Rules

- **Be opinionated.** When multiple words exist for the same concept, pick the best one and list the others under `_Avoid_`.
- **Keep definitions tight.** One or two sentences max. Define what it IS, not what it does.
- **Only include terms specific to this project's context.** General programming concepts (timeouts, error types, utility patterns) don't belong even if the project uses them extensively. Before adding a term, ask: is this a concept unique to this domain, or a general programming concept? Only the former belongs.
- **Alphabetize terms** within the language section to keep lookups effortless.
