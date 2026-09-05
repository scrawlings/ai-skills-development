---
name: code-exploration
description: Use when requirements are unclear, a technique is unproven, or the value of an approach can only be known by trying it. Governs spikes and prototypes so their code stays honestly separate from the system, their findings survive even when their code doesn't, and their default bias toward addition is actively resisted.
---

# Code Exploration

Exploration answers a question code-planning cannot yet ask cleanly: not "what
should we build," but "would this even work, and what would it cost." It
produces a verdict and a body of learning. It does not, by default, produce
production code — graduation is a distinct, deliberate step (see below), not
something that happens by the prototype quietly staying in place because it
ran.

This skill exists because the failure mode is not lack of discipline in the
abstract — it is that discipline collapses at a predictable moment: the moment
a prototype starts working. That moment should be anticipated and designed
around, not relied on willpower to survive.

Exploration mode is entered deliberately, not defaulted into. A request that
reads as an open question invites it; a specific, literal instruction does
not, however cheap a generalisation would be to build (see code-planning's
"reversibility justifies trying, not scope"). Confusing an ordinary,
well-specified ticket for an invitation to explore is its own small version
of scope creep — it just wears exploration's more forgiving language.

## Commit to the fate before you know the outcome

Before writing exploratory code, decide and record what happens if it works:
rewritten behind a seam, test-first, from scratch. Decide this while the
outcome is still unknown, because it cannot be decided well afterward — a
working prototype is not a neutral witness to its own fate. Treat this
decision the way a ticket records constraints: written down, and binding,
precisely because the moment it is tested is the moment it is hardest to
honour.

## Keep exploration structurally separate

Exploratory code must never be wired directly into a production seam.
Wiring it in to make it work is exactly what makes deletion expensive later —
not because the logic is bad, but because it has become entangled with
everything around it.

- Give exploration its own space (a clearly named directory, module, or
  branch) so it is never ambiguous whether code is exploratory or trusted.
- Stub or duplicate just enough of the surrounding shape — fixtures, fake
  config, a throwaway entry point — so the prototype runs standalone. This
  costs more upfront and pays for it entirely at the point of graduation or
  deletion, when there is nothing to disentangle.
- If a spike must touch a real seam to be informative (a genuine
  performance test against production data, for instance), name that
  explicitly as an exception and put a removal step in the same ticket that
  authorised it.

## Prototype lock-in is a named bias, not a moral failing

When a prototype works, the pull to keep it — rather than rewrite it
properly — is strong and predictable. Name it when it happens: *"the
temptation to add tests around what's here, instead of rewriting behind a
seam, is the tell — not a reasonable shortcut."* Naming the bias in the
moment is more effective than a general principle recalled after the fact.

If discipline still fails and the prototype is kept, that is a decision, not
a drift — record it as a ticket the way any deliberately-accepted imperfection
is recorded (see code-review), including why the shortcut was taken this
time.

## Archive, don't just delete

Deleting a working prototype outright asks a lot of whoever must do it — it
looks like destroying proof that the idea works. Prefer instead:

- Tag or branch the exploration as reference material. It is kept, but kept
  *out of the way* — nothing is lost, but nothing is inherited by default
  either.
- Graduation means a genuine test-first rewrite against a properly designed
  seam (see code-implementation), consulting the prototype as evidence and
  reference, not extending it in place. The knowledge survives; the code
  does not.

## Graduation criteria

Exploratory code earns production status at a deliberate point, not by
default continuation. Treat any of these as a trigger to stop and decide,
not as silent permission to keep going:

- A second, unrelated use case would benefit from it.
- Other work is about to be built *on top of* it, rather than beside it.
- It is about to be relied on for a real decision, deployment, or user-facing
  behaviour.

At that point, open a ticket the normal way (see code-planning) and rewrite
test-first (see code-implementation), using the exploration as reference.

## Graduation is where a premise is born

A spike rarely knows its own premise until it has succeeded — what must
remain true for this approach to still make sense is usually invisible
during exploration and only becomes nameable once the thing works. Write
that premise down explicitly as part of accepting the work, not as an
afterthought (see code-legacy). This is the cheapest moment to capture it:
before graduation there is no accepted decision yet to have a premise, and
after graduation the reasons that made it feel obviously right start to fade
from memory in the normal way reasons do.

Graduation is also, structurally, a seam being born into a system that
didn't have it before — and every seam around it may need to resettle in
response, over subsequent, unrelated work, exactly as after any other
structural surgery (see code-legacy). Expect this; it is not a sign the
graduation was done badly.

## Test-first is suspended, not abandoned

Exploration is exempt from test-first while its purpose is still "find out
if this is worth doing" — writing tests for code whose shape may be wrong
in an hour is often wasted motion. This exemption ends at graduation:
production code arising from a spike is written test-first like any other
ticket, from the seam, not accumulated from what the spike already had.

Cheap, throwaway checks during exploration (a script that prints instead of
asserts, an ad hoc data sample) are fine and do not need to survive.

## Dead ends are findings, not failures

A spike that doesn't work is not wasted time — the negative result is real
information, and it is cheap to capture at the moment of abandonment and
expensive to reconstruct later.

- Before deleting or archiving a dead-end spike, write a short note: what was
  tried, why it didn't work, and what would need to be true for it to work.
  This is the same instinct as code-implementation's "spawning new tickets" —
  hard-won information should not be silently lost.
- Where the dead end reveals something about the system, not just the
  approach (a real constraint, a false assumption in the plan), raise it to
  the master plan as an ADR, not just a note on the abandoned ticket.

## Additive drift

Beyond the psychology of a single prototype, both human and AI-assisted
coding share a quieter bias: the default move is always to add, rarely to
remove. It is worth naming as its own failure mode, separate from prototype
lock-in.

**A good day's work sometimes has a negative line count.** Senior teams have
long treated this as a private joke and a real signal — if a diff only ever
grows, ask whether anything should have shrunk alongside it.

This bias is structural, not just habitual, and it is often stronger in
AI-assisted work than human work:

- Addition is locally verifiable — reasoning about new code is bounded.
  Removal requires reasoning about everything that might depend on what's
  being removed, which is a wider search and easy to avoid under pressure.
- Most training exposure is additive; the statistical shape of "a plausible
  next change" skews toward adding, not consolidating.
- The visible task (make the test pass, ship the feature) has no built-in
  signal for the invisible task (don't leave three ways to do this).

Counter it structurally, not by reminder alone:

- Make "what does this change make redundant, and has it been removed"
  a standing question in every review (see code-review), not an occasional
  nice-to-have.
- Where the project runs strict typing and a full test suite (see
  code-python-style, code-quality), deletion safety is genuinely cheap to
  check — run the suite, trust the result. State this explicitly so an
  agent does not default to "leaving it in, just in case" when the case can
  actually be checked.
- When a ticket's implementation notes are written (see code-implementation),
  ask what shrank as well as what grew. Naming it after the fact keeps the
  bias visible even when it wasn't resisted in the moment.

## Relationship to code-legacy

Exploration and legacy management share the same core commitment: capture
learning honestly, even when the code or the certainty behind it doesn't
survive. They differ in timing. Exploration captures learning at the moment
a spike is abandoned or graduated — the verdict is known now. code-legacy
captures learning that arrives later, sometimes long after code was accepted
and trusted, when a premise nobody was questioning quietly stops holding.
Graduation is the handoff point between them: it is where exploration ends
and the graduated code's life as ordinary, premise-bearing, eventually-legacy
code begins.
