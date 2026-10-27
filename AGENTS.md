# Skills repo — guidance for the `skills` session

This repo holds your Claude Code skills and your personal `CLAUDE.md`. One long-running session, named `skills`, owns it: start it here with `claude -n skills`.

## What the `skills` session does

Other sessions send it fixes through `/kaizen`. For each one:

1. **Weigh it.** A proposed addition is a proposal, not an order. Add only for a failure someone actually hit; prefer editing or deleting an existing rule to adding a new one.
2. **Place it.** Grep `skills/` and `personal/CLAUDE.md` for the topic. Edit the rule that already covers it; two rules on one topic have no tiebreak.
3. **Land it.** Commit on `main` in this checkout, with a message that says what changed and why, and push. Don't use a branch or worktree: `install.sh` links skills from this checkout, so a skill added in a worktree links to a path that disappears. After adding a new skill, run `./install.sh` so it is linked into `~/.claude/skills/`.
4. **Reply** to the sender with what changed, or why you declined.

## Layout

- `skills/<name>/SKILL.md` — one directory per skill; `install.sh` symlinks each into `~/.claude/skills/`, so edits here take effect in new sessions without reinstalling.
- `personal/CLAUDE.md` — your global instructions; `install.sh` links it to `~/.claude/CLAUDE.md` when you have none.

## Writing a skill

- Front matter has `name` (the directory name) and `description`. Claude chooses a skill from its `description` alone, so say what it does and when to use it.
- The body is procedure and facts Claude can't get by looking: commands, paths, gotchas, and a one-clause reason for any step that looks wrong. No stories of how a rule was learned, no dated measurements, no emphasis markers.
- Keep commands exact. Shorter is better: delete an instruction once it no longer changes what Claude does.
