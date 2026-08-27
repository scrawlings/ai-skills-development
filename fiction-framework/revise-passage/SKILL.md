---
name: revise-passage
description: Review and revise an existing passage for style consistency, genre fit, continuity, and canon adherence. Reads the passage alongside the style guide, genre sheet, canon refs, and neighboring passages in the same work; edits prose and advances status (draft→revised→final). Load when the user wants to edit, polish, rewrite, or review a passage.
---

# Revise Passage

Revise a draft passage. Builds on canon-check (facts) and craft-style (voice/genre), then fixes the prose.

## Location

Everything here is relative to the **fiction root**.

## Steps

1. **Locate the passage** by id or path.

2. **Gather context.** Read the passage, `craft/style-guide.md`, the genre sheet, and the canon refs. Run the canon-check script for ref resolution. Read neighboring passages in the same work (same chapter / adjacent `<NNN>`) for continuity.

3. **Evaluate.**
   - Style: voice, tense, POV, rhythm, forbidden words.
   - Genre: obligatory scenes, tropes, promise.
   - Continuity: timeline, character state, details carried between passages.
   - Canon: contradictions with `[established]` truths.

4. **Revise.** Edit the prose in place. Keep the `id` and `placement` untouched. Do not silently change canon — if the fix needs a world decision, record it in `world/open-questions.md` instead of inventing.

5. **Advance status.** `draft` → `revised` when the prose is clean; `revised` → `final` only when explicitly approved. Leave `draft` if more work remains.

6. **Report.** Summarize the changes by category (style / genre / continuity / canon) and any open questions raised.
