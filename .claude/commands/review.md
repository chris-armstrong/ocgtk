---
description: Run all six guideline reviewers in report-only mode against a PR, branch, staged files, or explicit paths
argument-hint: "[PR number | branch | staged | <files>]"
---

## Code Review: $ARGUMENTS

You are the coordinating agent for a guideline-based code review. Reviewers will report violations but make no changes to files.

---

### Step 1: Determine the File Scope

Parse `$ARGUMENTS` to determine which files to review:

- **PR number** (e.g. `123` or `#123`): get the changed OCaml files from the PR:
  ```bash
  gh pr diff 123 --name-only | grep -E '\.(ml|mli)$'
  ```
- **Branch name** (e.g. `feature/foo` or `origin/foo`): files changed on that branch vs its merge base:
  ```bash
  git diff $(git merge-base HEAD <branch>) --name-only -- '*.ml' '*.mli'
  ```
- **`staged`**: uncommitted staged files:
  ```bash
  git diff --cached --name-only -- '*.ml' '*.mli'
  ```
- **Explicit file paths**: if `$ARGUMENTS` contains `.ml` or `.mli` paths, use those directly.
- **Default** (no argument or unrecognised): all OCaml files changed on this branch vs main:
  ```bash
  git diff $(git merge-base HEAD origin/lablgtk4) --name-only -- '*.ml' '*.mli'
  ```

Filter the result:
- Remove paths containing `/_build/` or `/generated/`
- Remove paths that do not exist on disk

Print the final file list. If it is empty, stop and report that no OCaml files matched the scope.

---

### Step 2: Dispatch All Six Reviewers

Invoke each reviewer subagent. **Do not include "apply fixes" in the message** — reviewers will report only.

1. `control-flow-reviewer`
2. `type-correctness-reviewer`
3. `code-quality-reviewer`
4. `abstractions-reviewer`
5. `test-reviewer`
6. `docs-reviewer`

Message to pass to each:

```
Files to review (full list — do not skip any):
<one file path per line, the complete list from Step 1>
```

Dispatch reviewers one at a time and wait for each to complete before starting the next.

---

### Step 3: Final Report

Aggregate the results and output:

```
## Code Review
Scope: <description of how files were selected>
Files reviewed: <N>

### Violations by Severity

**Must Fix** (correctness, type safety, partial functions):
- <file>:<line> — [<agent>/<guideline>] <description>

**Should Fix** (error handling, pattern matching, module boundaries):
- <file>:<line> — [<agent>/<guideline>] <description>

**Nice to Fix** (naming, reuse, abstractions, docs, comments):
- <file>:<line> — [<agent>/<guideline>] <description>

### Per-Agent Summaries
<paste each reviewer's Summary paragraph here, labelled by agent>

### Total Violations: <N>
```

If there are no violations, say so clearly.
