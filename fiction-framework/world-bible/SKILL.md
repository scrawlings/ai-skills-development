---
name: world-bible
description: The schema and conventions of the world bible (world/canon/). Teaches truth reference syntax (canon/<file>#<anchor>), truth status tags ([proposed]/[established]/[contested]/[superseded]), and index upkeep. Load before reading, creating, or referencing canon truths for any world-building, plotting, or writing task.
---

# World Bible

The world bible holds the **canon**: the set of truths shared across every work set in this world. It is deliberately story-agnostic — books and short stories draw on it but never define it.

## When to use this skill

Load this skill whenever a task involves canon: reading truths to ground a passage, adding new truths, refining existing ones, or checking a passage against canon.

## Location

Everything here is relative to the **fiction root** (the directory containing `world/`, `stories/`, and `fragments/`).

```
world/
  canon/               One file per domain
  index.md             Derived topic → truth index (regenerate, don't hand-edit)
  open-questions.md    Unanswered canon questions
```

## Truth entry format

A truth is a section under a heading. The heading text defines the anchor; the status tag defines its state.

```markdown
## Mana Cost
[proposed] Casting magic is paid in memory: each spell erases a memory proportional to its power.
```

- **Anchor** = slugified heading: `Mana Cost` → `mana-cost`, `The Fall of Ash` → `the-fall-of-ash`.
- **Status tag** = one of `[proposed]`, `[established]`, `[contested]`, `[superseded]`, at the start of the truth's first line.

## Truth reference syntax

Reference a truth as `canon/<file>#<anchor>`:

- Inline in prose: `[[canon/magic-system#mana-cost]]`
- In frontmatter `refs:` lists: `canon/magic-system#mana-cost`

## Status lifecycle

- `[proposed]` — an idea under exploration; not yet binding.
- `[established]` — canonical; every work must respect it.
- `[contested]` — two or more competing truths; works should avoid committing, or note the ambiguity.
- `[superseded]` — replaced by a newer truth. Keep the entry, add a note pointing to the replacement, and tag it `[superseded]`. Never delete truths; history matters for continuity.

## Index

`world/index.md` maps topics to truth references (e.g. `- memory price → canon/magic-system#mana-cost`). It is derived from the canon files. If missing or stale, regenerate it by scanning every heading in `world/canon/` and listing each truth with its status and a one-line summary.

## Open questions

`world/open-questions.md` collects unanswered or under-specified questions (e.g. "What happens when a caster runs out of memories?"). It is the fuel for the world-probe and world-refine skills. When a passage or idea implies a new truth, record the question here rather than silently adding canon.

## Rules

1. Read the relevant canon files before writing or plotting that touches them.
2. Never silently add canon. New truths enter as `[proposed]` (or a question in `open-questions.md`), then are promoted deliberately.
3. Prefer `[superseded]` over deletion.
4. Keep canon story-agnostic: events or characters that exist only to serve a single work belong in `stories/` or `fragments/`, not canon.
