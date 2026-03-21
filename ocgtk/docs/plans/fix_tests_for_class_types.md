# Plan: Fix Tests for Class Type Separation

## Context

After separating Layer 2 into class type definitions and class implementations (two-pass generation), 26 tests fail because the test infrastructure and expectations haven't been updated.

## Failure Groups

### Group 1: Layer2 Method Wrappers (16 failures — tests 0-12, 14-16)

**Root cause A — `Pcl_constraint` not handled in AST helpers:**

The generator now emits `class button (obj : Button.t) : button_t = object ... end`, which wraps the class body in `Pcl_constraint(Pcl_structure(...), ...)`. Three functions in `ml_ast_helpers.ml` only handle `Pcl_structure`, `Pcl_fun`, and `Pcl_apply`:

- `find_method_in_class` (line 362)
- `get_class_inherit_clauses` (line 333)
- `find_all_methods_in_class` (within `find_methods_in_class_expr`, line 711)

**Fix**: Add `| Pcl_constraint (body, _) -> <recurse> body method_name` to each function.

**Root cause B — `.mli` class type lookup uses wrong AST node:**

`find_class_type_declaration` (line 323) searches `Psig_class` nodes for name `"button"`. The new `.mli` emits:
- `class type button_t = object ... end` → `Psig_class_type` node, name `"button_t"`
- `class button : button_t` → `Psig_class` node, name `"button"` (but no methods here)

Tests calling `validate_method_type_annotation_sig` with `~class_name:"button"` find the class declaration but it has no methods — the methods are on `button_t`.

**Fix**: Update `find_class_type_declaration` to also search `Psig_class_type` nodes. Then update test call sites to use `"button_t"` when looking for method signatures.

**Root cause C — Test 6 validates removed structural types:**

Test 6 (`test_same_cluster_structural_type`) asserts `assert_method_has_structural_type_param` and `assert_method_has_structural_field ... "as_widget"`. Structural types (`<as_widget: Widget.t; ..>`) were removed — the generator now uses plain class type names (e.g., `widget_t`).

The generator now produces methods like:
```ocaml
(* In class type: *)
method set_child : widget_t option -> unit
(* In class body: *)
method set_child : widget_t option -> unit =
  fun child ->
    let child = Option.map (fun (c) -> c#as_widget) child in
    (Button.set_child obj child)
```

**Fix — rewrite test 6 in detail:**

1. Rename test from `test_same_cluster_structural_type` to `test_same_cluster_class_type_reference` (or similar).
2. Update the doc comment to reflect the new behavior: "Test that same-cluster class references use class type names like `widget_t`".
3. Keep the existing test setup (context, hierarchy entries, Widget+Button classes, combined module generation).
4. After `Pcl_constraint` fix (Root cause A), `find_class` and `find_method` will work.
5. Replace the two structural type assertions (lines 518-519):
   ```ocaml
   (* OLD — remove: *)
   Ml_ast_helpers.assert_method_has_structural_type_param combined_ast "button" "set_child";
   Ml_ast_helpers.assert_method_has_structural_field combined_ast "button" "set_child" "as_widget"

   (* NEW — validate class type reference instead: *)
   validate_method_type combined_ast "button" "set_child" ~expected:"widget_t -> unit"
   ```
6. The `validate_method_type` helper is already defined in `method_wrapper_tests.ml` (line 58). It extracts the method type from the class implementation and compares the string representation.
7. Optionally add a body assertion that the method calls `#as_widget` for unwrapping (using `assert_method_body_calls` or a string check on the generated code).

### Group 2: Dependency Includes / Integration Tests (9 failures)

**Tests**: Dependency Includes 0, 1, 2, 4; Dependency Exclusion 3; Integration Tests 0, 1, 4, 5.

**Two distinct root causes:**

**Root cause A — `dependency_includes_tests.ml` uses wrong cross_references structure:**

`create_context_with_cross_references` (line 11) creates a SINGLE `namespace_cross_references` record named `"TestNamespace"` with dep entities keyed by namespace in `ncr_entities`. It stores this in the outer map as `StringMap.of_list [ ("TestNamespace", cross_references) ]` (line 63).

But `get_dependency_namespaces` in `c_stubs.ml` extracts keys from the OUTER `cross_references` StringMap. So it finds `["TestNamespace"]` instead of `["Gdk"; "Gio"]`. This produces `#include "generated/testnamespace_decls.h"` instead of `#include "generated/gdk_decls.h"`.

**Root cause B — Integration tests and dependency_exclusion test 3 expect wrong include path prefix:**

