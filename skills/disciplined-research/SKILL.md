---
name: disciplined-research
description: Use whenever the user asks for a literature survey, citation, source lookup, fact-check, "find the paper on X," research summary, or any report/answer where claims need to be traceable to real sources. Also trigger any time a user-supplied name, title, term, or citation looks approximate, misremembered, or possibly misspelled, and any time you are about to state that something "doesn't exist" or "isn't in the literature." Make sure to use this skill whenever accuracy of attribution matters more than speed — academic research, journalism-style fact-checking, competitive/market research with citations, or any answer the user will cite elsewhere.
---

# Disciplined Research

Guardrails against the common failure modes of AI-assisted literature search and fact-finding. The core problem this skill addresses: AI search is fluent and confident even when its search process was incomplete, and that confidence gets mistaken for verification. Every rule below forces the search process to stay visible and the claims to stay falsifiable.

## Before searching

1. **Split names from concepts.** If the user gives a name/title alongside a topic, search the topic/concepts *first and separately* from the name. Never let a proper noun anchor the query — a misremembered name should not derail a topic search.
2. **Flag uncertainty upstream.** If the user signals they might have a detail wrong ("I think the author was X"), search as if the detail is unknown, then use results to confirm or correct it — don't validate against the wrong anchor.

## During correction / disambiguation

3. **Never silently correct.** If you change a name, term, date, or spelling the user gave you, say so explicitly and ask for confirmation before proceeding on that assumption. Do not just substitute the "nearest known" version and continue as if that's what they meant.
4. **Correct toward the domain, not the dictionary.** When resolving a fuzzy or misspelled term, prioritize matches within the relevant field/topic over generically familiar matches outside it. A rare correct answer in-domain beats a common wrong answer out-of-domain.
5. **Return candidates, not verdicts, when uncertain.** For ambiguous lookups, give a short ranked list of plausible matches with your reasoning, rather than picking one and asserting it.

## Claims about existence / absence

6. **Ban unqualified negatives.** Never state "no such work/source exists." Say "not found in the searches I ran" and name what was actually searched (queries used, sources checked). Absence-of-evidence claims must carry their own scope.
7. **Distrust a fast negative.** A "no results" outcome after 1–2 queries is a weak signal. Before reporting absence, broaden the query (synonyms, adjacent terms, topic instead of name) at least once.

## Verifying claims and citations

8. **Every citation resolves to a live source.** Before including a citation in output, confirm it resolves — real DOI, real URL fetched, or a name+title you can independently verify — not just a plausible-looking string generated from memory.
9. **Check the claim against the actual sentence, not your summary of it.** When citing a specific finding, pull the actual passage and verify the claim matches it — don't paraphrase from a paraphrase.
10. **Prefer primary sources.** Journals, preprints, official data, .gov/.edu — over aggregators, content farms, or SEO-optimized summaries. If only a secondary source is available, say so.

## Coverage and bias

11. **Don't stop at the first page of results.** For open or contested questions, run enough queries to surface disconfirming evidence, not just supporting evidence. Explicitly search for null results or contradicting studies before treating a claim as settled.
12. **Single-source claims get hedged.** If a claim rests on one source, say so ("according to [source]," not "research shows"). Require 2–3 independent sources before stating something as consensus.
13. **Watch for survivorship in search results.** Well-indexed, highly-cited, or recently-published work will dominate results by default — note when this might be biasing the picture, especially for "state of the field" summaries.

## Time-sensitive claims

14. **Don't answer from memory on anything that could be stale** — current role-holders, latest versions, current status of an org/policy/study. Search live rather than relying on training data, and say so if a fact could have changed since your knowledge cutoff.

## Precision

15. **Don't overstate precision the source didn't have.** If a source is approximate, qualitative, or hedged, report it that way — don't convert it into a specific figure or exact quote for the sake of a cleaner-sounding answer.

## Output discipline

When producing a research summary, survey, or report under this skill:
- List what was actually searched (queries or sources) somewhere the user can see it, even briefly.
- Mark any correction made to the user's input.
- Mark any claim resting on a single source or an unresolved citation.
- Do not present a "comprehensive" picture from a narrow search — scope the claim to match the search actually performed.

