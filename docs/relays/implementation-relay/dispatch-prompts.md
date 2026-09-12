# implementation-relay — dispatch prompt templates

Handoff prompts for each leg type. Every prompt names the `relay` and
`relay-runner` skills (fresh sessions inherit nothing), passes the model
explicitly, and points at the packet. Substitute `<angle brackets>`. The
packet root is `.pi-web/relays/<name>/`. All prompts are dispatched with
`spawn_session` as the dispatcher's final operational action.

## 1. Design review (leg 1 — model `glm-5.3`)

```text
Relay "<name>" leg 1 (design-review) begins now.

Work under the Relay method with the `relay-runner` operational profile as
specialized by docs/relays/implementation-relay/profile.md.
Load the `relay` and `relay-runner` skills, then read:
- .pi-web/relays/<name>/charter.md
- .pi-web/relays/implementation-relay/profile.md (profile bindings)
- .pi-web/relays/<name>/status.md

Your leg: LIGHT design review of the design recorded in the charter's source
material. NOT a full design review. Check consistency (internal, and against
this repository as the target) and size (is this one relay, one branch, a sane
slice?). You do NOT implement, do NOT modify any file outside the packet, and
do NOT dispatch anything.

Write .pi-web/relays/<name>/design-review.md containing:
1. Recommendations (non-binding).
2. Concerns that would affect implementation.
3. Unresolved questions / ambiguities — numbered, each phrased as a decision
   the human must make.
4. An advisory rough decomposition into sequential parts (advisory only).

Then update status.md (leg 1 complete; next = human gate, not a dispatch),
append log.md, and STOP. Do not spawn a successor: the human go-ahead gate
belongs to the controlling agent.
```

## 2. Implementation leg (model `glm-5.3-flash`)

```text
Relay "<name>" leg <identifier> (implementation) begins now.

Work under the Relay method with the `relay-runner` operational profile as
specialized by docs/relays/implementation-relay/profile.md.
Load the `relay` and `relay-runner` skills, then read:
- .pi-web/relays/<name>/charter.md
- .pi-web/relays/<name>/operations.md
- .pi-web/relays/<name>/status.md
- .pi-web/relays/<name>/handover.md  (shared handover document)

Do not read log.md end-to-end; use only targeted entries referenced above.

Your bounded slice (from status): <slice statement — outcome, change surface,
verification, checkpoint type>.

Rules:
- You must NOT make key architectural decisions (module boundaries,
  cross-cutting type changes, dependencies, FFI strategy, generated-code
  strategy). If one is needed: record the question with options and a
  recommendation under "Open questions" in handover.md, set status to
  blocked-with-query, and STOP. Do not guess.
- Before finishing you MUST pass the verification gate defined in
  operations.md (build @all, tests, fmt), commit all and only your delivery
  changes (one commit, message explains why), update handover.md and
  status.md, append log.md — then hand off exactly once with spawn_session,
  or stop if your slice is the final implementation slice.
- Record proposals as Open questions in handover.md; never record decisions
  as taken.
```

## 3. Review leg (model `deepseek-v4-flash`)

```text
Relay "<name>" leg <identifier> (aspect review, round <N>) begins now.

Work under the Relay method with the `relay-runner` operational profile as
specialized by docs/relays/implementation-relay/profile.md.
Load the `relay` and `relay-runner` skills, then read:
- .pi-web/relays/<name>/charter.md
- .pi-web/relays/<name>/operations.md
- .pi-web/relays/<name>/status.md

Your leg: consolidate an aspect review of the exact diff recorded in
operations.md (<review range>).

- Aspects this round: <aspect agent list — round 1: all applicable; round 2:
  failed aspects only>.
- For each aspect, spawn one report-only subsession (spawn_subsession) with
  model deepseek-v4-flash. The subreviewer runs the pi project agent
  instructions for that aspect (e.g. .pi/agents/control-flow-reviewer.md):
  give it the repository, the diff range or file list, the charter's goal
  and edges, and the mandatory guideline files it names.
- Reviewers NEVER fix and never write anything, including packet files. You
  are the sole packet writer.
- After collecting reports (yield_to_subsessions), classify each finding
  blocking (concrete evidence: reproduced failure, failing check, or a
  concretely violated guideline with specific code) vs non-blocking.
- Write .pi-web/relays/<name>/reviews/round-<N>/<aspect>.md with the
  consolidated, classified findings in risk order; update status.md
  (review attempts: N) and log.md.
- Do not fix anything yourself. Then hand off exactly once with
  spawn_session (next: fix leg or, if no blocking findings, delivery),
  or stop per the profile's stop-and-notify rule.
```

## 4. Fix leg (model `glm-5.3`)

```text
Relay "<name>" leg <identifier> (fix, round <N>) begins now.

Work under the Relay method with the `relay-runner` operational profile as
specialized by docs/relays/implementation-relay/profile.md.
Load the `relay` and `relay-runner` skills, then read:
- .pi-web/relays/<name>/charter.md
- .pi-web/relays/<name>/operations.md
- .pi-web/relays/<name>/status.md
- .pi-web/relays/<name>/reviews/round-<N>/  (findings for your aspects)

Your leg: resolve the blocking findings listed for your round, in risk order,
within a bounded budget of 60 tool calls (count every tool call; the
verification gate costs ~3; converge or give up by ~80%). Fixers anchor fixes
to the same guideline files the reviewers used.

Rules:
- You may delegate independent, well-scoped findings to bounded
  glm-5.3-flash subsessions; you remain sole committer and sole packet
  writer, and you verify everything (verification gate) before committing.
- If the findings exceed what one bounded leg can absorb, give up cleanly:
  record which findings remain untouched and why, set the intervention
  signal in status.md, append log.md, and STOP. Never half-fix across the
  board.
- Same rules as implementation agents: no key architectural decisions
  (hand back via Open questions), verification gate MUST pass, commit all
  and only your delivery changes before handoff, update handover.md,
  status.md, log.md, then hand off exactly once with spawn_session.
```

## 5. Delivery leg (model of dispatching session)

```text
Relay "<name>" leg <identifier> (delivery) begins now.

Work under the Relay method with the `relay-runner` operational profile as
specialized by docs/relays/implementation-relay/profile.md.
Load the `relay` and `relay-runner` skills, then read:
- .pi-web/relays/<name>/status.md  (targeted approval entry)
- .pi-web/relays/<name>/operations.md  (delivery mechanism, review range)

Verify: integration base still resolves to the recorded base commit, HEAD
equals the reviewed HEAD, working tree clean apart from the packet. If any
mismatch is unexpected, STOP with the intervention signal.

Then execute delivery only: `git push -u origin <branch>` and
`gh pr create --draft` with a body stating what changed and why, behavioral
changes, and exact verification results. Record the PR URL in status.md and
log.md. No code changes on this leg.
```

## Continuation after query resolution

After the controlling agent resolves an implementation agent's architectural
query, it dispatches a fresh implementation leg (template 2) whose slice
statement names the recorded decision: "Decision (recorded in handover.md):
<decision>. Continue with: <next slice>."