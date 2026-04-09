# Test Suite Remediation Plan

**Status: 🔲 NOT STARTED (2026-04-09)**

## Overview

A comprehensive audit of the test suite across `ocgtk/src/tools/test_gir_gen/` and
`ocgtk/tests/` identified five categories of problems: structural misplacement of
files, naming inconsistencies, string-based assertion violations, factory bypass, and
code duplication. This plan addresses all five in dependency order.

The audit was performed on branch `tests-cleanup` at commit `65c0d51d`.

---

## Phase 1 — Directory restructure and file moves

*Prerequisite for all subsequent phases. Pure moves — no logic changes.*

### 1.1 Create `class_generation/` subdirectory

`method_wrapper_tests.ml` and `constructor_wrapper_tests.ml` are Layer 2 (class
generation) unit tests currently stranded at the root of `test_gir_gen/`. The
`GIR_GEN_TESTING.md` documentation already describes this layer but the directory
was never created.

**Actions:**
- [ ] Create `ocgtk/src/tools/test_gir_gen/class_generation/`
- [ ] Move `method_wrapper_tests.ml` → `class_generation/method_wrapper_tests.ml`
- [ ] Move `constructor_wrapper_tests.ml` → `class_generation/constructor_wrapper_tests.ml`
- [ ] Update `dune` modules list

### 1.2 Create `overrides/` subdirectory

Eight files testing the override/version-guard system live loose at the root with
no grouping. Six use a `test_` prefix, two use a `_tests` suffix — inconsistent even
within the group.

**Actions:**
- [ ] Create `ocgtk/src/tools/test_gir_gen/overrides/`
- [ ] Move and rename each file (strip `test_` prefix, add `_tests` suffix for consistency):

  | Current (root) | Target (overrides/) |
  |----------------|---------------------|
  | `test_override_types.ml` | `types_tests.ml` |
  | `test_override_parser.ml` | `parser_tests.ml` |
  | `test_override_apply.ml` | `apply_tests.ml` |
  | `test_override_extractor.ml` | `extractor_tests.ml` |
  | `test_override_e2e.ml` | `e2e_tests.ml` |
  | `test_override_integration.ml` | `integration_tests.ml` |
  | `version_guard_tests.ml` | `version_guard_tests.ml` *(unchanged)* |
  | `test_enum_member_version.ml` | `enum_member_version_tests.ml` |

- [ ] Update `dune` modules list (rename entries to match new module names)
- [ ] Update `test_gir_gen.ml` runner references

### 1.3 Move `c_validation_tests.ml` out of `infrastructure/`

`infrastructure/c_validation_tests.ml` is a test file that lives in a directory
reserved for test support code (helpers, parsers, validators). Tests of the
`C_validation` module belong alongside the other C-level tests in `c_stubs/`.

**Actions:**
- [ ] Move `infrastructure/c_validation_tests.ml` → `c_stubs/c_validation_tests.ml`
- [ ] Update `dune` modules list

### 1.4 Consolidate `c_stubs/cross_namespace_tests.ml` into `cross_namespace/`

`c_stubs/cross_namespace_tests.ml` tests cross-namespace type references in C stubs.
The `cross_namespace/` directory already exists for this concern. Having a
cross-namespace test inside `c_stubs/` creates ambiguity about which is the canonical
home.

**Actions:**
- [ ] Move `c_stubs/cross_namespace_tests.ml` → `cross_namespace/c_stub_tests.ml`
- [ ] Update `dune` modules list
- [ ] Update `test_gir_gen.ml` runner reference

### 1.5 Rename `integration/` files for consistency

Integration test files currently use plain noun names with no suffix (`core.ml`,
`parser.ml`, `signals.ml`) while every other directory uses `_tests.ml`. The runner
labels them `"Core"` and `"Parser"` with no indication they are integration tests.

Additionally, `core.ml` tests four unrelated concerns in one file and must be split.

**Actions:**

Split `core.ml` into four files:
- [ ] `core.ml` → `gir_parsing_tests.ml` (test_gir_parsing, test_c_code_generation)
- [ ] `core.ml` → `widget_generation_tests.ml` (test_widget_generation, test_many_methods_*)
- [ ] `core.ml` → `nullable_generation_tests.ml` (test_nullable_*)
- [ ] `core.ml` → `cli_tests.ml` (test_help_text)
- [ ] Delete `core.ml`

