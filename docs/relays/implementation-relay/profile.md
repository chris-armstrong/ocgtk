# implementation-relay — operational profile (v2, minimal intervention)

Reusable profile for Relay chains that turn a design + implementation instructions
into a draft PR with minimal human intervention. Derived from the `relay-runner`
profile (see [relay-runner skill] and `docs/plans/implementation-relay.md` for the
design record). The preparation agent copies this file's content into the relay's
`.pi-web/relays/<name>/operations.md`, filling in the per-relay facts marked
`<PER-RELAY>`.

**v2 principle:** the human reviews durable artifacts (the charter at preparation,
the draft PR at the end), not live agent chatter. The chain runs end-to-end
unattended; every human touch is a visible intervention stop, exceptional by
design. There is no standing controlling agent between legs.

Review agents referenced below are pi project agents defined in `.pi/agents/`
in this repo — the ported, report-only equivalents of the historical
`.opencode/agents/*-reviewer.txt` definitions. `.pi/agents/` is the source of
truth. The opencode coordinator (`review.txt`) is deliberately **not** ported:
the review-leg runner consolidates; there is no standing coordinator.

## Per-relay facts

- Working location: `<PER-RELAY: in-place branch or fresh worktree; decided at
  preparation time>`; record checkout path, branch, integration base ref and
  immutable base commit, initial HEAD, allowable pre-existing tree state.
- Review range: `<PER-RELAY: exact diff, normally merge-base..HEAD>`.
- Packet root: `.pi-web/relays/<name>/` (git-excluded; never in delivery commits).

## Models

Every dispatch prompt must pass the model explicitly; if a model is unavailable
at dispatch, that is an intervention, not a silent substitution.

| Role | Model |
|---|---|
| Design reviewer (leg 1) | `glm-5.3` |
| Preparation session (per relay; single preflight dispatch) | dispatching session |
| Implementation runners | `glm-5.3-flash` |
| Fixer | `glm-5.3` |
| Fix delegates (bounded subsessions) | `glm-5.3-flash` |
| Review consolidator + aspect subreviewers | `deepseek-v4-flash` |

## Verification gate (end of every implementation or fix leg)

Run from the repo root; all three must pass before commit:

```bash
opam exec -- dune build @all
opam exec -- dune test gir_gen/ && xvfb-run dune test ocgtk/
cd ocgtk && opam exec -- dune fmt && git diff --exit-code -- '*.ml' '*.mli'
```

A leg whose gate fails is not done: finish within the slice or hand back with an
honest failure record. Never describe failed, skipped, or incomplete verification
as passing.

## Commit policy

Every leg that changes delivery files commits all and only its changes before
handoff (one commit per round; message explains why). Packet updates stay out of
delivery commits. A leg that cannot commit does not hand off.

## Review aspect panel (report-only; `.pi/agents/`)

| Aspect agent | Guidelines |
|---|---|
| `abstractions-reviewer` | `abstractions.md` |
| `type-correctness-reviewer` | `type-safety.md`, `pattern-matching.md`, `module-boundaries.md` |
| `code-quality-reviewer` | `naming-and-intermediates.md`, `code-reuse.md` |
| `control-flow-reviewer` | `nesting-and-control-flow.md`, `error-handling.md`, `partial-functions.md` |
| `docs-reviewer` | `comments-and-documentation.md` |
| `test-reviewer` | `test-patterns.md`, `atspi-e2e-testing.md` |
| `refactor-reviewer` (optional 7th) | goal-attainment; only when the design states a quantified refactor goal |

**Proportionate selection:** review is not a fixed panel. The consolidator selects
the applicable aspects from the actual diff — at least one aspect, all aspects
whose guideline surfaces the diff plausibly touches (e.g. `test-reviewer` only
when test files changed), and `refactor-reviewer` only under the quantified-goal
condition. Reviewers never fix; their only output is their aspect report.
Blocking requires concrete evidence (reproduced failure, failing check, or a
concretely violated guideline with specific code); everything else is
non-blocking and does not consume a fix round.

## Design-review leg policy

Light review only: consistency (internal, and against the repository as target)
and size (one relay, one branch, a sane slice). Numbered ambiguities each get a
disposition: resolved by the reviewer within the charter's edges (rationale
recorded), or marked **material** (would move goal, edge, or a cost/feasibility
assumption). No material findings → proceed to implementation without a human
gate. Any material finding → intervention stop.

## Fix-leg policy

- Tool budget: **60 tool calls** per fix leg (gate commands cost ~3). Track the
  count; at ~80% of budget, converge or give up.
- Giving up is legitimate: record which findings remain untouched and why the
  budget was insufficient, then stop with the intervention signal. Never
  half-fix across the board.
- Delegation: bounded `glm-5.3-flash` subsessions for independent, well-scoped
  findings. The fixer stays sole committer and sole packet writer, and verifies
  (gate) everything before committing.
- Resolve blocking findings first, in risk order. Non-blocking findings only if
  trivially inside the slice and budget.

## Fix/review rounds

- Round 1: applicable-aspect review → fix leg → round 2: failed aspects only →
  one final fix leg.
- If blocking findings survive the second fix round, or a fixer gave up with
  material findings outstanding: **stop and notify the human**. No third
  automatic round. (The `relay-runner` exceptional third attempt exists only for
  a human to grant explicitly.)

## Architectural-decision rule (implementation and fix agents)

New module boundaries, cross-cutting type changes, new dependencies, FFI
strategy changes, and generated-code strategy changes are **key architectural
decisions**: agents must not make them. The agent writes the question (options +
recommendation) to `handover.md` under *Open questions*, sets status to
blocked-with-query with the intervention signal, and **stops**. The human
resolves in the packet (decision + rationale recorded in `handover.md`); the
relay resumes via a continuation dispatch naming the recorded decision. There is
no intermediary agent between stop and resolution.

## Shared handover document

`handover.md` lives in the packet, is linked from `status.md` whenever an
implementation or fix leg is active or imminent, and is compressed each round.
Per phase it records: what was done, files touched, invariants and decisions
taken (with rationale), exact verification results, known rough edges, and the
precise next slice. Agent **proposals** go under *Open questions*; agent decisions
are never recorded as taken. This is the documented adaptation of the
`relay-runner` optional-file policy.

## Human checkpoints and intervention (exhaustive)

Designed-in checkpoints (normal operation, not interventions):

1. **Preparation approval** — the packet draft review; dispatch never happens
   without it.
2. **Draft-PR review** — after delivery; outside the relay itself.

Intervention stops (exceptional, visible; human resolves in the packet and
re-dispatches a continuation leg):

- material design-review concerns;
- architectural queries from implementation agents;
- fixer gives up / budget exhausted with material findings outstanding;
- blocking findings surviving round 2 (stop-and-notify);
- any `relay-runner` trigger: environment unusable, scope question, delivery
  or authentication failure, unexpected unrelated branch changes, finish line
  infeasible, …

## Delivery

Final leg: verify the integration base still resolves to the reviewed base
commit, HEAD equals the reviewed HEAD, tree clean apart from the packet; then

```bash
git push -u origin <branch>
gh pr create --draft --title <title> --body <body with verification results>
```

Record the PR URL in status and log. Push/auth failure is intervention, not
completion. The human reviews the draft PR as the second designed-in checkpoint.