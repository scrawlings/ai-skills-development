---
name: code-legacy
description: Use when revisiting accepted, working code — during unrelated nearby work, after a structural change, or when something that was clearly right once now feels awkward. Governs how premises are recorded and rechecked, how drift is noticed rather than just filed, and how a seam's neighbours resettle after one of them changes.
---

# Code Legacy

All accepted code is legacy-in-waiting. It was right for reasons that held at
the time; those reasons decay independently of whether the code still runs
and still passes its tests. This skill is not about code that was written
badly — code-quality and code-review already cover that. It is about code
that was written well, for reasons that have since quietly stopped applying,
with nobody having gone back to say so.

This is a close relative of code-exploration: both are about capturing
learning honestly rather than losing it. Exploration captures learning at the
moment a spike is abandoned or graduated. This skill captures learning that
arrives later, sometimes much later, after the code has long since been
trusted.

## Premise is a first-class, checkable artifact

Every accepted unit of work rests on a premise — what must remain true for
this approach to still make sense. A ticket's `Problem` says what value it
delivers; its premise says *why that value is still there to deliver*. These
are different, and only the second one can go stale while the first stays
answered.

- Write the premise down explicitly when a ticket is accepted, not only its
  problem and constraints. A short sentence is enough: what would have to
  change in the world, the domain, or the system for this decision to no
  longer make sense.
- A premise is not the same as an assumption already listed under `Options
  considered`. Options considered records alternatives rejected *at the time*.
  A premise records what the *chosen* option depends on, checkable at any
  later time, not just at the moment of writing.
- At graduation from an exploration ticket (see code-exploration), write the
  premise explicitly as part of accepting the work into the system. Spikes
  often don't know their own premise until they've succeeded — naming it at
  the moment of graduation is the cheapest time to capture it.

## Noticing drift is a practice, not a filing exercise

The hard part is not recording that a premise has gone stale once you know —
it's noticing at all, since nothing forces the question back into view.
Build noticing into ordinary work rather than treating it as a separate
audit:

- When touching a unit for an unrelated reason, ask once: does this make you
  reconsider why the unit is shaped this way? Most of the time the answer is
  no. When it's yes, that's the moment to check the recorded premise, not
  defer it.
- A unit that keeps attracting small, awkward, hard-to-name adjustments over
  time is a strong tell that its premise — not its implementation — is what's
  actually wrong. Fixing the implementation again will not resolve a stale
  premise.
- Prefer noticing drift yourself, in the course of other work, over waiting
  for it to surface as a bug or an outside complaint. The whole point of
  writing the premise down is to make this cheap to check early.

## Flag stale premises without forcing an immediate decision

When a premise is found to be stale, that is a discovery, not necessarily an
immediate obligation to fix. Separate the two:

- Mark the ticket (or the relevant section of the master plan) as
  **premise flagged: stale** — when, and because of what — without changing
  its `status`. The code may still be `implemented` and correct; only its
  justification has moved.
- Leave a short trace at the affected seam itself, referencing the ticket:
  future readers and refactoring agents need to see this at the point of
  contact, not only in a document they may never open. This is what protects
  a later change from two opposite mistakes — trusting a boundary that's no
  longer justified, or ripping it out without knowing why it was ever drawn.
- A stale premise becomes a real ticket (fix, replace, or formally accept as
  a known compromise) only when someone deliberately picks it up — the same
  way code-planning treats any other piece of future work.

## Revision: value confirmed, premise dead

Flagging a premise as stale (above) is a discovery, and discoveries can sit
unresolved for a while — that's fine, most of the time nobody yet knows if
the thing is even worth fixing. Revision is different: it is what happens
once someone has actively rechecked and confirmed both halves at once — the
persona and journey this ticket traced to (see code-planning) still need
serving, *and* the premise the original approach depended on is confirmed
dead, not just suspected. That combination is a decision, not a flag, and it
should be acted on rather than left to accumulate as one more stale marker.

