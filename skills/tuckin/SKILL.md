---
name: tuckin
description: Before /clear, save what this session must not lose — commit its work, put lasting knowledge where it belongs, and write a short continuation prompt that /continue reads in the fresh session.
---

# /tuckin

Make a context reset safe. Run it before `/clear`; run `/continue` after.

1. **Commit and push** what this session changed. If you are on `main` and the project uses branches, branch first. Report anything you could not push rather than forcing it.
2. **Put lasting knowledge in its home**, not in the continuation prompt: a project fact in `AGENTS.md` or `CLAUDE.md`, a result in the issue, PR or doc it belongs to, a workflow lesson through `/kaizen`. The prompt is handoff; it only points at these.
3. **Write the continuation prompt** to `_ignore/CONTINUE-<name>.md` in the directory the next session starts in, where `<name>` is this session's name (the "This session is" row of `ListAgents`), or `main` if it has none. Keying by name lets several sessions share a directory. If `_ignore/` is not ignored yet, add it to `.git/info/exclude`.

   Keep it under a page:

   ```
   # written at <git sha> <iso time>
   Start in <dir>.
   State: <files, issues or PRs that hold the durable state>
   In flight:
   - <item> — FIRST CHECK: <command or condition that shows it is already done or moot>
   Pending with the user:
   - <open question, in the user's latest words on it>
   ```

   Each in-flight item carries its own `FIRST CHECK`, on its own line, because the next session acts on the top of the file before it reads caveats below. Don't record status ("PR open", "job running") as fact; point at the command that checks it.
4. **Report** what was committed and that the prompt is written. Then it is safe to `/clear`.
