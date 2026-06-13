# Implementation Plan: Signal-Corpus Regression Test

> Source: gir_gen/docs/plans/milestone-2-signals.md § Phase 6

## Overview

Parse all 7 signal-bearing GIR files (Gtk, Gdk, Gio, Pango, Gsk, GdkPixbuf,
Graphene), classify every signal using the existing `Signal_gen.classify`
pipeline, and produce a signal coverage snapshot of classification results. The
coverage counts Supported vs Unsupported signals broken down by
unsupported-reason category. It is serialized as a sexp file and checked into
the test tree as a baseline. Every subsequent `dune test gir_gen/` run
regenerates the coverage from live GIR files and compares it against the
baseline — any deviation (signal becoming newly unsupported, a
previously-unsupported signal becoming supported, count mismatches) fails the
test.

The test runs as a pure in-process unit test: it parses GIR files directly via
`Gir_parser.parse_gir_file`, builds a per-namespace `generation_context`
without cross-references (same-namespace-only resolution reflects the
classification capability of a single GIR file in isolation), and invokes
`Signal_gen.classify` for every signal. No `gir_gen.exe` subprocess is needed,
so the test lives in the existing `test_gir_gen` stanza.

Key design decisions:
- **No cross-references**: Each GIR file is classified against its own
  namespace-only context. Cross-namespace parameter types (e.g. a Gdk type in a
  Gtk signal) will appear as `Unsupported "unknown type …"`. This is deliberate
  — the baseline captures the honest per-file classification boundary and will
  naturally improve when cross-reference resolution is added later.
- **Sexp baseline**: The coverage uses `[@@deriving sexp]` so the baseline
  file is both human-readable and trivially diffable.
- **Separate coverage computation from the assertion**: The coverage
  computation logic is a standalone module (`Signal_corpus`) so it can be
  invoked manually when the baseline needs updating.

## Epoch 1: Coverage computation module

> Goal: A `Signal_corpus` module than can parse a GIR file, classify every
> signal, and return a typed signal coverage snapshot. Runnable from the test
> suite.

### Stage 1.1 — `Signal_corpus` module skeleton and single-file classification

**Goal**: Create `gir_gen/test/corpus/signal_corpus.ml` with a function that
parses one GIR file, builds a minimal generation context from the parsed
entities, classifies every signal in every class and interface, and returns a
list of classification outcomes.

**Files**:
- `gir_gen/test/corpus/signal_corpus.ml` — new module with the core
  classification logic

**Steps**:
1. Define a `classification_outcome` variant:
   ```ocaml
   type classification_outcome =
     | Supported of {
         class_or_iface : string;
         signal_name : string;
       }
     | Unsupported of {
         class_or_iface : string;
         signal_name : string;
         reason : string;
       }
   ```
2. Implement `classify_signals_of_file : string -> classification_outcome list`:
   a. Parse the GIR file with `Gir_parser.parse_gir_file filepath []`
      (empty filter = all classes).
   b. Build a `generation_context` from the parsed namespace, repository,
      classes, interfaces, enums, bitfields, and records. Set
      `cross_references = StringMap.empty`, `module_groups = Hashtbl.create 0`,
      `current_cycle_classes = []`.
   c. Collect all signals: iterate `classes` (field `.signals`) and
      `interfaces` (field `.signals`).
   d. For each signal: call `Signal_gen.classify ~ctx signal`. Map `Ok` to
      `Supported`, `Error` to `Unsupported` with the error string as `reason`.
3. Compile: `dune build` from repo root. No new errors.
4. Add a trivial test case that parses a small synthetic GIR snippet with one
   known-supported signal and asserts the outcome is `Supported`.

**Acceptance criteria**:
- [ ] `Signal_corpus.classify_signals_of_file` parses a real GIR file and
      returns a non-empty list of outcomes
- [ ] A synthetic GIR file with a `gboolean`-return signal produces
      `Supported`
- [ ] `dune build` passes with no new errors
- [ ] Tests pass: `dune test gir_gen/ && xvfb-run dune test ocgtk/`

---

### Stage 1.2 — Coverage aggregation data type and sexp serialization

**Goal**: Aggregate the flat list of outcomes into a coverage record and
derive sexp serialization so the coverage can be saved to and loaded from a
baseline file.

**Files**:
- `gir_gen/test/corpus/signal_corpus.ml` — extend with coverage type

**Steps**:
1. Define a `signal_coverage` type:
   ```ocaml
   type signal_coverage = {
     namespace : string;
     total_signals : int;
     supported : int;
     unsupported : int;
     by_reason : (string * int) list;  (* (reason, count) sorted by reason *)
   } [@@deriving sexp]
   ```
2. Implement `coverage_of_namespace : string -> classification_outcome list -> signal_coverage`
   that counts outcomes and groups unsupported signals by reason.
3. Implement `coverage_of_file : string -> signal_coverage` as a convenience that
   calls `classify_signals_of_file` then `coverage_of_namespace`.
4. Implement `compare_coverage : signal_coverage -> signal_coverage -> (string list, unit) result`
   that compares two coverage records field-by-field and returns `Ok ()` when they
   match or `Error reasons` listing every mismatch.
5. Add test cases:
   - Given 3 Supported and 2 Unsupported outcomes, verify `coverage_of_namespace`
     produces correct counts.
   - Given identical coverage, `compare_coverage` returns `Ok ()`.
   - Given coverage differing in `supported` count, `compare_coverage`
     returns `Error` listing the discrepancy.
6. Compile and run tests.

**Acceptance criteria**:
- [ ] `coverage_of_file "gir/Gtk-4.0.gir"` returns a non-trivial coverage
      with `total_signals > 0`
