---
name: plot
description: Outline a work (book, section, or chapter) into acts and beats with turning points. Reads relevant canon, existing fragments, sparks, and backlog; writes stories/<book>/outline.md (or a short-story outline) with beats that cite canon truths and reuse unplaced fragments. Load when the user wants to plot, outline, or structure a story.
---

# Plot

Turn a premise into a beat-by-beat outline. The outline is the plan that `plot-seed` and `write-passage` later expand into passages.

## Location

Everything here is relative to the **fiction root**. See the story-structure skill for the narrative hierarchy.

## Steps

1. **Determine target and scope.** The work (`book:<book>` or `story:<title>`) and the scope (whole work, one section, or one chapter). Create the work directory if new.

2. **Gather material.** Read:
   - Relevant canon (`world/canon/…`) for the premise.
   - `fragments/index.md` for reusable unplaced passages.
   - `ideas/sparks.md` and `ideas/backlog.md` for seeds and loose threads.
   - `craft/genre/<genre>.md` for the genre's expected structure and beats.

3. **Draft the outline.** Structure into acts (or the genre's equivalent), each with beats. Each beat names the passage-level scene it will become, cites the truths in play, and reuses a fragment when one fits:

   ```markdown
   # <Title> — Outline
   genre: <genre>
   premise: one sentence

   ## Act One
   1. **The First Conjuring** — Elara casts for the first time and pays a memory.
      Refs: canon/magic-system#mana-cost; fragment: elara-first-conjuring

   ## Act Two
   2. …

   ## Threads
   - loose thread → note for ideas/backlog.md
   ```

4. **Note implications.** If a beat implies a new truth or question, record it in `world/open-questions.md`. If a beat leaves a loose thread for later, add it to `ideas/backlog.md`.

5. **Report.** Summarize: acts/beats, truths relied on, fragments reused, and anything left open.
