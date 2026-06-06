---
description: Run all six guideline reviewers against the files implemented for a spec
argument-hint: "<spec-name>"
---

## Spec Review: $ARGUMENTS

You are the coordinating agent for a guideline review of a completed spec implementation. Work through the steps below in order.

---

### Step 1: Load the Spec

The spec name is: `$ARGUMENTS`

Look for the spec directory at `.planning/specs/$ARGUMENTS/`. If it does not exist, try a case-insensitive or partial match against subdirectories of `.planning/specs/`. If no match is found, stop and report the available specs:

```bash
ls .planning/specs/ 2>/dev/null || echo "No specs directory found"
```

Once located, read all three spec documents in order:

1. `.planning/specs/$ARGUMENTS/requirements.md`
2. `.planning/specs/$ARGUMENTS/design.md`
3. `.planning/specs/$ARGUMENTS/tasks.md`

Summarise in one short paragraph what was implemented. Note any source directories or modules explicitly mentioned in the design or tasks — these inform the file scope below.

---

### Step 2: Determine the File Scope

Get all OCaml files changed on this branch relative to main:

```bash
git diff $(git merge-base HEAD origin/lablgtk4) --name-only -- '*.ml' '*.mli'
```

Filter the result:
- Remove paths containing `/_build/` or `/generated/`
- Remove paths that do not exist on disk

If the spec's design or tasks docs mention specific source directories or modules, check whether the modified files are concentrated there. If they are, note it in your output but still pass the **full unfiltered list** to the reviewers — do not narrow scope unilaterally.

Print the final file list. If it is empty, stop and report that no OCaml files were modified on this branch.

---

### Step 3: Dispatch All Six Reviewers

Invoke each of the following subagents, passing the same message to all of them:

1. `control-flow-reviewer`
2. `type-correctness-reviewer`
3. `code-quality-reviewer`
4. `abstractions-reviewer`
5. `test-reviewer`
6. `docs-reviewer`

Message to pass to each:

```
This is a post-implementation review for the "$ARGUMENTS" spec.

Files to review (full list — do not skip any):
<one file path per line, the complete list from Step 2>
```

Dispatch reviewers one at a time and wait for each to complete before starting the next.

---

### Step 4: Build Check

```bash
dune build 2>&1
```

If the build fails:
1. Identify the broken files from the build output.
2. Re-invoke the reviewer that last touched each broken file with the instruction: "The build is broken in these files after your previous edits. Fix the build errors while keeping your guideline fixes where possible."
3. Re-run `dune build` to confirm.

---

### Step 5: Test Suite

```bash
dune test gir_gen/ && xvfb-run dune test ocgtk/ 2>&1
```

Report pass or fail.

---

### Step 6: Final Summary

```
## Spec Review: $ARGUMENTS
Files reviewed: <N>

### Spec Summary
<one paragraph from Step 1>

### Per-Agent Results
<paste each reviewer's output block here>

### Build: PASS / FAIL
### Tests: PASS / FAIL
```