Rename remaining integration files:
- [ ] `parser.ml` → `parser_tests.ml`
- [ ] `signals.ml` → `signals_tests.ml`
- [ ] `enums.ml` → `enums_tests.ml`
- [ ] `records.ml` → `records_tests.ml`
- [ ] `properties.ml` → `properties_tests.ml`
- [ ] `edge_cases.ml` → `edge_cases_tests.ml`

- [ ] Update `dune` modules list for all renames
- [ ] Update `test_gir_gen.ml` runner references

### 1.6 Rename `c_stubs/c_stubs_tests.ml`

The filename is redundant — a file called `c_stubs_tests.ml` inside a directory
called `c_stubs/`. The file tests general C stub generation.

**Actions:**
- [ ] Rename `c_stubs/c_stubs_tests.ml` → `c_stubs/generation_tests.ml`
- [ ] Update `dune` modules list
- [ ] Update `test_gir_gen.ml` runner reference (`C_stubs_tests` → `Generation_tests`)

### 1.7 Reorganise runner registration order

`test_gir_gen.ml` has 51 entries in an order that mixes layers with no grouping.
Reorganise to match the documented layer hierarchy with comment separators.

**Actions:**
- [ ] Group entries in `test_gir_gen.ml` as:
  1. Layer 0 — C Stub Generation (`c_stubs/`)
  2. Layer 1 — ML Generation (`ml_generation/`)
  3. Layer 2 — Class Generation (`class_generation/`)
  4. Integration — End-to-end subprocess (`integration/`)
  5. Cross-namespace (`cross_namespace/`)
  6. Override system (`overrides/`)
- [ ] Add comment lines between groups

---

## Phase 2 — Integration test AST migration

*Replaces banned string-matching assertions with AST-based validation per
`test-patterns.md`. Prerequisite: Phase 1 complete (files in final locations).*

### 2.1 Add missing `Ml_validation` helpers for `.mli` files

The existing `Ml_validation` helpers work against `.ml` structures. Integration
tests read `.mli` files and need signature-level variants.

**Actions:**
- [ ] Add `assert_value_exists_sig : signature -> string -> unit` to `ml_validation.ml`
  — checks that a `val name : ...` or `external name ...` exists in a `.mli` AST
- [ ] Add `assert_type_has_variant_tag_sig : signature -> string -> string -> unit`
  — convenience: finds type by name in a signature, asserts it has the given
  polymorphic variant tag. Used by enum tests.
- [ ] Update `infrastructure/ml_validation.mli` if it exists

### 2.2 Migrate `integration/signals_tests.ml`

This file calls `Gir_gen_lib.Generate.Signal_gen.generate_signal_class` directly
(in-process, not via subprocess) but validates with `assert_contains`. It is also
the simplest file — good warmup.

**Actions:**
- [ ] Extract the in-process generation call and validate with
  `Ml_ast_helpers.parse_implementation` + `Ml_validation.assert_value_exists`
- [ ] The subprocess path (if any is added) stays in `integration/`; the unit test
  portion moves to `class_generation/signal_wrapper_tests.ml`
- [ ] Remove all `assert_contains` / `string_contains` calls

### 2.3 Migrate `integration/edge_cases_tests.ml`

Two `assert_contains` / one `string_contains` call — smallest integration file.

**Actions:**
- [ ] Replace `.mli` content checks with `parse_interface` + `assert_value_exists_sig`
- [ ] Replace `.ml` content checks with `parse_implementation` + `assert_value_exists`

### 2.4 Migrate `integration/properties_tests.ml`

~15 string-matching assertions across three test functions. Validates both `.mli`
(getter/setter existence, type signatures) and `.c` (function names, g_object_get/set).

**Actions:**
- [ ] `.mli` assertions: `parse_interface` → `assert_value_exists_sig`
- [ ] Type signature assertions (`"t -> bool"`, `"t -> int"`): `find_value_declaration_sig`
  + `Ml_validation.assert_return_type`
- [ ] `.c` assertions: `C_parser.parse_c_code` → `C_validation.calls_c_function`,
  `has_caml_return`