`integration_tests.ml` and `dependency_exclusion_tests.ml` test 3 (`test_non_base_namespaces_are_included`) use `make_ncr` correctly (per-namespace keys in outer map), but expect `"gdk_decls.h"` without `generated/` prefix. The generator emits `#include "generated/gdk_decls.h"`.

**Fix — use shared helper `Helpers.create_context_with_cross_refs`:**

1. Add a new helper to `infrastructure/helpers.ml`:
   ```ocaml
   let create_context_with_cross_refs ~namespace ~deps =
     let open Gir_gen_lib.Types in
     let dummy_cr = { cr_name = "TestClass"; cr_type = Crt_Class { parent = None }; cr_c_type = "TestClass" } in
     let dummy_map = StringMap.add "TestClass" dummy_cr StringMap.empty in
     let cross_refs =
       List.fold_left (fun acc dep_ns ->
         StringMap.add dep_ns (snd (make_ncr dep_ns dummy_map)) acc
       ) StringMap.empty deps
     in
     { namespace = { namespace_name = namespace; ... };
       ...
       cross_references = cross_refs }
   ```
   This creates per-namespace entries in the outer map (like `integration_tests.ml` and `dependency_exclusion_tests.ml` already do manually), so `get_dependency_namespaces` finds the correct keys.

2. Replace `dependency_includes_tests.ml`'s local `create_context_with_cross_references` with calls to the shared helper.

3. Replace `dependency_exclusion_tests.ml`'s local `create_context_with_base_namespace_refs` with calls to the shared helper (passing `~deps:["GLib"; "GObject"; "GModule"; "Gdk"]`).

4. Replace `integration_tests.ml`'s inline context construction with calls to the shared helper.

5. Update ALL expected include paths to use `"generated/<ns>_decls.h"` prefix to match what the generator actually emits. Affected assertions:
   - `dependency_exclusion_tests.ml` line 130: `"gdk_decls.h"` → `"generated/gdk_decls.h"`
   - `integration_tests.ml` lines 71, 122, 123, 263, 316, 317: all `"<ns>_decls.h"` → `"generated/<ns>_decls.h"`
   - Also update negative assertions (lines 85, 100, 115, 215) to `"generated/glib_decls.h"` etc.
   - `dependency_includes_tests.ml` already uses `"generated/"` prefix — no changes needed there once the context is fixed.

6. Update `integration_tests.ml` test 2 (`test_header_no_dependencies_no_includes`) — it checks `List.length local_includes = 0` but the header now always includes its own `generated/<ns>_decls.h`. Either filter out self-includes or adjust the expected count.

### Group 3: Cross-Namespace Test 18 (1 failure)

**Root cause**: Test creates a ctx with `cross_references = StringMap.empty` and `enums = []`. The `Colorspace` enum parameter isn't registered anywhere, so `generate_c_method` treats it as an unknown type and passes `arg1` directly — no `GdkPixbufColorspace_val` converter is generated at all.

This is a test setup bug, not a capitalization issue. The test needs to register `Colorspace` as either:
- A same-namespace enum in `ctx.enums`, OR
- A cross-namespace enum in `ctx.cross_references`

**Fix**: Add `Colorspace` to `ctx.enums`:
```ocaml
enums = [{ enum_name = "Colorspace"; c_type = "GdkColorspace"; members = []; enum_doc = None }];
```
Then the generator will find it and produce the converter call. Verify the generated converter name matches `GdkPixbufColorspace_val` (from `<c_identifier_prefixes><EnumName>_val`).

## Execution Order

1. **`infrastructure/helpers.ml`** — Add shared `create_context_with_cross_refs` helper
2. **`infrastructure/ml_ast_helpers.ml`** — Add `Pcl_constraint` handling to `find_method_in_class`, `get_class_inherit_clauses`, `find_all_methods_in_class` (3 one-line additions)
3. **`infrastructure/ml_ast_helpers.ml`** — Update `find_class_type_declaration` to also search `Psig_class_type` nodes
4. **`method_wrapper_tests.ml`** — Update `.mli` lookups to use `"button_t"` class type names
5. **`method_wrapper_tests.ml`** — Rewrite test 6 for class type refs instead of structural types
6. **`dependency_includes_tests.ml`** — Replace local helper with shared `create_context_with_cross_refs`
7. **`dependency_exclusion_tests.ml`** — Replace local helper with shared helper; fix include path prefix
8. **`integration_tests.ml`** — Replace inline context with shared helper; fix include path prefix
9. **`cross_namespace_tests.ml`** — Fix test 18 by adding Colorspace to ctx.enums
10. Build and run full test suite, verify all 26 failures resolved and no regressions
