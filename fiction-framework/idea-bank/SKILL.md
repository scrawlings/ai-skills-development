---
name: idea-bank
description: Capture and track future work. loose threads, sequel hooks, and expansion ideas (ideas/backlog.md) plus one-line seeds (ideas/sparks.md). Links ideas to canon refs and passage ids, and surfaces the best next thing to work on. Load when the user wants to save, list, or prioritize ideas, or asks "what should I write next?"
---

# Idea Bank

The memory for future work. Holds seeds and loose threads; plot and plot-seed draw from here.

## Location

Everything here is relative to the **fiction root**.

## Files

- `ideas/sparks.md` — one-line seeds, one per line.
- `ideas/backlog.md` — larger future-work items with status and links.

## Capturing a spark

Append a line to `ideas/sparks.md`:

```markdown
- <one-line idea> (refs: canon/…, fragment:<id>)
```

## Capturing a backlog item

Append a section to `ideas/backlog.md`:

```markdown
## <Title>
- Status: [later | next | someday]
- Links: canon/magic-system#mana-cost, fragment:elara-first-conjuring
- Notes: <what the idea is, why it matters, what it could become>
```

## Harvesting loose threads

When plotting or writing produces a thread for later (a hinted sequel, an unexplained detail), file it here with a link back to the passage id or outline beat that created it.

## Surfacing next work

When asked "what should I work on next," scan in order and report 3–5 candidates with a one-line rationale:

1. `ideas/backlog.md` items marked `next`.
2. `ideas/sparks.md`.
3. `fragments/index.md` (unplaced passages that could be slotted or expanded).
4. `world/open-questions.md` (world gaps worth resolving).

## Rules

1. Ideas link to the canon truths and passage ids they touch — never leave a dangling reference.
2. Capturing an idea is cheap; committing to it is not. Status stays `later` until the user promotes it.