- [ ] `by_reason` groups unsupported reasons and sorts them
- [ ] `compare_coverage` detects count mismatches in `supported`,
      `unsupported`, and per-reason buckets
- [ ] `dune build` passes with no new errors
- [ ] All tests pass

---

## Epoch 2: Baseline and regression test

> Goal: A checked-in baseline coverage file for all 7 namespaces. A regression
> test that regenerates the coverage from live GIR files and compares against
> the baseline, wired into `dune test gir_gen/`.

### Stage 2.1 — Generate and check in baseline coverage files

**Goal**: Run the coverage computation against all 7 GIR files to produce a
baseline, then commit the baseline file to the test tree.

**Files**:
- `gir_gen/test/corpus/signal_corpus_baseline.sexp` — checked-in baseline

**Steps**:
1. Write a small OCaml script (or extend `signal_corpus.ml` with a `main`
   entrypoint invoked via a one-off `dune exec`) that:
   - Iterates over the 7 namespace/file pairs: `("Gtk", "Gtk-4.0.gir")`,
     `("Gdk", "Gdk-4.0.gir")`, `("Gio", "Gio-2.0.gir")`, `("Pango",
     "Pango-1.0.gir")`, `("Gsk", "Gsk-4.0.gir")`, `("GdkPixbuf",
     "GdkPixbuf-2.0.gir")`, `("Graphene", "Graphene-1.0.gir")`.
   - For each: calls `coverage_of_file`, wraps all 7 coverage records in a
     `signal_coverage list [@@deriving sexp]`, and writes the result to
     `gir_gen/test/corpus/signal_corpus_baseline.sexp`.
2. Run the script and inspect that the baseline is non-empty and reasonable
   (e.g. Gtk has hundreds of signals, Graphene has few or none).
3. Commit `signal_corpus_baseline.sexp` to git.
4. Remove the one-off script; future baseline updates can be done by
   temporarily calling the test helper directly.

**Acceptance criteria**:
- [ ] `gir_gen/test/corpus/signal_corpus_baseline.sexp` exists and contains 7
      coverage entries
- [ ] The Gtk entry has `total_signals > 100` and `supported > 0`
- [ ] `dune build` passes (the baseline file is inert data, no compilation
      impact)

---

### Stage 2.2 — Regression test that compares live coverage against baseline

**Goal**: Add a test case that reads the checked-in baseline, recomputes
coverage from the live GIR files, and asserts they match.

**Files**:
- `gir_gen/test/corpus/signal_corpus_tests.ml` — new test module
- `gir_gen/test/corpus/signal_corpus_baseline.sexp` — read by the test

**Steps**:
1. Create `gir_gen/test/corpus/signal_corpus_tests.ml`:
   a. Define `test_baseline_regression`:
      - Read `signal_corpus_baseline.sexp` from the test source tree. Use
        `Filename.dirname(__FILE__)` to locate it relative to the test module.
      - For each of the 7 namespaces: call `Signal_corpus.coverage_of_file`
        with the full GIR path (`gir_data_dir () ^ "/Gtk-4.0.gir"`, etc.),
        producing a live coverage record.
      - Look up the corresponding baseline coverage by namespace.
      - Call `Signal_corpus.compare_coverage baseline live`.
      - Accumulate all mismatches across all 7 namespaces.
      - If any mismatch: fail with a detailed message listing every difference.
   b. Register the test case with `Alcotest.test_case` as a `Slow` test
      (parsing 7 large GIR files takes noticeable time).
2. Add `signal_corpus_tests` to the `test_gir_gen` module list in
   `gir_gen/test/dune` (the unit-test stanza, not the integration stanza).
3. Add the test suite to `gir_gen/test/test_gir_gen.ml`:
   ```ocaml
   ("Signal Corpus Regression", Signal_corpus_tests.tests);
   ```

**Acceptance criteria**:
- [ ] `dune build` passes with no new errors
- [ ] First run: `dune test gir_gen/` passes (live coverage matches baseline,
      because we just generated it in Stage 2.1)
- [ ] Changing a signal classification (e.g. temporarily modifying
      `Signal_marshaller.ml` to return `Unsupported` for something currently
      Supported) causes the test to fail with a descriptive message
- [ ] All existing tests still pass

---

### Stage 2.3 — Wire into CI and verify idempotent baseline

**Goal**: Ensure the test runs as part of the standard `dune test gir_gen/`
invocation and that the baseline can be regenerated without drift.

**Steps**:
1. Verify that `dune test gir_gen/ && xvfb-run dune test ocgtk/` from a clean
   build includes the new test (it should, since it is added to the
   `test_gir_gen` Alcotest runner).
2. Run the full test suite twice in succession to confirm no flaky baseline
   mismatches (e.g. from non-deterministic ordering of coverage entries):
   ```bash
   dune test gir_gen/ && dune test gir_gen/
   ```
3. Document in `gir_gen/test/GIR_GEN_TESTING.md` (or a comment at the top of
   `signal_corpus_tests.ml`) how a developer should intentionally update the
   baseline when a legitimate signal classification change is made:
   - Temporarily run the coverage generator, overwrite
     `signal_corpus_baseline.sexp`, commit the updated baseline alongside the
     classification change.

**Acceptance criteria**:
- [ ] `dune test gir_gen/ && xvfb-run dune test ocgtk/` passes from a clean
      tree
- [ ] Consecutive runs produce identical results (no flakiness)
- [ ] The full CI pipeline (`./ci/oci run ubuntu22 test`) passes or the
      regression test is skipped if GIR files are not available in CI (adjust
      dune `(enabled_if …)` if needed)
