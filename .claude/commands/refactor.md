---
description: Refactor code to meet a specific guideline with independent review
argument-hint: "<guideline> in <files or module>"
---

## Refactoring Goal: $ARGUMENTS

### Setup: Load or Define Guidelines

First, check if `.claude/guidelines/ocaml-readability.md` exists:
```bash
test -f .claude/guidelines/ocaml-readability.md && echo "EXISTS" || echo "MISSING"
```

If MISSING, create it with the standard OCaml guidelines (use the full content from the guidelines document).

### Phase 1: Planning

Save the original goal for the reviewer:
```bash
mkdir -p .claude/scratchpad
echo '$ARGUMENTS' > .claude/scratchpad/current-goal.txt
```

Use `guideline-refactor-planner` to analyze target files against goal: "$ARGUMENTS"

The planner will output to `.claude/scratchpad/refactor-plan.json`

Show me the plan summary and wait for approval before proceeding.

### Phase 2: Execution Loop

For each violation in the plan:

1. **Execute**: Use `ocaml-guideline-executor` with:
   - The specific violation details
   - Reference to guidelines file or inline patterns

2. **Build Check**: 
```bash
   dune build 2>&1
```
   If build fails, executor must fix before proceeding.

3. **Independent Review**: Use `ocaml-guideline-reviewer` with:
   - Original goal from: `cat .claude/scratchpad/current-goal.txt`
   - Modified file paths only (reviewer reads current state)
   
4. **Handle Review Result**:
   - PASS → commit and continue to next violation
   - PARTIAL → show feedback, attempt fix (max 2 retries)
   - FAIL → show feedback, attempt fix (max 3 retries)
   - Still failing → pause and consult me

5. **Checkpoint**:
```bash
   git add -A
   git commit -m "refactor(): 
   
   Guideline: $ARGUMENTS
   Violation: 
   Reviewer: PASS"
```

### Phase 3: Final Validation

After all violations addressed:

1. Full test suite:
```bash
   dune runtest 2>&1
```

2. Final review of ALL modified files:
   Use `ocaml-guideline-reviewer` with original goal on complete changeset

3. Generate summary:
```
   ## Refactoring Summary
   - Goal: $ARGUMENTS
   - Files modified: <count>
   - Violations fixed: <count>
   - Final verdict: <PASS/PARTIAL>
   
   ### Before/After Metrics
   - Nesting depth: max <N> → max <M>
   - Partial functions: <N> → <M>
   - Exception sites: <N> → <M>
```

### Failure Recovery

If context is exhausted mid-refactor:
1. Progress is saved in `.claude/scratchpad/refactor-plan.json` 
2. Completed violations are committed
3. Resume with: `/ocaml-refactor continue`

To abort: `git reset --hard HEAD~<N>` to undo commits
