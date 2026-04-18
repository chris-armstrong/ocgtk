# Test Suite Remediation Plan

**Status: 🔄 IN PROGRESS — Phase 1 complete (2026-04-18)**
**Last revised: 2026-04-18** — Phase 1 (all file moves and runner reorganisation)
complete on `tests-cleanup` branch; merged up to main (`d65507d8`); Phase 2+ pending.

## Overview

A comprehensive audit of the test suite across `ocgtk/src/tools/test_gir_gen/` and
`ocgtk/tests/` identified five categories of problems: structural misplacement of
files, naming inconsistencies, string-based assertion violations, factory bypass, and
code duplication. This plan addresses all five in dependency order.

The audit was performed on branch `tests-cleanup` at commit `65c0d51d`.
The plan was revised after merging main at `bafeb1ea` (2026-04-16).

### What changed in main since the plan was written

**New test files at `test_gir_gen/` root** (all use `test_` prefix — inconsistent
with planned `_tests` suffix convention):
- `test_interface_parsing.ml` — interface GIR parsing (Phase 1 of interface support)
- `test_from_gobject_gen.ml` — `from_gobject` C stub generation for interfaces
- `test_interface_inheritance.ml` — Layer 2 interface inheritance (Phase 4)
- `test_interface_method_types.ml` — Layer 2 interface method types (Phase 7)

**New infrastructure helpers added (already correct — AST-based):**
- `ml_ast_helpers.ml`: class type declaration helpers (`find_class_type_declaration_impl`,
  `find_class_definition`, `get_class_type_inherit_names`, `get_class_inherit_names`, etc.)
- `ml_validation.ml`: class inheritance validators (`assert_class_type_inherits`,
  `assert_class_type_not_inherits_prefix`, `assert_class_impl_inherits`)

**`ocgtk/tests/dune` already updated:** disabled-test comments greatly improved;
categorisation from Phase 5.1 is largely reflected in the comments already.
New tests enabled: `test_gvariant`, `test_gvariant_type`, `test_glib_bytes`,
`test_bounded_int`, `test_gio_volume_monitor`.

**`ocgtk/tests/gtk/`:** `test_interface.ml` added (already uses `Helpers.require_gtk`);
`test_button.ml` already uses `Helpers.require_gtk` — partial Phase 4.3 done.

**Not yet done:** Phase 2.1 `.mli` signature helpers, all file moves, AST migration,
factory consistency, deduplication, Phase 5 file/stanza deletions.

---

## Phase 1 — Directory restructure and file moves

*Prerequisite for all subsequent phases. Pure moves — no logic changes.*

### 1.1 Create `class_generation/` subdirectory

`method_wrapper_tests.ml` and `constructor_wrapper_tests.ml` are Layer 2 (class
generation) unit tests currently stranded at the root of `test_gir_gen/`. The
`GIR_GEN_TESTING.md` documentation already describes this layer but the directory
was never created.

**Actions:**
- [x] Create `ocgtk/src/tools/test_gir_gen/class_generation/`
- [x] Move `method_wrapper_tests.ml` → `class_generation/method_wrapper_tests.ml`
- [x] Move `constructor_wrapper_tests.ml` → `class_generation/constructor_wrapper_tests.ml`
- [x] Update `dune` modules list

### 1.2 Create `overrides/` subdirectory

Eight files testing the override/version-guard system live loose at the root with
no grouping. Six use a `test_` prefix, two use a `_tests` suffix — inconsistent even
within the group.

**Actions:**
- [x] Create `ocgtk/src/tools/test_gir_gen/overrides/`
- [x] Move and rename each file (strip `test_` prefix, add `_tests` suffix for consistency):

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

- [x] Update `dune` modules list (rename entries to match new module names)
- [x] Update `test_gir_gen.ml` runner references

### 1.3 Move `c_validation_tests.ml` out of `infrastructure/`

`infrastructure/c_validation_tests.ml` is a test file that lives in a directory
reserved for test support code (helpers, parsers, validators). Tests of the
`C_validation` module belong alongside the other C-level tests in `c_stubs/`.

**Actions:**
- [x] Move `infrastructure/c_validation_tests.ml` → `c_stubs/c_validation_tests.ml`
- [x] Update `dune` modules list

### 1.4 Consolidate `c_stubs/cross_namespace_tests.ml` into `cross_namespace/`

