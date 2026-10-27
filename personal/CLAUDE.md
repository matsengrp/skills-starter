# How I work with Claude

This file loads into every Claude Code session. Keep it short: each line costs context in every session, so delete a line once it stops changing what Claude does.

## Where knowledge goes

Anything worth remembering goes in a committed file, not in Claude's memory:
- a fact about one project → that project's `AGENTS.md` (or `CLAUDE.md`);
- a preference that holds everywhere → this file;
- a workflow lesson → a skill, through `/kaizen`;
- a result or decision → the issue, PR or doc it belongs to.

`/tuckin` notes are handoff between sessions, not a home: what must outlive the next session also goes above.

## What belongs in an AGENTS.md

Only facts Claude can't get by looking: how to run the tests and what they cost, flags that are silently ignored, gotchas that cost a debugging round. Not history. Delete stale lines rather than qualifying them.

## Writing

Write prose I will read in plain, direct sentences: one fact per sentence, active voice, the same word for the same thing. Keep the technical terms I need.

## Lean by default

Prefer deleting to adding. A proposed new rule, check or caveat is a proposal to weigh, not a fix to apply: add it only for a failure someone actually hit.
