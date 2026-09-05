---
name: code-implementation
description: Implementation is the process of writing code based on a plan. When planning conversations have generated enough information the user will want to move on to implementation. Implementation should not be ad hoc without the plan. Even within a simple implementation task there are important ideas of sequence of work, testing, and subsequent documentation that should be followed.
---

# Code Implementation

Implementation turns a ticket into working, tested code. It follows the plan;
it is not ad hoc. Start only after the user has chosen which tickets to work
on (see code-planning). Within a ticket there are still small, testable steps —
the same idea as tickets, one level down.

## Before starting: trust the ticket, but not blindly

A ticket's value trace and premise (see code-planning, code-legacy) were
believed true when written. Before implementing, a quick sanity check costs
little and catches the cheapest possible case of stale work: does the
persona and journey this ticket named still sound right, and does nothing
about the current codebase already contradict the premise it depends on? If
something looks off, stop and flag it per code-legacy rather than
implementing carefully against a foundation already known to be wrong. This
is not a full audit — it is the same instinct as reading a test's assertion
before trusting a green run, applied once, briefly, at the start.

## Test first

Conceive the test before the implementation. The test states the intention at
a seam.

1. Write the test. It will not run because the seam does not exist yet — that
   is expected, not done.
2. Add the minimum surface of the seam — returning a wrong value, not raising —
   so the test runs.
3. Confirm the test fails on its assertion for the expected reason. An
   `ImportError` or `NotImplementedError` is not a real red; the assertion must
   run and fail.
4. Implement the minimum to make it pass.

Keep tests rational: they should lock intention, not incidental rendering.
Exact-output tests for every message multiply without guarding much. See
code-quality for what a good test asserts.

## A ticket in steps

Break the ticket into testable steps; the tests usually fall out naturally
from the ticket's constraints. A good ticket needs no further guidance about
its steps. Record the breakdown as a checklist, and update it during
implementation to reflect what was actually done — finished tickets become
guides for reviewers and future work.

- Tests are the default first action. One test may cover several steps;
  several tests may cover one step.
- During unusually complex work, pause for a self code review between steps
  and refine quality before continuing.
- Use a fluent assertion library when it makes failures precise — not as
  decoration.

## Finish

Finish with the whole test suite passing, not just the new tests. Regression
and other contracts are not optional. Usually fix the implementation; sometimes
fix the tests, if a contract was deliberately changed.

## Self review

Implementation always ends with a self review. Review the change against its
purpose and constraints (see code-review), then act on it:

- Apply the improvements that matter before declaring the ticket done.
- If an improvement is judged out of scope or not worth it now, record it as
  future work — on the ticket or as a new ticket — rather than silently
  dropping it.
- Passing tests are not a reason to skip this step: tests lock behaviour, not
  design. This holds regardless of how obviously correct the change feels —
  confidence is not evidence, and skipping self-review because a change
  looks clean is the most common way this step actually gets skipped.
- If acting on your self review produces extensive changes then do one more 
  self review and act cycle.

## Record the work

Add implementation notes to the ticket: what was done and why, and what was
considered and excluded. Omit detail that is the obvious way to implement the
intent; record what is not obvious. Set the ticket's status to `implemented`.

Note what shrank as well as what grew. A ticket that only ever adds is not
automatically wrong, but it's worth a second's thought — see code-exploration
on additive drift for why this is worth naming even outside exploratory work.

Decisions with wide impact belong in the master plan as ADRs, not buried in one
ticket.

## Spawning new tickets

When implementation surfaces a major opportunity, raise it to the reviewer
rather than acting on it, and note the ticket it arose from. These tickets
sometimes hold costly, hard-won information about a complex area — do not lose
it.

A revision ticket (see code-legacy) is a specific case of this: it must cite
its predecessor and carry forward whatever was learned about why the earlier
approach stopped working, the same way any spawned ticket preserves the
context that produced it.
