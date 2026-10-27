# skills-starter

A starting point for working with Claude Code the way the Matsen group does: Claude learns from friction by changing committed files, not by piling up memories.

The pack has three skills and a few files around them:

- **`/kaizen`**: when something went wrong or took too long, find the root cause and propose one fix. The fix is an edit to a `CLAUDE.md`, an `AGENTS.md` or a skill, or a new skill for a workflow you walked Claude through twice.
- **`/tuckin`** and **`/continue`**: before `/clear`, `/tuckin` commits the session's work and writes a short continuation prompt. After `/clear`, `/continue` reads it, checks what is stale, and carries on.
- **`personal/CLAUDE.md`**: a short global instruction file to start from.
- **`AGENTS.md`**: instructions for a long-running session named `skills` that owns this repo and lands what `/kaizen` sends it.

## Install

1. Click **Use this template** on GitHub to make your own copy (for example `<you>/skills`), and clone it.
2. Run `./install.sh` in the clone. It:
   - symlinks each `skills/<name>/` into `~/.claude/skills/`;
   - links `personal/CLAUDE.md` to `~/.claude/CLAUDE.md` if you have none. If you already have one, it changes nothing and prints how to merge the two;
   - turns off auto memory by setting `"autoMemoryEnabled": false` in `~/.claude/settings.json`, after backing it up.

   It never overwrites a file it did not create, so it is safe to rerun.
3. Open a terminal in the clone and start the `skills` session: `claude -n skills`.

## Daily use

- Work in your projects as usual, one Claude session per terminal. A terminal in VS Code works.
- When Claude gets something wrong that it should have known, or you explain a workflow for the second time, run `/kaizen`. It proposes one fix and asks before acting.
  - A project fact goes into that project's `AGENTS.md`.
  - A skill change or a new skill goes to the `skills` session as a message. That session commits it and replies.
- When a session gets long, run `/tuckin`, then `/clear`, then `/continue`.

Sessions find each other by name, so name the ones you will message: `claude -n <name>`, or `/rename <name>` in a running session. A session holds a message from a session in a different permission mode until you approve it in that session.

## Why auto memory is off

Auto memory writes notes that nobody reviews, and they pile up and drift out of date. Here every lesson goes into a file you can read, diff and delete: an `AGENTS.md`, your `CLAUDE.md`, or a skill. To clean up an instruction file that has grown, run `/doctor prompt-audit`.

## Writing skills

See `AGENTS.md` ("Writing a skill"). In short: the `description` decides when Claude uses the skill, and the body holds only procedure and facts Claude can't get by looking. Delete a line once it stops changing what Claude does.
