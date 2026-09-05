---
name: code-quality
description: Use when the next step of an implementation plan is ready to produce code. Defines the structures that make code testable, locally extensible, and semantically self-describing.
---

# Code Quality

Code quality is the set of structural properties that make code safe to change: it can be tested, it can be extended locally (small blast radius), and it expresses its own meaning. It is pursued while coding — test first, keep units and seams clear, and let code speak for itself.

## Units and seams

Code is organised into **units** with **seams**.

A **unit** bundles closely-coupled code:

- The code is understood as a whole and has no sensible use in isolated parts.
- Splitting it in two would create about as many calls between the new units as within them.
- It agrees internally on the meaning of state and the progress through a process.

A **seam** is the small set of entry points into a unit:

- It expresses what a caller can ask the unit to do, in the caller's terms.
- It hides how the unit does it.
- It is narrow compared to the code behind it, so a simple call can fan out into extensive work.

"Call a unit" means "call a function at its seam".

A seam that feels wrong on inspection is not always a quality problem to fix
by restructuring. Sometimes the seam is well-drawn for reasons that no longer
hold — the code around it changed, or the world it was modelling moved on.
Restructuring a seam without asking why it was shaped this way risks losing
information the shape was quietly encoding. When a seam feels awkward and
nothing in the current change explains why, treat that as a candidate for
code-legacy's drift-noticing practice before reaching for a structural fix.

## Structures that keep change local

- **Locality.** Code that belongs together changes together. Watch for: the same few files changing for many loosely-related reasons; small changes touching many, superficially unrelated files.
- **Placement.** A function in one unit that is only ever called by another unit probably belongs in its caller. Exception: a unit whose members all share a resource (such as a persistence layer) may hold functions nothing else calls.
- **Clusters.** When units cluster, and outside callers use only a few entry points, place them in a sub-directory behind a single coordinating seam. Route all access through that seam — no backdoors.
- **External systems.** Keep a clear seam between the core and external systems (http, database, files) so the external system's semantics do not entangle the core. It should be possible to produce valid data without round-tripping it through the external system.
- **Dependency injection.** Inject across a boundary when the dependency varies, has side effects, or crosses a system boundary. Do not inject merely because you extracted a cluster of cohesive utilities — a plain import is the right seam there.

## Structures that cut off future errors

- **Affordance.** Make it easy to use code correctly and hard to use it wrongly. Prefer interfaces where incorrect input is impossible over interfaces that reject it at runtime. Comments explaining *how to use* something are a sign that affordance is missing.
- **State.** Prefer representing valid states directly, so invalid states cannot be expressed. Many errors come from code left in an unexpected state as it changes over time.
- **Brevity.** Do not use many lines when one will do. Repeated lines — including structurally-repeated lines with different names — should be extracted into a named supporting function. A good name reveals meaning to later coders and agents.
- **Patterns.** When the same shape recurs, extract the common part and pass the variations as inputs. This shares algorithms and keeps handling (error handling, logging) consistent.

## Semantics in the code

- **Ubiquitous language.** Use the language of the user and domain experts. Avoid synonyms and do not invent terms. Keep a term's meaning consistent, especially when it names a process — humans describe processes loosely, and diverging from their intent forces every later reader to translate between intended meaning and implementation.
- **Modelling process.** Process is more than one line after another. Named states, through to the Interpreter Pattern, represent process and bring the glossary into the code.

## Testability and test-first

Write the test before the implementation. The test states the intention of the change, at a seam.

- At first the test will not run, because the seam does not exist yet. That is expected, not done.
- Add the minimal surface of the seam — returning a wrong value, not raising — so the test runs.
- Confirm the test now **fails on its assertion for the expected reason**. An `ImportError` or `NotImplementedError` is not a real red; the assertion must run and fail.
- Implement the minimum to make it pass.

A good test:

- Passes only if the implementation does what was intended.
- Fails in future only if that intention has been compromised.
- Calls a single seam, even if the code behind it uses other units. If a test must coordinate several units, that points to a missing coordinating unit; test that unit's seam instead.
- For a very small program, the only testable seam may be the whole program running; test it as a whole, but still test first.

Avoid mocking except where an externally-mandated sequence of calls is itself a requirement.

## Keeping tests rational

- Lock intention, not rendering. A test that fails when a message is reworded
  or a list is reordered has locked wording, not behaviour. Keep exact-output
  assertions to the seam where output *is* the contract (a CLI's user-facing
  text), and there prefer a few representative cases over one test per command
  and error path.
- Prefer asserting domain state and return values — what changed — over how it
  was phrased. Regressions live in behaviour, not prose.
- When a handler only renders another unit's result, test the other unit
  thoroughly and the handler lightly; the handler's job is to call the right
  seam.

## Further tests

- Tests can be written later; when intersecting work produces valuable behaviour, a test is the way to preserve it.
- When several steps or tickets together deliver coherent behaviour, the test for that whole may have no natural home in one ticket. Add it to the last ticket, or as its own task.
- Higher-level specifications may call for their own tests: business requirements (conformance to a standard), user journeys (end-to-end), internal standards (for example, that every operation logs in a required way), or coding standards (for example, that thrown exceptions are caught and translated close to the throw). The last two may run alongside linters.
