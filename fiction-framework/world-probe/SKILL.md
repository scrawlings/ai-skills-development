---
name: world-probe
description: Generate probing questions and prompts to stress-test and deepen the world bible. Reads canon and open-questions.md, then produces targeted questions aimed at gaps, contradictions, implications, costs, edge cases, and cultural variation. Load when the user wants prompts, questions, or new angles to refine their world-building.
---

# World Probe

Generate questions that probe the world and expose where it is thin, inconsistent, or unexplored. This is the "give me prompts to refine my world" skill.

## Location

Everything here is relative to the **fiction root**. See the world-bible skill for canon conventions.

## Steps

1. **Determine scope.** The whole world, one domain (e.g. magic-system), or one truth. If unspecified, prefer `world/open-questions.md` as the starting point, then the domain with the most `[proposed]` or `[contested]` truths.

2. **Read the relevant canon.** Read the scope's canon files and `world/open-questions.md`.

3. **Generate questions.** Aim at, in rough priority order:
   - **Gaps** — what the canon doesn't specify but would matter in a story.
   - **Contradictions** — truths that don't fit together.
   - **Implications** — consequences of a truth nobody has worked out yet.
   - **Costs & limits** — what a power, society, or place costs, and what it can't do.
   - **Edge cases** — "what happens when…" boundary situations.
   - **Variation** — how different cultures, classes, or regions experience the truth.

   Write each as a specific, answerable question, not a vague prompt.

4. **Present and record.** List the questions, each tagged with the truth it probes. Offer to append them to `world/open-questions.md` (or append on request). Do not answer them here — that is world-refine's job.

5. **Report.** Summarize the strongest 3–5 questions and where the world is thinnest.
