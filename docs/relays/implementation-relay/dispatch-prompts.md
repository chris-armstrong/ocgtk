# implementation-relay — dispatch prompt templates (v2, minimal intervention)

Handoff prompts for each leg type. Every prompt names the `relay` and
`relay-runner` skills (fresh sessions inherit nothing), passes the model
explicitly, and points at the packet. Substitute `<angle brackets>`. The
packet root is `.pi-web/relays/<name>/`.

Dispatch rules: the preparation session dispatches leg 1 once after explicit
human approval; after that, each runner hands off exactly once at the end of
its leg. After an **intervention stop**, the human resolves in the packet and
re-dispatches the continuation leg themselves (template 6) — no intermediary
agent exists.

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
slice?). You do NOT implement and do NOT modify any file outside the packet.

Write .pi-web/relays/<name>/design-review.md containing:
1. Recommendations (non-binding).
2. Concerns that would affect implementation.
3. Unresolved questions / ambiguities — numbered, each with a disposition:
   - resolved by you within the charter's edges (record the decision and
     rationale), or
   - MATERIAL: it would move the goal, an edge, or a cost/feasibility
     assumption and needs a human decision.
4. An advisory rough decomposition into sequential parts (advisory only).

Then update status.md and append log.md. Next:
- If NO finding is material: proceed normally — update status with the first
  implementation slice, and hand off exactly once with spawn_session using
  template 2 (model glm-5.3-flash). Do not stop.
- If ANY finding is material: set the intervention signal in status.md
  (blocked-on-material-concern, pointing at design-review.md) and STOP
  without spawning. Do not guess what the human would decide.
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
  blocked-with-query with the intervention signal, and STOP. Do not guess.
- If the design or the slice turns out to rest on a material ambiguity, STOP
  the same way rather than inventing an interpretation.
- Before finishing you MUST pass the verification gate defined in
  operations.md (build @all, tests, fmt), commit all and only your delivery
  changes (one commit, message explains why), update handover.md and
  status.md, append log.md — then hand off exactly once with spawn_session,
  or stop if your slice is the final implementation slice (next leg: aspect
  review).
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

- Select the APPLICABLE aspects from the actual diff (profile's proportionate
  selection: at least one; every aspect whose guideline surfaces the diff
  touches; refactor-reviewer only if the design states a quantified goal).
  This round's aspects: <aspect agent list>. Round <N> focus: <round 1: full
  review of selected aspects / round 2: failed aspects only, remediation and
  regressions, prior dispositions carried forward>.
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
- Do not fix anything yourself. Then hand off exactly once with spawn_session
  (next: fix leg if blocking findings, else delivery).
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
  (intervention stop via Open questions), verification gate MUST pass,
  commit all and only your delivery changes before handoff, update
  handover.md, status.md, log.md, then hand off exactly once with
  spawn_session (next: re-review of failed aspects, or delivery if clean).
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
log.md. No code changes on this leg. After delivery the human reviews the
draft PR — do not merge, address review comments, or iterate beyond the
recorded delivery mechanism.
```

## 6. Continuation after an intervention stop

After the human resolves a stop (decision + rationale recorded in
`handover.md` or `design-review.md`), dispatch the continuation with the
matching template (2, 3, or 4) plus this preamble:

```text
<template 2/3/4 text>

Intervention resolution: the stop recorded in status.md has been resolved by
the human. Decision (recorded in <file>): <decision + rationale>. Continue
with: <next slice or leg>.
```