`c_stubs/cross_namespace_tests.ml` tests cross-namespace type references in C stubs.
The `cross_namespace/` directory already exists for this concern. Having a
cross-namespace test inside `c_stubs/` creates ambiguity about which is the canonical
home.

**Actions:**
- [x] Move `c_stubs/cross_namespace_tests.ml` → `cross_namespace/c_stub_tests.ml`
- [x] Update `dune` modules list
- [x] Update `test_gir_gen.ml` runner reference

### 1.5 Rename `integration/` files for consistency

Integration test files currently use plain noun names with no suffix (`core.ml`,
`parser.ml`, `signals.ml`) while every other directory uses `_tests.ml`. The runner
labels them `"Core"` and `"Parser"` with no indication they are integration tests.

Additionally, `core.ml` tests four unrelated concerns in one file and must be split.

**Actions:**

Split `core.ml` into four files:
- [x] `core.ml` → `gir_parsing_tests.ml` (test_gir_parsing, test_c_code_generation)
- [x] `core.ml` → `widget_generation_tests.ml` (test_widget_generation, test_many_methods_*)
- [x] `core.ml` → `nullable_generation_tests.ml` (test_nullable_*)
- [x] `core.ml` → `cli_tests.ml` (test_help_text)
- [x] Delete `core.ml`

Rename remaining integration files:
- [x] `parser.ml` → `parser_tests.ml`
- [x] `signals.ml` → `signals_tests.ml`
- [x] `enums.ml` → `enums_tests.ml`
- [x] `records.ml` → `records_tests.ml`
- [x] `properties.ml` → `properties_tests.ml`
- [x] `edge_cases.ml` → `edge_cases_tests.ml`

- [x] Update `dune` modules list for all renames
- [x] Update `test_gir_gen.ml` runner references

### 1.6 Rename `c_stubs/c_stubs_tests.ml`

The filename is redundant — a file called `c_stubs_tests.ml` inside a directory
called `c_stubs/`. The file tests general C stub generation.

**Actions:**
- [x] Rename `c_stubs/c_stubs_tests.ml` → `c_stubs/generation_tests.ml`
- [x] Update `dune` modules list
- [x] Update `test_gir_gen.ml` runner reference (`C_stubs_tests` → `Generation_tests`)

### 1.8 Move interface support test files *(new — arrived in main after plan was written)*

Four files testing the interface-support feature landed at the root of `test_gir_gen/`
with the inconsistent `test_` prefix. They need to be placed in the correct layer
directories using the `_tests` suffix convention.

**Actions:**
- [x] Move `test_interface_parsing.ml` → `interface/parsing_tests.ml` *(new subdir)*
- [x] Move `test_from_gobject_gen.ml` → `interface/from_gobject_tests.ml`
- [x] Move `test_interface_inheritance.ml` → `class_generation/interface_inheritance_tests.ml`
- [x] Move `test_interface_method_types.ml` → `class_generation/interface_method_types_tests.ml`
- [x] Update `dune` modules list
- [x] Update `test_gir_gen.ml` runner references (module names change)

---

### 1.7 Reorganise runner registration order

`test_gir_gen.ml` now has 55 entries (4 new interface entries added since the plan
was written) in an order that mixes layers with no grouping.
Reorganise to match the documented layer hierarchy with comment separators.

**Actions:**
- [x] Group entries in `test_gir_gen.ml` as:
  1. Layer 0 — C Stub Generation (`c_stubs/`)
  2. Layer 1 — ML Generation (`ml_generation/`)
  3. Layer 2 — Class Generation (`class_generation/`) — includes interface inheritance
     and interface method types entries (moved in Phase 1.8)
  4. Interface Parsing & C Stubs (`interface/`) — includes parsing and from_gobject
     entries (moved in Phase 1.8)
  5. Integration — End-to-end subprocess (`integration/`)
  6. Cross-namespace (`cross_namespace/`)
  7. Override system (`overrides/`)
- [x] Add comment lines between groups

---

## Phase 1.5 — Test classification and pipeline-test discipline

*Recorded as a decision (DECISIONS.md, 2026-04-18). Establishes a 5-tier
classification of tests in this project. Renames exist files to match the
classification and tightens the rules pipeline tests must follow.*

### Classification

