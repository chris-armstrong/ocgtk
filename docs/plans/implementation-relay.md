# Implementation Relay — Design

A pi Relay operational profile for turning a design document plus implementation
instructions into a merged draft PR. Built on the `relay` method (base skill) with a
custom profile derived from `relay-runner`.

## 0. Review agents in this repo

The six specialist aspect reviewers were historically defined under
`.opencode/agents/` (ported from an opencode setup). They are now **ported to
pi project agents** at `.pi/agents/` — that directory is the source of truth
for the relay. The port made report-only mandatory (the original files had an
opt-in "apply fixes" mode, which the relay forbids) and switched tool wording
to pi (`read` tool):

| Reviewer | Aspects | Guideline files (`docs/code_guidelines/`) |
|---|---|---|
| `abstractions-reviewer` | module design, abstraction | `abstractions.md` |
| `type-correctness-reviewer` | types, pattern matching, module boundaries | `type-safety.md`, `pattern-matching.md`, `module-boundaries.md` |
| `code-quality-reviewer` | naming, intermediates, reuse | `naming-and-intermediates.md`, `code-reuse.md` |
| `control-flow-reviewer` | nesting, error handling, partial functions | `nesting-and-control-flow.md`, `error-handling.md`, `partial-functions.md` |
| `docs-reviewer` | comments, documentation | `comments-and-documentation.md` |
| `test-reviewer` | test patterns, e2e | `test-patterns.md`, `atspi-e2e-testing.md` |

Plus `review.txt` (coordinator that fans these out) and
`.claude/agents/refactor-reviewer.md` (goal-attainment reviewer). The first six
form the standard review panel; `refactor-reviewer` is an optional 7th aspect,
run only when the design states a quantified refactor goal.

**Suggestion, implemented:** the six aspect reviewers (plus
`.claude/agents/refactor-reviewer.md` → `.pi/agents/refactor-reviewer.md` as the
optional 7th aspect) are the relay's review panel. The opencode coordinator
(`review.txt`) is deliberately **not** ported: in a Relay the review-leg runner
consolidates — there is no standing coordinator. `.pi/agents/port-reviewers.sh`
records the port transformation (report-only hardening, tool naming, YAML
frontmatter) and can regenerate the agents if the `.opencode` originals change.

The fixer maps each failed aspect to the same guideline files, so fixes are
anchored to the same authority the reviewers used.

## 0a. Runnable profile assets

The profile is implemented as reusable assets the preparation agent consumes:

- `docs/relays/implementation-relay/profile.md` — operational profile to copy
  into a relay's `operations.md` (models, verification gate, commit policy,
  aspect panel, fix budget, gates, delivery).
- `docs/relays/implementation-relay/dispatch-prompts.md` — handoff prompt
  templates for every leg type (design review, implementation, review, fix,
  delivery, post-query continuation).

## 1. Model assignments

| Role | Model | Notes |
|---|---|---|
| Design reviewer | `glm-5.3` | light review; resolves non-material ambiguities itself |
| Preparation session (per relay) | dispatching session | preflight, single dispatch; **not** a standing controller |
| Implementation runners | `glm-5.3-flash` | sequential, one leg each |
| Fixer | `glm-5.3` | bounded, may delegate |
| Fix delegates | `glm-5.3-flash` | bounded subsessions inside the fixer's leg |
| Review consolidator | `deepseek-v4-flash` | runs the review leg |
| Aspect subreviewers | `deepseek-v4-flash` | parallel subsessions, report-only |

Model ids are recorded in `operations.md`; if a model is unavailable at dispatch,
that is an intervention, not a silent substitution.

## 2. Packet layout

Root: `.pi-web/relays/<name>/` (git-excluded, never in delivery commits).

```
charter.md              stable agreement: goal, finish line, scope edges, non-goals
operations.md           profile "implementation-relay": legs, models, gates, budgets,
                        verification commands, commit policy, review aspects table
status.md               baton: current leg, next task, pointers, blockers,
                        review attempts: N, fix budget state
log.md                  append-only history (targeted reads only)
handover.md             SHARED implementation handover doc (multi-phase continuity)
design-review.md        leg-1 light design review: findings + dispositions
                        (agent-resolved non-material; human-resolved material)
reviews/round-<N>/      per-aspect consolidated findings, one file per aspect
```

`handover.md` is a deliberate, documented profile adaptation of `relay-runner`
(which allows only `transition.md` / `review-decisions.md` as optional files): the
user requires a shared document maintained across implementation agents. It holds,
per phase: what was done, files touched, invariants and decisions taken, exact
verification results, known rough edges, and the precise next slice. Decisions
**proposed** by implementation agents are recorded there as open questions, never
as taken decisions. It is linked from `status.md` whenever an implementation leg is
active or imminent.