- [ ] Remove all `assert_contains` / `string_contains` calls

### 2.5 Migrate `integration/enums_tests.ml`

~20 string-matching assertions. Validates polymorphic variant types in `.mli` and
converter functions in `.c`.

**Actions:**
- [ ] `.mli` enum type assertions: `parse_interface` → `assert_type_has_variant_tag_sig`
  (using new helper from 2.1)
- [ ] `.c` assertions: `C_parser.parse_c_code` → find function by name, check
  `calls_c_function`
- [ ] Remove all `assert_contains` / `string_contains` calls

### 2.6 Migrate `integration/records_tests.ml`

~10 string-matching assertions. Several check exact C header declaration signatures
(e.g. `"GtkWidgetClass *GtkWidgetClass_val(value val);"`).

**Actions:**
- [ ] Header forward-declaration assertions: `C_validation.assert_forward_decl_exists`
  (already exists — direct replacement)
- [ ] Exact C type signature assertions: accept structural check (name exists) as
  sufficient; the exact type format is covered by `c_stubs/` unit tests
- [ ] `.c` assertions: `C_parser.parse_c_code` → `C_validation.*`
- [ ] Remove all `assert_contains` / `assert_not_contains` calls

### 2.7 Migrate `integration/gir_parsing_tests.ml` and `integration/widget_generation_tests.ml`

(Post-split files from `core.ml`.) ~25 combined string-matching assertions.

**Actions:**
- [ ] `.c` assertions: `C_parser.parse_c_code` → `C_validation.has_caml_return`,
  `calls_c_function`
- [ ] `.mli` assertions: `parse_interface` → `assert_value_exists_sig`
- [ ] "GENERATED CODE" header comment check: acceptable to keep as
  `assert_contains` — this is a file-level comment, not a code structure check.
  Document the exception inline.
- [ ] Remove remaining `assert_contains` / `string_contains` calls

### 2.8 Remove deprecated helpers from `helpers.ml`

Once all callers are migrated, remove the deprecated functions.

**Actions:**
- [ ] Delete `string_contains` (lines 15–20 of `helpers.ml`)
- [ ] Delete `assert_contains` (lines 24–27)
- [ ] Delete `assert_not_contains` (lines 29–32)
- [ ] Delete the DEPRECATED block comment (lines 9–13)
- [ ] Verify build passes with no references remaining

---

## Phase 3 — Factory consistency

*Makes GIR type construction consistent across all test files. Independent of
Phase 2.*

### 3.1 Eliminate duplicate factory functions in override tests

`overrides/apply_tests.ml` (ex `test_override_apply.ml`, lines 19–99) and
`overrides/enum_member_version_tests.ml` (ex `test_enum_member_version.ml`,
lines 37–55) each define local `make_method`, `make_constructor`, `make_property`,
`make_signal`, `make_enum`, `make_bitfield` etc. that are near-identical to
`Type_factory` functions. These won't track changes to factory signatures.

**Actions:**
- [ ] Audit local helper signatures against `Type_factory` equivalents
- [ ] For each local helper: either replace call sites with `Type_factory.*` directly,
  or (if the local helper adds version-specific fields) add a version-aware variant
  to `Type_factory` and delete the local copy
- [ ] Verify no local factories remain in override test files

### 3.2 Migrate `ml_generation/` tests to use `Type_factory`

All three `ml_generation/` test files construct GIR methods, constructors, and
parameters using inline record syntax instead of factory functions.

**Actions:**
- [ ] `external_decl_tests.ml` lines 14–43, 81–102: replace inline `gir_method`
  records with `Type_factory.make_gir_method` + `make_gir_param`
- [ ] `signature_tests.ml` lines 64–82, 135–150: replace inline `gir_constructor`
  and `gir_method` records with factory calls
- [ ] `type_definition_tests.ml` lines 87–96: replace inline construction with factory

### 3.3 Migrate cross-namespace tests to use `Type_factory`

`cross_namespace/classify_type_tests.ml` (lines 25–70) and
`cross_namespace/integration_tests.ml` (lines 18–57) build `generation_context`
manually with inline record syntax and `StringMap` construction.

**Actions:**
- [ ] Replace inline `generation_context` records with
  `Type_factory.make_generation_context`