- Open a revision ticket immediately rather than leaving it flagged. Unlike
  an ordinary stale-premise flag, there is no ambiguity left to wait out:
  the "is it worth doing" question is already answered yes.
- The revision ticket must cite its predecessor explicitly and carry forward
  its dead-end note (see code-exploration) — what was tried, why it stopped
  working, what would need to be true this time. A revision starts with
  unusually good context, and should read that way; it is not a fresh idea
  arriving with no history.
- Treat the retry itself as a normal exploration cycle (see
  code-exploration), even though it is motivated by legacy drift rather than
  a new idea: its own space, its own fresh premise, written down again from
  scratch rather than inherited by assumption from the version being
  replaced.
- Retire the old implementation cleanly before or alongside the retry, the
  same way an abandoned spike is archived rather than deleted outright (see
  code-exploration) — kept as reference, removed from the live seam
  entirely. A retry that half-reuses the old seams because they're already
  there is at risk of inheriting the very shape that was just confirmed
  wrong.
- Expect the removal of the old implementation to trigger its own seam
  resettling (above) before the new attempt is even under way — retiring
  accepted code is structural surgery like any other.

## One learning event can invalidate several units at once

A premise rarely breaks alone. When it breaks, it's often because it was
shared, implicitly, by several tickets or units at once. Treat this as bigger
than any single ticket:

- Record the learning as its own ADR in the master plan, listing every
  ticket or unit that shared the broken premise — not as a patch to each
  ticket's status individually.
- Think of this as a larger-scale version of `Options considered`: the
  option that was chosen has, with hindsight, effectively joined the rejected
  pile — just discovered in reverse, after the fact, rather than argued
  through at the time.

## Seams resettle after structural change — expect a sequence, not one fix

A seam's shape is partly justified by what sits on either side of it — the
units it separates, and what those units currently assume about each other.
Moving or removing one unit means the seams around it were drawn to make
sense of a shape that no longer exists, even if every individual unit
involved is still correct.

- After genuine structural surgery — a unit removed, merged, or
  significantly reshaped — expect neighbouring seams to need their own,
  smaller adjustments over subsequent, unrelated work. This is normal
  settling, not a sign the original fix was incomplete or wrong.
- Each adjustment typically reveals the next one; the full sequence is
  usually not knowable in advance, only opportunistically, as each move
  lands and the next awkward edge becomes visible.
- Where strict typing and a full test suite are in place (see
  code-python-style, code-quality), each small resettling move can be cheaply
  confirmed safe on its own — this is what makes incremental resettling
  survivable rather than risky, and is why it doesn't need to be planned
  upfront as one large piece of work.
- At the point of the original surgery, leave a lightweight marker — not a
  full ticket — on seams likely to be aftershock candidates. This tells a
  future reader working nearby that an awkward-looking seam is a known,
  expected tremor from a deliberate earlier change, not new, undiscovered
  debt.

## Relationship to other skills

- **code-exploration**: shares the instinct that learning must survive even
  when code or certainty doesn't. Exploration captures learning at
  abandonment or graduation; this skill captures learning that surfaces
  later, sometimes long after acceptance.
- **code-quality**: code-quality asks whether a unit and its seams are
  well-structured now. This skill asks whether the reasons behind that
  structure are still true — a stale premise can hide behind a seam that
  still looks perfectly well-drawn.
- **code-review**: a review inspects a specific change against its purpose.
  Noticing drift is broader and untriggered by any specific change — it is
  a background practice applied to code no one is currently proposing to
  touch.
- **code-planning**: stale-premise ADRs and their resulting tickets are
  planned and ordered the same way any other work is (see code-planning) —
  this skill only governs how the drift is noticed, recorded, and flagged
  before it becomes a ticket. code-planning's value trace is what makes
  value-staleness checkable at all — without a named persona and journey to
  go back and ask about, "is this still worth doing" has nothing concrete to
  recheck, and collapses into the same unfalsifiable feeling that made Value
  weak in the first place.
