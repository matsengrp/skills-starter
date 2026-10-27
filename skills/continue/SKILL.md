---
name: continue
description: After /clear, resume from the continuation prompt /tuckin left — report how stale it is, run each item's FIRST CHECK, then carry on with the work.
---

# /continue

1. **Find the prompt.** Read `_ignore/CONTINUE-<name>.md`, where `<name>` is this session's name (the "This session is" row of `ListAgents`), or `main` if it has none. If several `CONTINUE-*.md` files exist and none matches, list them and ask. If there are none, say so and stop.
2. **Report staleness.** Compare the file's `written at` stamp with `git log -1`. If commits or PR activity came after it, the checks below matter more.
3. **Check before acting.** Treat every present-tense claim and number in the file as stale. Before acting on an in-flight item, run its `FIRST CHECK`, and drop items the check shows are done or moot. Where the file and the repo, issue or PR disagree, trust the repo, issue or PR.
4. **Carry forward** anything pending with the user, then say where things stand in two sentences and continue with the in-flight items. Stop only for a question that is the user's, or where a check contradicts the file.

Leave the file in place; the next `/tuckin` overwrites it.
