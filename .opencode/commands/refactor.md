---
description: Refactor code to meet a specific guideline with independent review
template: Carry out a complex refactoring task based on the user's suggestion and following the guidelines using a multi-stage plan, execute and review loop
mode: primary
argument-hint: "<guideline> in <files or module>"
model: anthropic/claude-sonnet-4-5
---

## Refactoring Goal: $ARGUMENTS
You have three agents available to you:
- @refactor-executor
- @refactor-reviewer
- @refactor-planner

DO NOT execute any of these steps yourself - always use the agents. STOP if you are unable to invoke them. NEVER proceed with the changes yourself.

Minimise your output to just the relevant parts. 

### Setup: Load or Define Guidelines

First, check if `.opencode/guidelines/ocaml-readability.md` exists:
```bash
test -f .opencode/guidelines/ocaml-readability.md && echo "EXISTS" || echo "MISSING"
```

If MISSING, create it with the standard OCaml guidelines (use the full content from the guidelines document).

You do not need to load the guidelines file yourself, the subagents will do that for themselves.

## Phase 0: Check for existing plan

**IMPORTANT**: There may already be an existing goal at `.opencode/scratchpad/current-goal.txt` and/or plan at `.opencode/scratchpad/refactor-plan.json`.
**REQUIRED**: ALWAYS check for an existing plan. 

IF ONE EXISTS, ask the user if they want to resume with it or start over. When the user wants to resume, you MUST NOT run the planner again (i.e. skip Phase 1), but instead, show the user what the next steps would be and refine them with them. 


### Phase 1: Planning

Save the original goal for the reviewer:
```bash
mkdir -p .opencode/scratchpad
echo '$ARGUMENTS' > .opencode/scratchpad/current-goal.txt
```

Use @refactor-planner agent to analyze target files against goal: "$ARGUMENTS"

The planner will output to `.opencode/scratchpad/refactor-plan.json`

Show me the plan summary and wait for approval before proceeding.

### Phase 2: Execution Loop


For each violation in the plan:

1. **Execute**: Use @refactor-executor agent with:
   - The specific violation details
   - Reference to guidelines file or inline patterns
   - Run a build check i.e. `dune build 2>&1` to ensure the code compiles. MUST return 0 exit code. If build fails, executor must fix before proceeding.

2. **Independent Review**: Use @refactor-reviewer agent with:
   - Original goal from: `cat .opencode/scratchpad/current-goal.txt`
   - Modified file paths only (reviewer reads current state)
   - The reviewer agent already knows what to do and what output format to use. Simply provide the context; DO NOT prompt it with an output format NOR provide review criteria.
   
3. **Handle Review Result**:
   - PASS → commit and continue to next violation
   - PARTIAL → show feedback, attempt fix (max 2 retries)
   - FAIL → show feedback, attempt fix (max 3 retries)
   - Still failing → pause and consult me

1. **Checkpoint**:
```bash
   git add -A
   git commit -m "refactor: <specific changes>
   
   Guideline: <summary of goal>
   Changes: <detailed description of changes made>
   Analysis: <only use if required if there is some specific notes from the change>
"
```

### Phase 3: Final Validation

After all changes addressed:

1. Full test suite:
```bash
   dune runtest 2>&1
```

2. Final review of ALL modified files:
   Use @refactor-reviewer with original goal on complete changeset

3. Generate summary:
```
   ## Refactoring Summary
   - Goal: <summary of goal>
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
1. Progress is saved in `.opencode/scratchpad/refactor-plan.json` 
2. Completed violations are committed
3. Resume with: `/refactor continue`. DO NOT RUN THE PLANNER AGENT AGAIN.

To abort: `git reset --hard HEAD~<N>` to undo commits
