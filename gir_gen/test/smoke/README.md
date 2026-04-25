# Smoke tests

Tier 4 in the test classification (see Phase 1.5 of
[`docs/plans/test-suite-remediation.md`](../../../../docs/plans/test-suite-remediation.md)).

## Definition

Smoke tests **validate the generated bindings themselves** — they compile or
link against the output produced by `gir_gen`, but they do NOT depend on or
test `gir_gen` itself. They answer the question "does the generated code
work as a library", separate from "does the generator produce the right
code" (which is what every other tier in `test_gir_gen/` covers).

## Rules

- **No `gir_gen.exe` dependency.** A smoke test must run against bindings
  that were generated as part of an upstream build step. The dune stanza
  for smoke tests must NOT depend on `%{exe:../gir_gen/gir_gen.exe}`.
- **No GIR XML inputs.** Smoke tests do not parse GIR. They consume
  generated `.ml`/`.mli`/`.c` artefacts only.
- **No `/tmp` paths.** Same hygiene rule as pipeline tests: any temp
  artefacts go under `pipeline_tmp/<test_name>/` (use the
  `Pipeline_tmp` helper from `infrastructure/`).
- **Use the OCaml-configured C compiler.** Any C compilation must use
  `C_compiler.path ()` from `infrastructure/`, not a hard-coded `cc`.

## Status

This directory is currently a scaffold. Tests will be added as the
Phase 5 audit (`ocgtk/tests/`) surfaces tests that are really
"generated-bindings smoke" rather than `gir_gen` validation.