## 3. Leg chain

```
Leg 1  design-review      glm-5.3        report; resolves non-material ambiguities
                                         itself; STOP only on material concerns
Leg 2..n implementation   glm-5.3-flash  sequential; each commits; STOP (intervention)
                                         on arch query or material concern
Leg r  aspect-review      deepseek-v4-flash (consolidator) + parallel subsessions
                                         (applicable aspects from the actual diff)
Leg f  fix                glm-5.3        bounded tool budget; commits
Leg r' re-review          deepseek-v4-flash  failed aspects only
Leg f' fix                glm-5.3        second and final automatic round
STOP   stop-and-notify    human          if blocking findings remain
Leg d  delivery           push + gh pr create --draft
```

Human involvement is limited to the preparation approval (before dispatch),
intervention stops (exceptional, visible), and review of the draft PR after
delivery. There is no standing controller between legs.

### Leg 1 — design review (glm-5.3)

Input: the design + implementation instructions (as given in the charter draft).
Not a full design review. It checks **consistency** (internally, and against the
repo as a target) and **size** (is this one relay, one branch, a sane slice?).
Output: `design-review.md` containing:

- recommendations (non-binding),
- concerns that would affect implementation,
- unresolved questions and ambiguities (numbered), each with a disposition:
  either resolved by the reviewer itself within the charter's edges (recorded
  with rationale) or marked **material** — meaning it would move the goal, an
  edge, or a cost/feasibility assumption and requires a human decision,
- a proposed rough decomposition into sequential parts (advisory only; real
  slicing stays adaptive per the base method).

It writes nothing else, touches no code. If **no finding is material**, it
updates status and hands off exactly once to the first implementation leg —
the chain continues unattended. If any finding is material, it stops with the
intervention signal and the human resolves; the relay resumes via a
continuation dispatch naming the recorded decisions.

### Implementation legs (glm-5.3-flash, sequential)

Each leg:

1. Reads charter, operations, status, `handover.md` (plus targeted pointers only).
2. States its bounded slice before working (outcome, change surface, verification,
   checkpoint type).
3. Implements. **Forbidden:** architectural decisions — new module boundaries,
   cross-cutting type changes, new dependency, FFI strategy changes, changes to
   generated-code strategy. If a decision like this is needed, the agent:
   - writes the question to `handover.md` under *Open questions* with options and a
     recommendation,
   - sets status to blocked-with-query with the intervention signal,
   - **stops**. The human resolves in the packet; the relay resumes via a
     continuation dispatch that names the recorded decision. This is the
     "visible stop for query resolution" rule — there is no intermediary agent.
4. Verification gate (already defined — recorded verbatim in `operations.md`):
   - `opam exec -- dune build @all` (compile)
   - `opam exec -- dune test gir_gen/ && xvfb-run dune test ocgtk/` (tests)
   - `cd ocgtk && opam exec -- dune fmt` then check clean (lint/format)
   Failure of any gate at end of a leg = the leg is not done; fix within the slice
   or hand back with an honest failure record.
5. **Commits** all and only its delivery changes before handoff (packet files stay
   out of commits). One commit per round, message explains why.
6. Updates `handover.md`, `status.md`, appends `log.md`; then hands off exactly once
   with `spawn_session` (or stops if it was the final implementation slice).

The last implementation leg sets status to *implementation-complete* and names the
review leg.

### Review legs (deepseek-v4-flash, parallel aspects)

One review leg per round, run by one consolidator. The consolidator:

1. Computes the review diff (recorded base/HEAD range from `operations.md`).
2. Spawns **parallel subsessions** (`spawn_subsession`), one per selected
   aspect, each prompted with the corresponding `.pi/agents/<aspect>.md`
   instructions plus: repo, diff range, charter goal/edges, and **report-only**
   prohibition (no writes at all, including packet).
3. `yield_to_subsessions`, collects reports, classifies each finding
   **blocking** (concrete evidence: reproduced failure, failing check, concrete
   violated guideline with specific code) vs **non-blocking**, writes
   `reviews/round-<N>/<aspect>.md`, updates status (`review attempts: N`), logs.
4. Review is **proportionate, not fixed-panel**: the consolidator selects the
   applicable aspects from the actual diff (e.g. `test-reviewer` only when test
   files changed, `refactor-reviewer` only when the design states a quantified
   goal), running at least one aspect and all aspects whose guideline files the
   diff plausibly touches. Round 2 reviews **only aspects with blocking
   findings**, focusing on remediation and regressions (findings already
   dispositioned are carried forward, not re-derived).

