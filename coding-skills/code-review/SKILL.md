---
name: code-review
description: Inspect completed changes against their purpose, recognise good and bad code, recommend improvements, and communicate feedback so it produces the right response.
---

# Code Review

Review reflects on finished changes and their impact, in the light of the changes' purpose, and makes that reflection available so the work can be revised or accepted.

A review should produce one of:

- a challenge to a significant problem,
- a comment on an opportunity to improve,
- a brief note that the change was considered and is fine to continue with.

Review may be **re-review**, after an earlier round led to changes. Re-review notes what changed and why any earlier feedback was not acted on. Imperfect code is sometimes allowed through; when it is, record the decision as future work or as a stated principle of what is acceptable here.

## Stances

- The same session that made the changes, once it considers them complete.
- A fresh session pointed at the changes, ideally a different model family, with a clear scope. A fresh reviewer is stronger because its judgement is not coloured by the act of writing. This is why coders should record choices invisible in the code (options considered and rejected); the reviewer can still challenge the reasoning and inconsistencies in that documentation.
- A human reviewer stepping in at a checkpoint.

Cues: "make a review of this code" asks for a review; "can you check it again" signals re-review; "prepare a review" suggests the review will be fed back to the coding agent rather than to a human.

## What to inspect

- **Purpose.** Did the change solve the root problem within the constraints? Where a fix is warranted, suggest a specific test that locks the problem and constraints in as code.
- **Interactions.** Code outside the stated scope is treated loosely, but the change's effects on that code are in scope. A significant problem outside the scope is worth raising, though not flagged as seriously for this review.
- **Good vs bad.** Distinguish well-structured code from badly-structured code (see code-quality: units, seams, locality, affordance). Comments that explain *how to use* something are a smell — the fix is usually a better seam or type, not more comment.
- **State.** Look for mutation and life-cycles of data; unexpected states often come from changes in one place meeting changes in another.
- **Trade-offs.** A recommendation may improve one property while harming another. Name the trade-off; offer a preferred option and say what the alternatives buy. Expect some of these to be rejected, and do not repeat them within the same cycle.

## How to communicate feedback

- Feedback must serve a purpose; it proposes work, and work must have value.
- Code snippets are often more precise than words, but always explain *why* the change is recommended. Never just say "change this".
- For changes that improve unit depth, cohesion, or make an interaction express its semantic purpose, explain the purpose and how to achieve it.
- Where a recommendation can be expressed as a test, or as the direction of a test, do so — especially for risks at the intersection of new code and old.

## Reviewing for humans

Human processes can be intuitive and appear inconsistent. Treat human feedback as an example to be extended to similar situations. When a human edits code to show the change they want, take it seriously: incorporate and extend it in their style and intention.

Tone matters; coding is hard and may be part of the human's livelihood.

- **Mechanical, local changes** (consistency, renaming toward the glossary): neutral, checklist-style framing; make them easy to fix.
- **Substantial changes**: frame as options — explain the alternatives, name your preferred one, and say why the others might be valued. Be open to a different choice at re-review.
- **Lower-impact or style comments**: prompt with a question, so the author discovers the opportunity by reflection rather than feeling they missed something.

Diagrams (mermaid, tables) are neutral and effective when the feedback concerns relationships between elements.

## The review cycle

The loop is: code → review → respond (incorporate or reject) → re-review → … → new work.

- In re-review, the reviewer should have the earlier reviews; if they are unavailable, say so, because rejected feedback may otherwise be repeated.
- Keep the purpose of the work in sight. Quality and delivery both matter; an expensive quality bar that delays delivery is itself a cost.
- When acting on review, remember the review itself will be lost to future readers. Make sure the code, tests, and documentation still explain *why* the code is as it is — through names and structure where possible, comments only for "why", and documents for choices with no natural place in code (such as large options considered and rejected).
- Pushing back on review feedback is acceptable, with a reason, ideally made visible in the code. Better names and structures are a good way to answer a review. Comments should explain "why", but code that speaks for itself is better still.