- [ ] Add a `make_cross_reference_map` helper to `Type_factory` (takes an association
  list, builds the `StringMap`) to eliminate the repeated manual map construction

---

## Phase 4 — Deduplication

*Extract repeated patterns into helpers. Independent of Phases 2 and 3.*

### 4.1 Integration test harness helper (~180 lines saved)

30+ integration test functions share identical 6–7 line setup:

```ocaml
let test_gir = "/tmp/test_foo.gir" in
let test_filter = "/tmp/test_foo_filter.conf" in
let output_dir = "/tmp/test_foo_output" in
create_gir_file test_gir foo_gir;
create_filter_file test_filter ["Foo"];
ensure_output_dir output_dir;
let exit_code = run_gir_gen ~filter_file:test_filter test_gir output_dir in
assert_true "Generator should exit successfully" (exit_code = 0);
```

**Actions:**
- [ ] Add to `infrastructure/helpers.ml`:
  ```ocaml
  val run_integration_test
    :  gir_content:string
    -> class_names:string list
    -> test_name:string
    -> ?filter:bool
    -> unit
    -> string  (* returns output_dir *)
  ```
- [ ] Replace all call sites across `integration/`

### 4.2 C method generation + parse helper (~140 lines saved)

35+ C stub unit tests share the same 4–5 line pattern of: create context → create
method → generate C → parse → find function.

**Actions:**
- [ ] Add to `infrastructure/helpers.ml` or a new `c_stubs/c_stub_test_helpers.ml`:
  ```ocaml
  val generate_and_find_c_method
    :  c_type:string
    -> class_name:string
    -> gir_method
    -> c_function  (* parsed result, or fails test *)
  ```
- [ ] Replace call sites across `c_stubs/`

### 4.3 GTK init deduplication in `ocgtk/tests/` (~65 lines saved)

`tests/gtk/gtk_test_helpers.ml` already defines `require_gtk`. The identical 5-line
GTK availability check is copy-pasted into 13 other test files that don't use it.

**Actions:**
- [ ] Remove the duplicate GTK init block from each of the 13 files that define it
  inline
- [ ] Replace with `let require_gtk = Gtk_test_helpers.require_gtk` or open the module
- [ ] Verify no test files still define their own `gtk_available`/`require_gtk`

### 4.4 `EventControllerKey` GIR constant (~15 lines saved)

The same stub class XML appears in `integration/core.ml`, `integration/enums_tests.ml`,
and `integration/signals_tests.ml` as a namespace filler.

**Actions:**
- [ ] Add `let eventcontroller_key_class_xml` constant to `infrastructure/helpers.ml`
- [ ] Replace inline definitions in the 3+ files that repeat it

### 4.5 Cross-namespace context builder (~105 lines saved)

`cross_namespace/integration_tests.ml` builds a full `generation_context` with
`StringMap` cross-references in every test function (~35 lines × 4 tests).

**Actions:**
- [ ] After Phase 3.3 (factory migration), verify `Type_factory.make_generation_context`
  + the new `make_cross_reference_map` helper covers this case
- [ ] Replace inline context construction in all 4 test functions

---

## Phase 5 — `ocgtk/tests/` disabled test audit

*Independent of all other phases.*

The `ocgtk/tests/dune` file has ~26 commented-out test stanzas. Test files exist on
disk but are unreachable, making coverage opaque.

### 5.1 Categorise each disabled test

For each disabled `.ml` file, determine:

**Delete** — tested functionality no longer exists in this form:
- `test_enum_roundtrip.ml`, `test_enum_values.ml`, `test_all_enums.ml` — used `Conv`
  module (enum conversion now at C level); the round-trip property is covered by
  generated C converters tested in `test_gir_gen/integration/enums_tests.ml`
- `test_ffi_integration.ml` — `Conv` module; check whether FFI integration is covered
  by `test_integration.ml` before deleting
- `test_glib.ml`, `test_gobject.ml`, `test_gdk.ml` — `Conv` module; verify equivalent
  coverage elsewhere

**Rewrite** — functionality exists but API changed:
- `test_gpack.ml` — GPack module needs rewrite for new API
- `test_window.ml` — GWindow module needs rewrite

