---
name: code-planning
description: Before writing code, get clarity about what it is we're trying to achieve by writing code, and structure that implementation in small steps that can be verified.
---

# Code Planning

Planning turns intentions into a small set of clearly necessary pieces of work,
ordered so each leaves the system working. It produces documents that let a
future session — or a different agent — orient quickly and know what to build
next.

Planning has three products:

- A **glossary** — the terms the system and its users use, applied consistently
  in code and documents.
- **Personas** and **journeys** — who uses the system, and the coherent
  sequences of activity that matter to them.
- **Tickets** — small, ordered pieces of work, each delivering something
  testable.

Statements of intent arrive piecemeal, at different scopes. Sort them loosely
into:

- **Context** — enduring truths that frame everything (the domain, the users).
- **Structure** — middle-tier ideas about how the system is organised.
- **Features** — specific, local capabilities.

This lets you expand what needs detail now and defer the rest. Looking too far
ahead builds on unproven assumptions and produces code that must later be
deleted.

## Glossary

- Define the terms up front and use them consistently; avoid synonyms. Agreed
  abbreviations and acronyms are fine.
- Name processes and activities, not just data. A process modelled under a
  clear name is easier to talk about and to code.
- The glossary grows over time. Correct accidental synonyms when you see them.

## Personas and journeys do two jobs, not one

Personas and journeys are usually read as an implementation-ordering tool:
they organise tickets, prune speculation, and reveal what to build early. That
job matters, but it is not the only one, and treating it as the only one is
what makes a ticket's stated value go thin and unfalsifiable.

The second job: a persona, wanting something, in a journey, is the only
honest answer available to *why write this code at all*. Value is not a
separate quality to assert in a sentence — it is whatever a real persona's
real journey requires, and nothing else. A ticket that cannot name which
persona and which journey it serves has not yet answered why it exists, no
matter how clearly it describes what it builds.

Both jobs must be visible in how personas and journeys are used:

- **Actionable for building** — ask "what does this persona need, want, or
  value?", and "do we really serve this persona?" to prune speculation and
  order tickets.
- **Traceable for worth** — every ticket's value should point at a specific
  persona and a specific point in a specific journey, not a general appeal to
  "the user" or "customer value." A claim that cannot be traced this way
  cannot later be rechecked, and an unrecheckable value claim is exactly what
  goes stale silently (see code-legacy).

- **Personas** organise journeys and help prune speculation: ask "what does
  this persona need, want, or value?", and "do we really serve this persona?"
- A **journey** is a coherent narrative of interaction. Two kinds:
  - **User journeys** — a person achieving a goal through the system.
  - **System journeys** — activity triggered by an event or condition, with no
    person driving it.
- Journeys identify the capabilities the system must have, and what is out of
  scope. Overlapping journeys reveal capabilities worth building early
  (shared, or blocking others).
- Several journeys may be one template with a palette of options at a key
  point. Pick specific options to chart a course that validates the
  architecture early, while it is still cheap to change.

When there is no clear choice, quiz the user. Offer a few options, highlight
the one you think best, and group related questions. Often an answer is
obvious and should simply be accepted.

## Reversibility justifies trying, not scope

A request should default to a literal, straightforward reading: build what
was explicitly asked, at the size it was asked for. Noticing that something
would be cheap or reversible to extend is not, by itself, permission to
extend it — that reasoning answers "would this be safe to try," not "was
this requested." Treating the first as an answer to the second is how small,
sensible technical choices quietly turn into unrequested scope: a
case-insensitive, prefix-matched lookup built for one field, applied to a
second field nobody asked about, because the mechanism was already there and
cheap to reuse. Consistency is a real value, but it is not a substitute for
being asked. There are times when consistency brings simplicity, the collapasing
of cases in seams, and greater affordance, if those values are met, then there
is a real decision to be made that could go either way, and needs to be treated
in context or queried.

There are genuine moments where a looser, more generative reading is the
right call — where the request itself reads as an invitation to explore
possibilities, not a specification to implement. Treat that as a real,
different mode (see code-exploration), not a default lens to apply to
ordinary tickets. The tell is in the request's own shape: an open question
("what might this look like") invites exploration; a specific instruction
("use any unique prefix of the name") does not, however easy it would be to
generalise.

Either way, keep the feedback loop tight. A playful or generative extension
is only safe when it is proposed and checked early — named as a question or
a small, visible option, not built out silently and presented as already
decided. The size of an unrequested addition matters less than how long it
went unremarked before the user saw it.

## Tickets

Tickets define incremental steps of work. Future tickets form a graph — some
block others — but number them linearly anyway, because a linear order is easy
to see and follow. It is fine to implement out of strict order, remove a
ticket, or replace one that is too big with several smaller ones.

- Name tickets `ticket-NNN-slug.md`, where `NNN` is a sequence number, and put
  them in the ticket directory (see Project layout).
- Order so blockers come before dependents, shared capabilities come early,
  hard problems come early, and whole journeys finish when possible. Don't
  agonise; each ticket leaves the system working.

Each ticket records:

- **Status** — one of a small set (see below).
- **Journeys** — which journeys it is part of.
- **Value trace** — which persona, and which specific point in which
  journey, this ticket serves. Name it concretely enough to recheck later by
  asking a real question ("does this persona still do this journey, still
  this way") rather than by feeling. Distinct from Problem: Problem states
  the intention in the ticket's own terms; the value trace points outward, at
  the persona and journey that make the intention worth having at all.
- **Problem** — the value, intention, or problem the work solves.
- **Constraints** — what a successful implementation must satisfy; a powerful
  driver of tests.
- **Options considered** — significant alternatives and why they were not
  chosen. These are invisible in the code, so record them here.
- **Implementation notes** — added on completion: what was done, why, and what
  was excluded (see code-implementation).

### Status

Each ticket carries a status line using one of a small, consistently-worded
set:

- `planned` — accepted; work has not started.
- `implemented` — done; the full test suite passes.
- `won't do` — deliberately declined; say why.
- `superseded` — replaced by another ticket; name it.

## Project layout

Planning artefacts live in a hidden directory at the project root:

- `.code-plan/PLANNING.md` — the master plan.
- `.code-plan/tickets/` — the ticket files.

Create (or extend) `CLAUDE.md` and `AGENTS.md` at the project root with a line
pointing to the plan, so agents find it:

```
See .code-plan/PLANNING.md for the project plan, glossary, and tickets.
```

## The master plan (PLANNING.md)

Use this structure; it lets a fresh session orient quickly:

1. **Purpose** — what the system is for, in a few lines.
2. **Glossary** — terms, defined once, used everywhere.
3. **Personas** — who the system serves.
4. **Journeys** — the coherent interactions to support (numbered).
5. **Decisions (ADR)** — durable decisions, each named and justified, with the
   options considered and rejected.
6. **Tickets** — the numbered ticket list, with status.

The plan is added to over time. ADRs in particular record choices with wide
impact, so future work does not have to rediscover them.

When a persona or journey itself is edited, merged, or removed from the plan,
treat that as a trigger: every ticket whose value trace pointed at it needs
revisiting (see code-legacy) — this is a more mechanical, checkable event
than premise drift generally, because the plan itself has visibly changed,
not just the world around it.

## Moving to implementation

When planning has settled, do not automatically start development. Ask the
user which tickets to work on.

- Point out **themes** — tickets that are natural to do together because they
  share a capability or complete a journey — and offer them as options.
- Let the user select a few tickets; do not assume the whole plan is next.
- Begin implementation only after that choice, following code-implementation.
