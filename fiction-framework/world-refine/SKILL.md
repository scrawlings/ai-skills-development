---
name: world-refine
description: Refine existing canon in the world bible. Revises a truth's wording, resolves a contradiction, merges contested truths, or answers an open question; promotes status ([proposed]→[established]) and records a change note, marking replaced truths [superseded]. Load when the user wants to improve, fix, decide, or tighten world lore, or answer a question from open-questions.md.
---

# World Refine

Tighten existing canon: revise wording, resolve contradictions, decide contested truths, answer open questions. Refinement changes status deliberately and keeps history.

## Location

Everything here is relative to the **fiction root**. See the world-bible skill for canon conventions.

## Steps

1. **Locate the target.** Find the truth by reference (`canon/<file>#<anchor>`) or by an entry in `world/open-questions.md`.

2. **Read context.** Read the truth, its cross-references, and any related open questions.

3. **Make the change.**
   - Revise wording in place.
   - Resolve a contradiction by settling on one truth and marking the loser(s) `[superseded]` with a note pointing to the winner.
   - Merge `[contested]` truths into one `[established]` truth (mark the others `[superseded]`).
   - Answering an open question usually means editing a truth to make the answer explicit.

4. **Update status.** Promote `[proposed]` → `[established]` only when the truth is settled and binding. Never demote an `[established]` truth silently — supersede it and keep the old entry.

5. **Record a change note.** Append a dated line to the truth:

   ```markdown
   > Changed 2025-01-13: resolved with [[canon/geography#the-ashfall]] — price is now memory, not years.
   ```

6. **Update the index and open questions.** Refresh `world/index.md` summaries/statuses, and remove questions from `open-questions.md` that are now answered.

7. **Report.** Summarize: what changed, old vs new status, superseded truths, and questions closed.