**Re-enable when APIs land** — keep disabled, improve comment:
- `test_event_controller.ml`, `test_grid.ml`, `test_containers.ml` — missing generated
  APIs; add explicit `(* Blocked: API X not yet generated *)` comment

**Verify moved** — stale stanzas for tests moved to `gtk/`:
- `test_widget.ml`, `test_box.ml`, `test_button.ml`, `test_range.ml` — confirm
  `tests/gtk/` equivalents are enabled in `tests/gtk/dune`, then delete stale stanzas

**Unclear** — read and categorise:
- `test_gdkpixbuf.ml`, `test_pango.ml`, `test_clipboard.ml`, `test_snapshot.ml`,
  `test_gobj.ml`

### 5.2 Clean up `ocgtk/tests/dune`

**Actions:**
- [ ] For each test in "Delete" category: remove `.ml` file and dune stanza
- [ ] For each test in "Rewrite" category: create a tracking issue; add explicit
  `(* TODO #NNN: rewrite for new API *)` comment in dune
- [ ] For each test in "Re-enable" category: improve comment to name the blocking API
- [ ] For each test in "Verify moved" category: confirm gtk/ equivalent is active,
  delete stale stanza and `.ml` file

---

## Target file layout

### `test_gir_gen/` after Phase 1

```
test_gir_gen/
  test_gir_gen.ml              ← runner

  infrastructure/              ← support code only, no test files
    helpers.ml
    c_ast.ml
    c_parser.ml
    c_validation.ml
    ml_ast_helpers.ml
    ml_validation.ml
    layer2_helpers.ml

  util/
    type_factory.ml

  c_stubs/                     ← Layer 0 unit tests
    generation_tests.ml        ← was c_stubs_tests.ml
    header_naming_tests.ml
    header_generation_tests.ml
    c_validation_tests.ml      ← moved from infrastructure/
    nullable_tests.ml
    error_handling_tests.ml
    out_params_tests.ml
    array_tests.ml
    type_conversion_tests.ml
    c_stub_version_guard_tests.ml

  ml_generation/               ← Layer 1 unit tests
    type_definition_tests.ml
    external_decl_tests.ml
    signature_tests.ml

  class_generation/            ← Layer 2 unit tests (new)
    method_wrapper_tests.ml
    constructor_wrapper_tests.ml
    signal_wrapper_tests.ml    ← extracted from integration/signals

  overrides/                   ← Override system tests (new)
    types_tests.ml
    parser_tests.ml
    apply_tests.ml
    extractor_tests.ml
    e2e_tests.ml
    integration_tests.ml
    version_guard_tests.ml
    enum_member_version_tests.ml

  cross_namespace/             ← Cross-namespace tests
    c_stub_tests.ml            ← was c_stubs/cross_namespace_tests.ml
    c_stub_include_tests.ml
    classify_type_tests.ml
    dependency_includes_tests.ml
    dependency_exclusion_tests.ml
    no_external_enum_decls_tests.ml
    no_external_bitfield_decls_tests.ml
    integration_tests.ml
    compilation_tests.ml

  integration/                 ← End-to-end subprocess tests
    gir_parsing_tests.ml       ← split from core.ml
    widget_generation_tests.ml ← split from core.ml
    nullable_generation_tests.ml ← split from core.ml
    cli_tests.ml               ← split from core.ml
    parser_tests.ml
    signals_tests.ml
    enums_tests.ml
    records_tests.ml
    properties_tests.ml
    edge_cases_tests.ml
```

---

## Execution order

Phases are partially independent but the recommended order is:

1. **Phase 1** (structural moves) — unblocks accurate naming everywhere else
2. **Phase 2.1** (add `Ml_validation` helpers) — unblocks Phase 2.2–2.8
3. **Phase 4.1–4.4** (deduplication helpers) — can run in parallel with Phase 2
4. **Phase 2.2–2.8** (AST migration) — after helpers exist
5. **Phase 3** (factory consistency) — independent, can interleave with Phase 2
6. **Phase 2.8** (remove deprecated helpers) — last step of Phase 2
7. **Phase 5** (disabled tests audit) — fully independent, any time

Each phase should end with `cd ocgtk && dune build && xvfb-run dune runtest` passing.
