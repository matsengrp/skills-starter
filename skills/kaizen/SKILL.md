---
name: kaizen
description: Reflect on friction in this session and propose one concrete fix — an edit to a CLAUDE.md, AGENTS.md or skill, or a new skill for a workflow done by hand more than once.
---

# /kaizen

Find what made this session slow or wrong, and propose one fix that stops it from happening again.
`$ARGUMENTS` is an optional hint; if empty, infer the friction from the conversation.

## 1. Diagnose

Name the root cause, not the symptom. "Claude couldn't find the data" is a symptom; "the data path isn't in AGENTS.md" is the cause.

## 2. Pick the target

| Target | When |
|---|---|
| This project's `AGENTS.md` or `CLAUDE.md` | Claude lacked a fact about this project |
| Your `~/.claude/CLAUDE.md` | Claude lacked a preference or fact that holds across projects |
| An existing skill in your skills repo | A skill gave wrong or incomplete guidance |
| A new skill | You walked Claude through the same multi-step workflow a second time |

A new skill is `skills/<name>/SKILL.md` in your skills repo: front matter with `name` and `description`, then the steps. Claude decides when to use a skill from its `description` alone, so that line says what the skill does and when to reach for it. Write only the procedure and the facts Claude can't get by looking: commands, paths, gotchas. Leave out the story of how you learned it.

## 3. Check for collisions

Before writing, grep the target and your skills repo for the key term. If a rule already covers the topic, edit that rule rather than adding a second one; two rules on one topic have no tiebreak. If you find nothing, say what you grepped.

Prefer deleting to adding. A rule nobody can point to an instance of is a candidate for deletion.

## 4. Propose

```
## Kaizen: <short title>
What happened: <one or two sentences>
Root cause: <why>
Fix: <file, and the exact new or changed text>
Collides with: <file and section, or "nothing; grepped <term>">
```

One fix per run. Name any others in one line.

## 5. Ask, then act

Stop and ask which to do:

1. **Apply now.** Edit a project file or `~/.claude/CLAUDE.md` directly.
2. **Send to the `skills` session.** For a skill change or a new skill, when `ListAgents` shows a session named `skills`: send it the diagnosis and the proposed text with `SendMessage`. It places, commits and reports back. With no such session, edit your skills repo yourself, commit, and run its `install.sh` if you added a skill.
3. **Skip.** You disagree with the diagnosis.