| Tier | Definition | Where |
|------|------------|-------|
| **Unit** | Single function/module. No FS, no subprocess, no `cc` invocation. | All other directories under `test_gir_gen/`. |
| **Pipeline** | Multiple in-process modules wired together. May write temp files; may invoke a C compiler. No `gir_gen.exe` subprocess. | Lives next to its domain (`overrides/pipeline_tests.ml`, `cross_namespace/header_pipeline_tests.ml`). |
| **Integration** | Spawns the `gir_gen.exe` binary; asserts on artefacts on disk. Slow; runs as a group. | **Reserved** for `test_gir_gen/integration/`. |
| **Smoke** | Validates the generated bindings themselves (compiles/links against generated output). Does NOT depend on or test `gir_gen`. | New `test_gir_gen/smoke/` directory. |
| **E2E** | Application-level UI automation (e.g. AT-SPI) of full example apps. | Outside `test_gir_gen/`; documented in `docs/code_guidelines/atspi-e2e-testing.md`. |

### Pipeline-test discipline

- [ ] Pipeline tests must write temp files under
  `_build/<context>/pipeline_tmp/<test-name>/` (i.e. inside the dune build
  tree). **No `/tmp` paths.** Add a helper in
  `infrastructure/helpers.ml` — e.g. `pipeline_tmp_dir : string -> string`
  — that creates and returns the per-test directory and is honoured by all
  pipeline tests.
- [ ] Pipeline tests that compile C must use the OCaml-configured C compiler
  (`ocamlfind ocamlc -what` or `ocamlopt -config | grep ^c_compiler`) rather
  than a hard-coded `cc` / `gcc`. Wrap the lookup in an
  `infrastructure/c_compiler.ml` helper so call sites stay portable
  (FreeBSD/macOS do not necessarily ship `gcc`).

### Integration-test discipline

- [ ] The `integration/` dune stanza must declare an explicit dependency on
  `gir_gen.exe` (`(deps %{exe:../gir_gen/gir_gen.exe})`) so the binary is
  rebuilt before integration tests run. *(Note: already present in the
  current root `dune` — verify and document.)*
- [ ] Pipeline and unit dune stanzas must NOT depend on `gir_gen.exe`.

### Renames to realise the classification

- [ ] `overrides/overrides_integration_tests.ml` → `overrides/pipeline_tests.ml`
- [ ] `overrides/e2e_tests.ml` → fold into `overrides/apply_tests.ml` (single
  test that exercises `apply_overrides` against a parser-fed input rather than
  a synthetic record), OR rename to
  `overrides/apply_with_parsed_gir_tests.ml` if you prefer to keep it
  separate
- [ ] `cross_namespace/integration_tests.ml` → `cross_namespace/header_pipeline_tests.ml`
- [ ] Update dune modules list and `test_gir_gen.ml` runner references
- [ ] Drop the "e2e" label from `test_gir_gen/` entirely (the AT-SPI doc
  outside this tree retains "e2e" because it genuinely is application-level)

### Smoke-test directory scaffold

- [ ] Create `test_gir_gen/smoke/` with its own README that captures the
  "no `gir_gen` dependency" rule
- [ ] Move (or stage) any tests under `ocgtk/tests/` that only exercise
  generated bindings — candidates surfaced by the Phase 5 audit

---

## Phase 2 — Integration test AST migration

*Replaces banned string-matching assertions with AST-based validation per
`test-patterns.md`. Prerequisite: Phase 1 complete (files in final locations).*

### 2.1 Add missing `Ml_validation` helpers for `.mli` files

The existing `Ml_validation` helpers work against `.ml` structures. Integration
tests read `.mli` files and need signature-level variants.

Note: Class-type inheritance helpers (`assert_class_type_inherits`, etc.) were
already added to `ml_validation.ml` in the interface-support work on main. The
`.mli` signature helpers below are separate and still needed.

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

`tests/gtk/gtk_test_helpers.ml` defines `require_gtk` and `require_gtk_version`.
`test_button.ml` and `test_interface.ml` already use `Helpers.require_gtk` — done.
The remaining active files still define `gtk_available`/`require_gtk` inline:

Active files to fix (compiled, must change):
- `tests/gtk/test_box.ml`
- `tests/gtk/test_widget.ml`
- `tests/gtk/test_string_list.ml`
- `tests/gtk/test_range.ml`
- `tests/gtk/test_variance.ml`
- `tests/test_gobject_stress.ml` (in root `tests/`, uses own GMain inline)

