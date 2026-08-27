---
name: canon-check
description: Verify a passage, outline, or idea against the world bible. Resolves every canon ref (canon/<file>#<anchor>), flags dangling refs, contradictions with [established] truths, reliance on [proposed]/[contested] truths, and extracts implied new truths or open questions. Load when the user wants to check consistency, fact-check a scene, or validate an idea against canon.
---

# Canon Check

Check narrative content against canon: do the refs resolve, and does the content respect the world's truths?

## Location

Everything here is relative to the **fiction root**. A ref `canon/<file>#<anchor>` resolves to the file `world/canon/<file>.md` and the slugified heading `<anchor>`.

## Quick check

Run the bundled script to verify every ref resolves:

```bash
.agents/skills/canon-check/scripts/check.sh <path-to-passage.md>
```

Set `FICTION_ROOT` to override the fiction root if needed.

## Steps

1. **Identify the target** (a passage file, outline, or idea) and collect its `refs` (frontmatter) plus any inline `[[canon/…]]` mentions.

2. **Resolve refs.** For each ref, confirm the file `world/canon/<file>.md` exists and the heading slug exists. Flag any dangling refs.

3. **Read the truths.** Read the referenced truths and any surrounding canon the content touches.

4. **Check consistency.**
   - Contradicts an `[established]` truth → report as a blocker.
   - Relies on `[proposed]` or `[contested]` truths → report as "not yet binding."
   - Uses a `[superseded]` truth → report and point to the replacement.

5. **Extract implications.** If the content implies a new truth or an unresolved question, note it and offer to append to `world/open-questions.md` (or run world-build).

6. **Report.** Format:

   ```markdown
   **Canon check: <id/path>**
   - Refs: N ok, M dangling (list them)
   - Contradictions: (list, with the truth each breaks)
   - Non-binding truths relied on: (list)
   - Implied truths / open questions: (list)
   - Verdict: clean | needs fixes | needs world decisions
   ```
