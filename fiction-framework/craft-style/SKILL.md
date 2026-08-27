---
name: craft-style
description: Maintain and apply the writing style guide (craft/style-guide.md) and genre convention sheets (craft/genre/<genre>.md). Defines voice, tense, POV, rhythm, vocabulary, and dialogue rules; defines genre tropes, obligatory scenes, and audience expectations; audits a passage against both. Load when the user wants to define or update style, add a genre, or check a passage for style/genre fit.
---

# Craft Style

Own the craft layer: the style guide and the genre sheets. `write-passage` reads these; this skill creates, updates, and audits them.

## Location

Everything here is relative to the **fiction root**. See the story-structure skill for passage frontmatter.

## The style guide — craft/style-guide.md

Maintain these sections (create the file if missing):

```markdown
# Style Guide
- Voice: (narrative voice, tone, register)
- Default tense / POV: (past | present; first/third, limited/omniscient)
- Rhythm & sentence: (length, variation, fragments, paragraphing)
- Vocabulary & diction: (level, era, invented terms, what to avoid)
- Dialogue: (attribution style, dialect rules)
- Forbidden: (clichés, filter words, anachronisms)
```

## Genre sheets — craft/genre/<genre>.md

One file per genre (fantasy, mystery, romance, …). Maintain:

```markdown
# <Genre>
- Core promise: (what the genre must deliver)
- Obligatory scenes: (the beats readers expect)
- Tropes & conventions: (honor / subvert list)
- Pacing: (where tension lives)
- Audience expectations: (what to never violate)
```

## Auditing a passage

1. Read the passage, `craft/style-guide.md`, and the matching `craft/genre/<genre>.md`.
2. Report deviations: tense/POV drift, voice breaks, forbidden words, genre promise violated, missing obligatory beats (for outlines).
3. Do not edit here — hand the findings to revise-passage (or note "style guide needs updating" if the guide itself is the problem).

## Rules

1. The style guide is authoritative; a passage that needs a new rule means the guide updates, not the rule bending silently.
2. One genre sheet per genre; a work with two genres cites both.
