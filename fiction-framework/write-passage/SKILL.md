---
name: write-passage
description: Write a narrative passage from a prompt or plot beat. Gathers the relevant canon truths, applies the style guide and genre conventions, writes the passage with correct frontmatter (id/placement/kind/status/refs), and files it in fragments/ or stories/. Load when the user asks to write, draft, or sketch a passage or scene.
---

# Write Passage

Write one narrative passage from a prompt or plot beat, grounded in canon and filed correctly.

## Location

Everything here is relative to the **fiction root** (the directory containing `world/`, `stories/`, and `fragments/`).

## Inputs

A writing request provides (or you derive):
- **Where it goes**: a free-floating fragment, or a specific beat in a work's outline.
- **What it's about**: a prompt, beat, or pinned truth.
- **Constraints**: POV, tense, length, genre (default to the style guide when unspecified).

## Steps

1. **Resolve placement.**
   - Unplaced → `fragments/<date>-<slug>.md`, `placement: unplaced`.
   - In a work → `stories/books/<book>/sections/s<n>/chapters/c<n>/passages/<NNN>.md` (next `<NNN>`), `placement: book:<book>`; or `stories/short-stories/<title>/passages/<NNN>.md`, `placement: story:<title>`.

2. **Gather canon.** Read the truth files named by the prompt's refs, plus anything the scene obviously touches (world-bible conventions: `canon/<file>#<anchor>`). Note every truth the passage relies on.

3. **Gather craft.** Read `craft/style-guide.md` (voice, tense, POV, rhythm, vocabulary) and `craft/genre/<genre>.md` if it exists. Follow them.

4. **Write the passage.** One scene, in-scene, matching the style guide. Respect `[established]` truths; never contradict them. If the scene needs a truth that is only `[proposed]`, that is acceptable — cite it and flag it (step 6).

5. **Set frontmatter.** Fill every field:

   ```yaml
   ---
   id: <stable-slug>          # invent once; keep forever
   title: "…"
   placement: unplaced        # or book:<book> / story:<title>
   kind: scene                # or exploratory
   status: draft
   pov: <character>
   tense: past
   refs: [canon/<file>#<anchor>, …]
   genre: <genre>
   ---
   ```

6. **File it and record implications.**
   - Write the file at the resolved path.
   - If the passage implies a new truth or an unresolved question, append it to `world/open-questions.md` (or offer to run world-build). Do not silently add canon.
   - If it was a fragment, add a line to `fragments/index.md`.

7. **Report.** Summarize: the passage id and path, the truths it relied on (with status), any truths it implies, and anything left unresolved.

## Rules

1. One scene per passage; split if it grows into two.
2. Never contradict `[established]` canon; if tension exists, surface it as `[contested]` rather than papering over it.
3. The `id` is permanent — reuse it when the passage is moved or revised; never assign a new one to an existing passage.
4. Stay in-scene and consistent with the style guide's tense and POV.
