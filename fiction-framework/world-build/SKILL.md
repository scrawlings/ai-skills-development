---
name: world-build
description: Expand the world bible by adding a new canon truth. Determines the right canon domain file, drafts the truth as [proposed] with cross-references, flags conflicts with existing truths, and updates the index and open-questions. Load when the user wants to add, create, or invent world lore, such as a magic-system detail, a culture, a place, a historical event, or any new world fact.
---

# World Build

Add new truths to the world bible. New canon always enters as `[proposed]` and is promoted deliberately — never silently.

## Location

Everything here is relative to the **fiction root** (the directory containing `world/`, `stories/`, and `fragments/`). See the world-bible skill for canon conventions.

## Steps

1. **Determine the domain.** Choose the `world/canon/<file>.md` the truth belongs to (cosmology, magic-system, geography, history, cultures, characters, languages, bestiary, …). Create the file if the domain is new.

2. **Read context.** Read the target file plus related domains, so the new truth cross-references what already exists and doesn't duplicate it.

3. **Draft the truth.** Add a headed section; put the status tag at the start of the first line, defaulting to `[proposed]`:

   ```markdown
   ## Mana Cost
   [proposed] Casting magic is paid in memory: each spell erases a memory proportional to its power.
   ```

   Cross-reference related truths inline with `[[canon/<file>#<anchor>]]`.

4. **Check for conflicts.** If the new truth contradicts an `[established]` truth:
   - Do not silently override.
   - If the user is deliberately re-deciding, mark the old truth `[superseded]` (keep it) and point to the new one.
   - If it's genuinely undecided, mark the new truth `[contested]` and note both sides.

5. **Update the index.** Add the truth to `world/index.md`: `- <topic> → canon/<file>#<anchor>` with a one-line summary and its status.

6. **Record open questions.** If the truth raises unanswered questions, append them to `world/open-questions.md`.

7. **Report.** Summarize: the new truth reference and status, cross-references, any conflicts handled, and new open questions.
