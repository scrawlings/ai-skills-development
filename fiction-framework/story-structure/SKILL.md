---
name: story-structure
description: The narrative structure of the fiction workspace, how passages are filed into books (passage→chapter→section→book) and short stories, the passage frontmatter schema (id/placement/kind/status/refs), and the slot and lift procedures for moving fragments into or out of works. Load when creating, filing, moving, or re-organizing narrative passages.
---

# Story Structure

Narrative text is made of **passages** — the atomic unit. Passages are filed into works (books, short stories) or left free-floating in `fragments/`. A passage's identity (`id`) is independent of its location, so it can move freely between them.

## Location

Everything here is relative to the **fiction root** (the directory containing `world/`, `stories/`, and `fragments/`).

## Hierarchy

```
stories/
  books/<book>/outline.md
  books/<book>/sections/s<n>/chapters/c<n>/passages/<NNN>.md
  short-stories/<title>/passages/<NNN>.md   (+ optional outline.md)
fragments/
  <date>-<slug>.md        # free-floating, unplaced passages
  index.md                # derived index of unplaced passages
```

- Passage → chapter → section → book (books).
- Passage → short story (short stories).
- Passage → fragment (unplaced).

## Passage frontmatter

```yaml
---
id: <stable-slug>          # required; never changes once set
title: "Human-readable title"
placement: unplaced        # unplaced | book:<book> | story:<title>
kind: scene                # scene | exploratory
status: draft              # draft | revised | final
pov: <character>           # or omit
tense: past                # past | present
refs: [canon/<file>#<anchor>, …]
genre: <genre>             # matches craft/genre/<genre>.md
---
```

- **`id`** — permanent identity. Outlines, canon "appears in" notes, and the backlog reference the id, never the file path.
- **`placement`** — the work this passage belongs to, or `unplaced`. The precise chapter/section is encoded by the file path, not this field.
- **`kind`** — `scene` (intended narrative) or `exploratory` (written to explore the world; may never be placed).
- **`status`** — `draft` → `revised` → `final`.

## File naming

- Fragments: `<date>-<slug>.md`, e.g. `2025-01-12-elara-first-conjuring.md`.
- Placed: `<NNN>.md` inside the chapter's or short story's `passages/` dir (sequential within that dir). Ordering comes from the filename; identity comes from `id`.

## Slot (fragment → work)

Move a fragment into a planned work:

1. Confirm the target beat/location in the work's `outline.md` (see the plot skill).
2. Move the file from `fragments/` to `stories/books/<book>/sections/s<n>/chapters/c<n>/passages/<NNN>.md` (or `stories/short-stories/<title>/passages/<NNN>.md`), assigning the next `<NNN>`.
3. Update `placement:` to `book:<book>` or `story:<title>`.
4. Keep `id` unchanged. Re-check the passage against canon (canon-check skill) and note the slot in the outline.
5. Regenerate `fragments/index.md`.

## Lift (work → fragment)

Move a placed passage out of a work:

1. Move the file to `fragments/<date>-<slug>.md`.
2. Set `placement: unplaced`.
3. Keep `id` unchanged. Note the removal in the outline, if the work had one.
4. Regenerate `fragments/index.md`.

## Fragments index

`fragments/index.md` lists every unplaced passage with its `id`, title, `kind`, `refs`, and a one-line summary. Regenerate it after any create/slot/lift. The plot and plot-seed skills consult it to reuse loose material.

## Rules

1. One scene per passage. If a passage contains two scenes, split it.
2. Identity (`id`) is permanent; location and `placement` are not.
3. A fragment with `kind: exploratory` is still a passage — same frontmatter, and it can be slotted later or left as canon-exploration.