Reviewers never fix. They write only their aspect report via the consolidator.

### Fix legs (glm-5.3)

Same rules as implementation agents: verification gate, commit, `handover.md`
update. Additionally:

- **Bounded tool steps.** `operations.md` records a per-round budget (default:
  60 tool calls; the gate commands cost 3). The fixer tracks its count and, at
  ~80% of budget, must converge or give up. Giving up is legitimate and expected
  when the review exposed more work than one bounded leg can absorb: it records
  which findings remain untouched and why the budget was insufficient, and stops
  with the intervention signal instead of half-fixing everything.
- **Delegation.** It may spawn bounded `glm-5.3-flash` subsessions for independent,
  well-scoped findings (e.g., a mechanical guideline sweep in named files). The
  fixer remains the sole committer and sole packet writer; delegates report back
  what they changed and the fixer verifies (build/test/lint) before committing.
- It resolves **blocking** findings first, in risk order. Non-blocking findings
  may be fixed only if trivially inside the slice and budget.

### Re-review and the one-more-round rule

After a fix round, re-review runs for the **failed aspects only** (same
consolidator pattern, `review attempts: N+1`). If new blocking findings appear, a
second (and final) automatic fix round runs. If blocking findings survive the
second round — or the fixer gave up — the relay **stops and notifies the human**
with the consolidated state; no third automatic round. (This matches the
`relay-runner` two-attempt policy; its exceptional third-attempt contingency stays
available to a human, explicitly granted, not to the chain.)

### Delivery leg

Verifies base commit and HEAD still match the approved review state and the tree is
clean apart from the packet; pushes the branch; raises the PR as **draft**:

```bash
git push -u origin <branch>
gh pr create --draft --title ... --body "..."   # includes verification results
```

and records the PR URL in status and log. Push/auth failure = intervention.

## 4. Human interaction points (exhaustive)

The human reviews durable artifacts, not live agent chatter. Normal operation
runs end-to-end without intervention; only visible stops surface to the human.

1. **Relay preparation approval** (packet draft review — the only designed-in
   gate; dispatch never happens without it).
2. **Intervention stops** (exceptional): material design-review concerns;
   architectural queries from implementation agents; fixer gives up / budget
   exhausted with material findings outstanding; blocking findings surviving
   round 2 (stop-and-notify); and any relay-runner trigger (environment
   unusable, scope question, delivery failure, …). The human resolves in the
   packet (decision + rationale recorded) and re-dispatches a continuation leg.
3. **Draft-PR review** after delivery — the second designed-in checkpoint,
   outside the relay itself.

## 5. Invariant mapping

- **One bounded leg per context** — each implementation slice, review round, and
  fix round is its own fresh `spawn_session` context.
- **At most one successor** — the chain is linear; parallelism exists only as
  report-only subsessions *inside* a review leg, and bounded fix subsessions
  *inside* a fix leg, consolidated by that leg's runner (permitted helper pattern,
  explicitly recorded in `operations.md`).
- **Durability before handoff** — commit + `handover.md` + status + log precede
  every handoff; a leg that cannot commit does not hand off.
- **No silent goal drift** — only the human can change charter/edges; agents'
  dispositions in `design-review.md` and `handover.md` are recorded facts, not
  authority.
- **Bounded orientation** — nobody reads `log.md` end-to-end; `handover.md` is the
  working continuity surface, kept compressed each round.

## 6. Resolved decisions (human-approved)

1. **Fix budget:** 60 tool calls per fix leg, tracked; giving up is expected when
   reviews expose more than one bounded leg can absorb.
2. **Design decomposition:** advisory only — implementation slicing stays adaptive
   (status + `handover.md` decide the next slice).
3. **Goal-attainment reviewer:** included as an optional 7th aspect, run only when
   the design states a quantified refactor goal; prompt core is
   `.claude/agents/refactor-reviewer.md`.
4. **Working mode:** decided per relay at preparation time (in-place branch vs
   fresh worktree from the integration base); the choice and its facts are
   recorded in that relay's `operations.md`.
5. **v2 — minimal intervention (replaces v1):** no standing controlling agent;
   two designed-in checkpoints only (preparation approval, draft-PR review);
   the design-review leg resolves non-material ambiguities itself and stops
   only on material concerns; architectural queries become visible intervention
   stops; review is proportionate (applicable aspects chosen from the actual
   diff) rather than a fixed panel. Model economics, verification gate, commit
   policy, handover doc, fix budget, and the two-attempt review/fix policy are
   unchanged from v1.