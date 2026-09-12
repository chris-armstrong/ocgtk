# Implementation Relay — Design

A pi Relay operational profile for turning a design document plus implementation
instructions into a merged draft PR. Built on the `relay` method (base skill) with a
custom profile derived from `relay-runner`.

## 0. What exists in the repo already

The repo ships a specialist-reviewer system under `.opencode/agents/` (ported from an
opencode setup; prompt text is tool-agnostic):

| Reviewer | Aspects | Guideline files (`docs/code_guidelines/`) |
|---|---|---|
| `abstractions-reviewer` | module design, abstraction | `abstractions.md` |
| `type-correctness-reviewer` | types, pattern matching, module boundaries | `type-safety.md`, `pattern-matching.md`, `module-boundaries.md` |
| `code-quality-reviewer` | naming, intermediates, reuse | `naming-and-intermediates.md`, `code-reuse.md` |
| `control-flow-reviewer` | nesting, error handling, partial functions | `nesting-and-control-flow.md`, `error-handling.md`, `partial-functions.md` |
| `docs-reviewer` | comments, documentation | `comments-and-documentation.md` |
| `test-reviewer` | test patterns, e2e | `test-patterns.md`, `atspi-e2e-testing.md` |

Plus `review.txt` (coordinator that fans these out) and
`.claude/agents/refactor-reviewer.md` (goal-attainment reviewer, unused here).

**Suggestion:** the six aspect reviewers above are exactly the "own aspect" parallel
review agents the relay needs. We reuse them verbatim as the subreview prompt cores
(they already enforce report-only-by-default, mandatory guideline reading, and a
structured output). The relay profile records them as the canonical review-aspect
definitions instead of inventing new ones. Minor adaptation needed: swap "Read tool"
wording for pi's `read` tool — content is otherwise portable.

The fixer leg maps each failed aspect to the same guideline files, so fixes are
anchored to the same authority the reviewers used.

## 1. Model assignments

| Role | Model | Notes |
|---|---|---|
| Design reviewer | `glm-5.3` | light review only |
| Controlling agent (prep, query resolution, dispatch) | this session / `glm-5.3` | owns packet, human gates |
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
design-review.md        leg-1 light design review: findings + human resolutions
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
Leg 1  design-review      glm-5.3        report → STOP (human gate 1)
Gate  1 go-ahead          human (via controlling agent, ask_user)
Leg 2..n implementation   glm-5.3-flash  sequential; each commits; STOP on arch query
Leg r  aspect-review      deepseek-v4-flash (consolidator) + 6 parallel subsessions
Leg f  fix                glm-5.3        bounded tool budget; commits
Leg r' re-review          deepseek-v4-flash  failed aspects only
Leg f' fix                glm-5.3        second and final automatic round
Gate  2 stop-and-notify   human          if blocking findings remain
Leg d  delivery           push + gh pr create --draft
```

### Leg 1 — design review (glm-5.3)

Input: the design + implementation instructions (as given in the charter draft).
Not a full design review. It checks **consistency** (internally, and against the
repo as a target) and **size** (is this one relay, one branch, a sane slice?).
Output: `design-review.md` containing:

- recommendations (non-binding),
- concerns that would affect implementation,
- unresolved questions and ambiguities (numbered, each phrased as a decision the
  human must make),
- a proposed rough decomposition into sequential parts (advisory only; real
  slicing stays adaptive per the base method).

It writes nothing else, touches no code, then stops. It does not dispatch.

### Gate 1 — human go-ahead

The controlling agent presents `design-review.md`, resolves numbered questions with
the human (`ask_user`), folds answers into the charter (if they move goal/edges) or
into `design-review.md` resolutions (if they are route facts), and only then
dispatches implementation. **Dispatch never happens without explicit go-ahead.**

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
   - sets status to blocked-with-query,
   - stops. The controlling agent takes it to the human, records the resolution in
     `handover.md` (as a **decision** with rationale) and dispatches a fresh
     continuation leg. This is the "hand back for query resolution" rule.
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
2. Spawns **parallel subsessions** (`spawn_subsession`), one per failed-or-all
   aspect, each prompted with the corresponding `.opencode/agents/*-reviewer.txt`
   text plus: repo, diff range, charter goal/edges, and **report-only** prohibition
   (no writes at all, including packet).
3. `yield_to_subsessions`, collects reports, classifies each finding
   **blocking** (concrete evidence: reproduced failure, failing check, concrete
   violated guideline with specific code) vs **non-blocking**, writes
   `reviews/round-<N>/<aspect>.md`, updates status (`review attempts: N`), logs.
4. Round 1 reviews **all six aspects**; round 2 reviews **only aspects with
   blocking findings**, focusing on remediation and regressions (findings already
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

1. Relay preparation approval (packet draft review — standard relay-runner preflight).
2. **Gate 1:** design-review go-ahead + ambiguity resolution.
3. Architectural queries surfaced by implementation agents (as they arise; may be
   batched if several legs stall on related questions).
4. Fixer gives up / budget exhausted with material findings outstanding.
5. Blocking findings survive round 2 → stop-and-notify.
6. Any relay-runner intervention trigger (environment unusable, scope question,
   delivery failure, …).

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
  decisions in `handover.md` are recorded facts, not authority.
- **Bounded orientation** — nobody reads `log.md` end-to-end; `handover.md` is the
  working continuity surface, kept compressed each round.

## 6. Open questions for the human

1. Fix-budget default of 60 tool calls per fix leg — sensible, or prefer
   wall-clock/finding-count bounds?
2. Should the design reviewer's advisory decomposition be binding for leg 2
   (first implementation slice) or purely advisory (recommended: advisory)?
3. Should `refactor-reviewer` (goal-attainment) join the aspect panel when the
   design names a measurable refactor goal? (Suggested: yes, optional seventh
   aspect, only when the design has a quantified goal.)
4. PR target branch and relay working mode (in-place on this branch vs
   fresh worktree from the integration base)?