Disabled files (not compiled — fix if reactivated, not blocking):
- `tests/test_grid.ml`, `test_window.ml`, `test_clipboard.ml`,
  `tests/test_gobject.ml`, `tests/test_containers.ml`, `tests/test_gpack.ml`

**Actions:**
- [ ] Remove the duplicate GTK init block from each of the 6 active files above
- [ ] Replace with `let require_gtk = Gtk_test_helpers.require_gtk` (in `gtk/`) or
  equivalent import
- [ ] Note: `test_gobject_stress.ml` is in `tests/` not `tests/gtk/`, so needs
  `ocgtk.gtk` dep added to its dune stanza if it imports `gtk_test_helpers`
- [ ] Verify no active test files still define their own `gtk_available`/`require_gtk`

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

**Update (2026-04-16):** Phase 5.1 categorisation is now largely reflected in the
dune comments already (done in main). The actions below address what remains.

### 5.1 Categorise each disabled test *(mostly done in dune comments)*

**Delete** — dune comments already say "DISABLED: Uses Conv module":
- `test_enum_roundtrip.ml`, `test_enum_values.ml`, `test_all_enums.ml`
- `test_ffi_integration.ml`, `test_glib.ml`, `test_gobject.ml`, `test_gdk.ml`
- `.ml` files and commented stanzas still exist on disk — removal pending (Phase 5.2)

**Rewrite** — dune comments already say "DISABLED: needs to be rewritten for new API":
- `test_gpack.ml` — GPack module
- `test_window.ml` — GWindow module
- No `#NNN` tracking issue references yet

**Re-enable when APIs land** — dune says "Some APIs missing / need to be generated":
- `test_event_controller.ml`, `test_event_controller_runtime.ml`
- `test_grid.ml`, `test_containers.ml`
- Comments do not yet name the specific blocking API

**Verify moved** — dune says "Tests moved to gtk/ subdirectory":
- `test_widget.ml`, `test_box.ml`, `test_button.ml`, `test_range.ml`
- Confirmed active in `tests/gtk/dune` — stale stanzas and `.ml` files can be deleted

**Unclear** — still have plain `;` comment with no explanation:
- `test_gdkpixbuf.ml`, `test_pango.ml`, `test_clipboard.ml`, `test_snapshot.ml`,
  `test_gobj.ml`
- Read each file and assign to Delete / Rewrite / Re-enable category

### 5.2 Clean up `ocgtk/tests/dune`

**Actions:**
- [ ] For each test in "Delete" category: remove `.ml` file and commented dune stanza
- [ ] For each test in "Rewrite" category: create a tracking issue; add explicit
  `(* TODO #NNN: rewrite for new API *)` comment in dune
- [ ] For each test in "Re-enable" category: update comment to name the specific
  blocking API (e.g. `(* Blocked: GtkGrid bindings not yet generated *)`)
- [ ] For each test in "Verify moved" category: delete stale stanza and `.ml` file
- [ ] For each test in "Unclear" category: read the file, assign category, apply above

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
    signal_wrapper_tests.ml         ← extracted from integration/signals
    interface_inheritance_tests.ml  ← was test_interface_inheritance.ml (new)
    interface_method_types_tests.ml ← was test_interface_method_types.ml (new)

  interface/                   ← Interface parsing & C stubs (new)
    parsing_tests.ml           ← was test_interface_parsing.ml (new)
    from_gobject_tests.ml      ← was test_from_gobject_gen.ml (new)

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

1. **Phase 1** (structural moves, including new Phase 1.8) — unblocks accurate naming everywhere else
2. **Phase 1.5** (test classification + pipeline-test discipline) — establishes the principle so subsequent phases don't reintroduce `/tmp` paths or hard-coded `cc`
3. **Phase 2.1** (add `Ml_validation` helpers) — unblocks Phase 2.2–2.8
4. **Phase 4.1–4.4** (deduplication helpers) — can run in parallel with Phase 2; the new `pipeline_tmp_dir` and `c_compiler` helpers from Phase 1.5 belong in this group
5. **Phase 2.2–2.8** (AST migration) — after helpers exist
6. **Phase 3** (factory consistency) — independent, can interleave with Phase 2
7. **Phase 2.8** (remove deprecated helpers) — last step of Phase 2
8. **Phase 5** (disabled tests audit) — fully independent, any time

Each phase should end with `cd ocgtk && dune build && xvfb-run dune runtest` passing.
