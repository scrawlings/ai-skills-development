---
name: plot-seed
description: Pinpoint a canon truth, fragment, or spark and turn it into a ready-to-write passage prompt. Scans world/index.md, fragments/index.md, and ideas/sparks.md for material with narrative tension, then produces a prompt (premise, truths, characters, POV/tense, suggested placement) that write-passage can consume directly. Load when the user wants an idea, a passage prompt, or to turn a piece of world-building into a scene.
---

# Plot Seed

Bridge world-building to narrative: pick an element of the world (or a loose fragment/spark) and turn it into a concrete passage-writing prompt.

## Location

Everything here is relative to the **fiction root**.

## Steps

1. **Determine the seed.** The user names a truth, fragment, or idea, or asks for a suggestion. If suggesting, scan in order:
   - `ideas/sparks.md` — unused one-line seeds.
   - `fragments/index.md` — unplaced passages that could seed or be reused.
   - `world/index.md` — truths with built-in tension, cost, or conflict (especially `[proposed]`/`[contested]` ones worth testing).

2. **Pick the element.** Prefer material with narrative tension: a cost, a conflict, a contradiction, an unanswered question, or a character with a problem.

3. **Compose the prompt.** Make it directly consumable by `write-passage`:

   ```markdown
   **Passage prompt**
   - Premise: Elara discovers the memory-price of magic mid-spell.
   - Truths in play: canon/magic-system#mana-cost, canon/characters#elara
   - Characters: Elara (POV), a witness
   - POV / tense: third-limited / past
   - Genre: fantasy
   - Suggested placement: fragment (or book:<book> if a beat exists)
   ```

4. **Present and hand off.** Show the prompt, and offer to run `write-passage` immediately. If a fragment was reused as the seed, note its `id` so it stays linked.

5. **Report.** Summarize: the element chosen, why it has tension, and the resulting prompt.
