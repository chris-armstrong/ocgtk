# Interface Support Implementation Plan

## Code Guidelines

All code written in this plan must follow the project code guidelines:
- **OCaml style**: [`ocgtk/docs/code_guidelines/index.md`](../code_guidelines/index.md)
- **Test patterns**: [`ocgtk/docs/code_guidelines/test-patterns.md`](../code_guidelines/test-patterns.md)
  — Use C AST validation (`C_parser`/`C_validation`) for C output; use ML AST validation
  (`Ml_validation`) for OCaml output. Never use string search for structural assertions.
- **FFI**: [`ocgtk/architecture/FFI_GUIDELINES.md`](../../architecture/FFI_GUIDELINES.md)

---

## Overview

This plan adds GObject interface inheritance to ocgtk's code generator so that implementing
classes (e.g. `Entry`) inherit their interfaces' Layer 2 class types (e.g. `editable_t`), and
a `from_gobject` conversion function allows runtime conversion of any GObject to an interface
type.

### Current State (what already works)

The generator **already** produces standalone bindings for interfaces at all three layers:

- **C stubs**: `ml_editable_gen.c` — all method wrappers and property getters/setters
- **Layer 1**: `editable.ml`/`.mli` — `type t = [`editable] Gobject.obj` with external declarations for all 20+ methods and 4 properties
- **Layer 2**: `gEditable.ml`/`.mli` — `class type editable_t` with method/property wrappers delegating to Layer 1, plus `class editable` implementing it
- **Forward declarations**: `Val_GtkEditable`/`GtkEditable_val` macros in `generated_forward_decls.h`

The parser (`gir_parser.ml`) already parses interface methods (including `<virtual-method>` elements,
merged via `merge_methods`), properties, and signals. Interfaces flow through the same unified
`entity` pipeline as classes.

### What's missing

1. **`from_gobject` function** — A C function + Layer 1 external that converts any `GObject` to an interface type with a runtime type check, raising an exception on failure.
2. **Interface inheritance at Layer 2** — Implementing classes (e.g. `Entry`) do not `inherit editable_t` or include interface methods/properties.
3. **Missing type metadata** — `gir_interface` lacks `glib_type_name`, `glib_get_type`, `prerequisites`, and `introspectable` fields (needed to wire up the conversion).

### What the EditableInterface record is

The GIR defines `<record name="EditableInterface" glib:is-gtype-struct-for="Editable">` — this is the C
struct containing virtual method pointers (vtable). The generator currently produces `editable_interface.ml`/`.mli`
for this record, which is essentially empty. This is a GTypeStruct, not the interface itself.
**It should continue to be generated as-is.**

---

## Reference Interface for Testing

**Primary Test Interface: `GtkEditable`**
- **GIR Location**: `/usr/share/gir-1.0/Gtk-4.0.gir`
- **glib:type-name**: `GtkEditable`
- **glib:get-type**: `gtk_editable_get_type`
- **c:type**: `GtkEditable`
- **c:symbol-prefix**: `editable`
- **Prerequisite**: `Widget`
- **Regular methods**: 20+ (get_text, set_text, insert_text, delete_text, etc.)
- **Properties**: 8 (text, cursor-position, selection-bound, editable, width-chars, max-width-chars, enable-undo, xalign)
- **Implementing classes**: Entry, Text, SpinButton, SearchEntry, PasswordEntry, EditableLabel

**Entry class implements**: Accessible, Buildable, CellEditable, ConstraintTarget, Editable (NOT Actionable)

---

## Implementation Phases

### Phase 1: Type System and Parser Extensions — DONE ✅

**Goal**: Add missing metadata to `gir_interface` and parse it from GIR.

**Completed tasks**:
- [x] Extended `gir_interface` in `types.ml` with: `glib_type_name`, `glib_get_type`, `prerequisites`, `introspectable`
- [x] Updated `parse_interface` in `gir_parser.ml` to extract all four fields
- [x] Fixed `c_symbol_prefix` bug (was hardcoded to `name`, now reads `c:symbol-prefix` attribute)
- [x] Added `<implements>` parsing in `parse_class` (was hardcoded to `[]`)
- [x] Updated `make_gir_interface` in `util/type_factory.ml` with 4 new optional fields

**Tests**: `test_gir_gen/test_interface_parsing.ml` — 11 tests (6 against real Gtk-4.0.gir, 5 synthetic).

---

### Phase 2: C Layer — `from_gobject` Function — DONE ✅

**Goal**: Generate a C function for each interface that converts a GObject to the interface type,
raising an OCaml exception on failure.

**Completed tasks**:
- [x] Added `generate_from_gobject_stub` in `gir_gen.ml` — raises `Failure` if `glib_type_name` is None
- [x] Added `gtype_macro_of_type_name` and `cast_macro_of_type_name` in `utils.ml`
  (e.g. `GtkEditable` → `GTK_TYPE_EDITABLE`, `GtkEditable` → `GTK_EDITABLE`)
- [x] Wired `generate_from_gobject_stub` into `generate_c_stub`: called inside `body_buf` so it
  is wrapped by the entity-level `#if GTK_CHECK_VERSION` guard when the interface has a version

**PR review fixes applied**:
- `generate_from_gobject_stub` raises `Failure` rather than returning `""` for None `glib_type_name`
- Call site guards with `Option.is_some intf.glib_type_name` before calling the function
- Tests use C AST (`C_parser`/`C_validation`) rather than string search for structural assertions
- `test_interface_parsing.ml` uses `Helpers.wrap_namespace` / `Helpers.create_gir_file` instead of
  duplicating file utilities

**Tests**: `test_gir_gen/test_from_gobject_gen.ml` — 12 tests:
- 8 unit tests for `gtype_macro_of_type_name` / `cast_macro_of_type_name`
- 1 real-GIR test (round-trips GtkEditable's `glib_type_name` through the utility)
- 3 integration tests (run `gir_gen.exe`, validate with C AST):
  - `from_gobject` present and structurally correct when `glib:type-name` is set
  - `from_gobject` absent when `glib:type-name` is absent
  - versioned interface: function present inside `GTK_CHECK_VERSION` guard

**Generated C Pattern**:
```c
CAMLexport CAMLprim value ml_gtk_editable_from_gobject(value obj)
{
    CAMLparam1(obj);
    GObject *gobj = GObject_val(obj);
    if (!g_type_is_a(G_OBJECT_TYPE(gobj), GTK_TYPE_EDITABLE)) {
        char msg[256];
        snprintf(msg, sizeof(msg),
            "from_gobject: object of type '%%s' does not implement %%s",
            G_OBJECT_TYPE_NAME(gobj), "GtkEditable");
        caml_failwith(msg);
    }
    CAMLreturn(Val_GtkEditable(gobj));
}
```

---

### Phase 3: Layer 1 — `from_gobject` External Declaration — DONE ✅

**Goal**: Add a `from_gobject` external declaration to each interface's Layer 1 `.ml` and `.mli`.

**Tasks**:
- [x] Extend Layer 1 generation in `layer1_main.ml` to emit, for each interface that has a `glib_type_name`:
  ```ocaml
  external from_gobject : 'a Gobject.obj -> t = "ml_gtk_editable_from_gobject"
  ```
- [x] Emit the external in both `.ml` and `.mli` files
- [x] The C name is `ml_<namespace_snake>_<iface_snake>_from_gobject`
- [x] Only emit when `glib_type_name` is `Some` (guard same as Phase 2 C stub)
- [x] `generate_combined_ml_modules` parameter changed to `?from_gobject_c_name_for_entity:(entity -> string option)` so each entity in a cyclic group is handled independently (C1/C2 fix)

**Generated OCaml Pattern** (addition to existing `editable.mli`):
```ocaml
type t = [`editable] Gobject.obj

(* NEW — converts any GObject to this interface, raises Failure on type mismatch *)
external from_gobject : 'a Gobject.obj -> t = "ml_gtk_editable_from_gobject"

external get_text : t -> string = "ml_gtk_editable_get_text"
(* ... existing methods unchanged ... *)
```

**Tests** — Integration tests in `test_gir_gen/test_from_gobject_gen.ml` (extend existing suite):

These tests run `gir_gen.exe` on a synthetic GIR, read the generated `.ml`/`.mli` files, and
validate their structure using `Ml_validation` (AST-based), not string search.

```ocaml
(* Synthetic GIR: interface with glib:type-name — from_gobject must appear in .mli *)
let test_from_gobject_external_in_mli () =
  let content, mli_ast = run_and_parse_mli gir_with_type_name "my_iface" in
  ignore content;
  (* Use Ml_validation to check external exists with the right C name *)
  Ml_validation.assert_external_exists mli_ast
    ~name:"from_gobject"
    ~c_name:"ml_gtk_my_iface_from_gobject"

(* Synthetic GIR: interface with glib:type-name — from_gobject must appear in .ml *)
let test_from_gobject_external_in_ml () =
  let content, ml_ast = run_and_parse_ml gir_with_type_name "my_iface" in
  ignore content;
  Ml_validation.assert_external_exists ml_ast
    ~name:"from_gobject"
    ~c_name:"ml_gtk_my_iface_from_gobject"

(* Interface without glib:type-name must NOT have from_gobject in .mli *)
let test_no_from_gobject_when_no_type_name () =
  let content, mli_ast = run_and_parse_mli gir_without_type_name "my_iface" in
  ignore content;
  Ml_validation.assert_external_absent mli_ast ~name:"from_gobject"

(* Real GIR: GtkEditable .mli has from_gobject external pointing to the C function *)
let test_editable_mli_has_from_gobject () =
  let content, mli_ast = run_gir_on_real_gir_and_parse_mli real_gir_file "editable" in
  ignore content;
  Ml_validation.assert_external_exists mli_ast
    ~name:"from_gobject"
    ~c_name:"ml_gtk_editable_from_gobject"
```

**Note**: These tests exercise all three layers together (C stub + Layer 1 .ml/.mli + dune build),
making them true integration tests. `run_and_parse_mli` follows the same pattern as `run_and_parse_c`
in the existing test file: write GIR to temp, run `gir_gen.exe`, read and parse the output.

**Test gate**: New tests pass, existing tests continue to pass, `dune build` succeeds.

---

### Phase 4: Layer 2 — Interface Inheritance on Implementing Classes — DONE ✅

**Goal**: Make implementing classes inherit the interface's Layer 2 class type and include all
interface methods/properties via `inherit`.

When `Entry` implements `Editable`, the generated `gEntry.ml` must:
1. Inherit `GEditable.editable_t` in the class type
2. Inherit `GEditable.editable (Editable.from_gobject obj)` in the class implementation

**Tasks**:
- [x] In `class_gen_body.ml`, **after parent class inheritance but before signal inheritance**, emit interface `inherit` clauses by iterating `cls.implements` from `ctx.classes`
- [x] Interface method conflict detection: `collect_inherited_method_names` suppresses interface methods so implementing classes don't redeclare them
- [x] Cross-namespace interfaces resolved via `Type_mappings.find_type_mapping_for_gir_type`
- [x] Same-cycle guard: skip `inherit` when interface is in `same_cluster_classes` (OCaml `module rec` limitation)
- [x] Diamond-inheritance guard: `parent_chain_provides_interface` prevents double-inherit when ancestor already provides interface (avoids warning 7 as error)

**Generated OCaml Pattern** — `gEntry.ml` (changes shown):
```ocaml
class type entry_t = object
    inherit GWidget.widget_t
    inherit GEditable.editable_t  (* NEW *)
    inherit Gentry_signals.entry_signals
    (* Entry-specific methods ... *)
    method as_entry : Entry.t
end

class entry (obj : Entry.t) : entry_t = object (self)
  inherit GWidget.widget (obj :> Widget.t)
  inherit GEditable.editable (Editable.from_gobject obj)  (* NEW *)
  inherit Gentry_signals.entry_signals obj
  (* Entry-specific methods ... *)
end
```

**Tests** — Integration tests in a new file `test_gir_gen/test_interface_inheritance.ml`:

These tests run `gir_gen.exe` on a synthetic GIR that includes both an interface and a class that
implements it, then validate the generated Layer 2 `.ml`/`.mli` using `Ml_validation`. This exercises
the full pipeline: GIR parse → override apply → C stub → Layer 1 → Layer 2.

```ocaml
(* ------------------------------------------------------------------ *)
(* Synthetic GIR: class with implements = [MyIface]                   *)
(* ------------------------------------------------------------------ *)
let gir_class_implements_iface =
  Helpers.wrap_namespace ~version:"4.0"
    {|<interface name="MyIface"
                 c:type="GtkMyIface"
                 glib:type-name="GtkMyIface"
                 glib:get-type="gtk_my_iface_get_type">
        <method name="do_thing" c:identifier="gtk_my_iface_do_thing"
                introspectable="1">
          <return-value transfer-ownership="none">
            <type name="none" c:type="void"/>
          </return-value>
        </method>
      </interface>
      <class name="MyClass"
             c:type="GtkMyClass"
             glib:type-name="GtkMyClass"
             glib:get-type="gtk_my_class_get_type"
             parent="GObject.Object">
        <implements name="MyIface"/>
        <constructor name="new" c:identifier="gtk_my_class_new"
                     introspectable="1">
          <return-value transfer-ownership="none">
            <type name="MyClass" c:type="GtkMyClass*"/>
          </return-value>
        </constructor>
      </class>|}

(* Test: class type definition inherits the interface class type *)
let test_class_type_inherits_interface_type () =
  let _content, ml_ast = run_and_parse_layer2_ml gir_class_implements_iface "my_class" in
  Ml_validation.assert_class_type_inherits ml_ast
    ~class_type:"my_class_t" ~parent:"GMyIface.my_iface_t"

(* Test: class implementation inherits interface class with from_gobject call *)
let test_class_impl_inherits_interface_class () =
  let _content, ml_ast = run_and_parse_layer2_ml gir_class_implements_iface "my_class" in
  Ml_validation.assert_class_inherits ml_ast
    ~class_name:"my_class"
    ~parent:"GMyIface.my_iface"

(* Test: class without implements has no interface inheritance *)
let gir_class_no_implements =
  Helpers.wrap_namespace ~version:"4.0"
    {|<class name="MyClass"
             c:type="GtkMyClass"
             glib:type-name="GtkMyClass"
             glib:get-type="gtk_my_class_get_type"
             parent="GObject.Object">
        <constructor name="new" c:identifier="gtk_my_class_new"
                     introspectable="1">
          <return-value transfer-ownership="none">
            <type name="MyClass" c:type="GtkMyClass*"/>
          </return-value>
        </constructor>
      </class>|}

let test_class_without_implements_has_no_iface_inherit () =
  let _content, ml_ast = run_and_parse_layer2_ml gir_class_no_implements "my_class" in
  Ml_validation.assert_class_type_does_not_inherit ml_ast
    ~class_type:"my_class_t" ~parent_prefix:"GMyIface"

(* Test: interface method that conflicts with class's own method is suppressed *)
let gir_method_conflict =
  Helpers.wrap_namespace ~version:"4.0"
    {|<interface name="MyIface"
                 c:type="GtkMyIface"
                 glib:type-name="GtkMyIface"
                 glib:get-type="gtk_my_iface_get_type">
        <method name="do_thing" c:identifier="gtk_my_iface_do_thing"
                introspectable="1">
          <return-value transfer-ownership="none">
            <type name="none" c:type="void"/>
          </return-value>
        </method>
      </interface>
      <class name="MyClass"
             c:type="GtkMyClass"
             glib:type-name="GtkMyClass"
             glib:get-type="gtk_my_class_get_type"
             parent="GObject.Object">
        <implements name="MyIface"/>
        <constructor name="new" c:identifier="gtk_my_class_new"
                     introspectable="1">
          <return-value transfer-ownership="none">
            <type name="MyClass" c:type="GtkMyClass*"/>
          </return-value>
        </constructor>
        <method name="do_thing" c:identifier="gtk_my_class_do_thing"
                introspectable="1">
          <return-value transfer-ownership="none">
            <type name="none" c:type="void"/>
          </return-value>
        </method>
      </class>|}

let test_method_conflict_resolved () =
  (* MyClass.do_thing wins over MyIface.do_thing — only one definition in the class *)
  let _content, ml_ast = run_and_parse_layer2_ml gir_method_conflict "my_class" in
  Ml_validation.assert_method_count ml_ast
    ~class_name:"my_class" ~method_name:"do_thing" ~expected:1
```

**Note**: These tests validate the full pipeline end-to-end — C stubs, Layer 1, and Layer 2 — with
a single `gir_gen.exe` invocation. This confirms that all three layers interact correctly, not just
that individual generators produce correct output in isolation.

**Test gate**: New tests pass, existing tests continue to pass, `dune build` succeeds,
regenerated bindings compile.

---

### Opus Code Review — Phases 3 & 4

**Date**: 2026-04-09  
**Reviewer**: Claude Opus 4.6  
**Verdict**: 3 critical, 8 significant, 11 minor issues. C1 and C2 must be fixed before Phase 5.

#### Critical Issues

**C1 / C2: `generate_combined_ml_files` missing `from_gobject_c_name` for cyclic modules + design flaw**

- `generate_combined_ml_files` in `gir_gen.ml` never passes `?from_gobject_c_name` when calling `generate_combined_ml_modules` for cyclic dependency groups. Interfaces in cyclic modules will not get `from_gobject` externals, breaking Phase 4's `inherit` which calls `MyIface.from_gobject obj`.
- The root cause is a design flaw: `?from_gobject_c_name:string` is a single value applied to ALL entities in a cycle. If a cycle contains a class and an interface, the class would also incorrectly receive a `from_gobject` external.
- **Fix required**: Change the parameter to `?from_gobject_c_name_for_entity:(entity -> string option)` (or derive it internally from entity kind) so each entity in the cycle is handled independently.

**C3: Missing C cast in `generate_from_gobject_stub`**

- `gobj` is `GObject *` but is passed directly to `Val_GtkMyIface(gobj)` which expects `GtkMyIface *`. Relies implicitly on pointer equality of GObject subtype pointers.
- **Fix**: Add an explicit cast: `Val_GtkMyIface((GtkMyIface*)gobj)` — makes intent clear and eliminates potential compiler warnings.

#### Significant Issues

- **S1/S2**: Polymorphic equality (`=`, `<>`) used in `class_gen_conflict_detection.ml` and `class_gen_body.ml` — violates STYLE_GUIDELINES. Replace with `String.equal`.
- **S3**: `collect_inherited_method_names` looks up `iface_name` in `ctx.interfaces` but cross-namespace names (e.g. `"Gio.Initable"`) are never in same-namespace `ctx.interfaces` — cross-namespace interface methods won't be suppressed, risking duplicate method errors in generated OCaml.
- **S4**: `_ -> ()` catch-all in `class_gen_body.ml` silently swallows genuine type-mapping lookup failures. Should use explicit patterns for `Some { layer2_class = None; _ }` vs `None`.
- **S5**: `test_from_gobject_inside_version_guard` uses `Helpers.string_contains` for preprocessor check — test-patterns.md bans string matching for structural assertions (even for preprocessor content). Needs explicit guideline exception or structural fix.
- **S6**: Interface inheritance logic duplicated verbatim between `generate_class_module_body` and `generate_class_signature_body`. Extract shared helper `resolve_interface_inherits ~ctx ~class_name`.
- **S7**: Suffix stripping (`String.sub ... = "_t"`) is fragile index arithmetic. Use `String.ends_with` / `String.chop_suffix_if_exists`.
- **S8**: No test for `from_gobject` absence in `.ml` (only `.mli`) when `glib_type_name` is absent.

#### Minor Issues

- **M1**: `[@@@warning "-32"]` suppresses unused-value warnings globally in `class_gen_body.ml` — should be scoped to specific bindings.
- **M2**: `longident_to_string_phase4` encodes phase number in function name — rename by behaviour.
- **M3**: Four near-identical `run_and_parse_*` helpers across test files — extract shared `with_gir_gen_run`.
- **M4**: Polymorphic equality in `ml_validation.ml` — use `String.equal`.
- **M5**: `generate_constructors_section` takes `list option` but empty list is equivalent to `None` — remove the wrapping.
- **M6**: `find_class_type_declaration_sig2` has unexplained `2` suffix.
- **M7**: `generate_from_gobject_stub` uses `failwith` as dead-code safety net — prefer making `glib_type_name:string` a required parameter to enforce the invariant via the type system.
- **M8**: No test for class implementing multiple interfaces simultaneously.
- **M9**: No test for class implementing an interface with no `glib_type_name` (should silently skip at Layer 2).
- **M10**: Synthetic `gir_type` records constructed inline twice in `class_gen_body.ml` — signals `find_type_mapping_for_gir_type` needs a simpler `by_name` entry point.

---

### Phase 5: Integration — Generate and Compile All Bindings

**Goal**: Regenerate all bindings and verify everything compiles.

**Fixes applied during Phase 5 integration** (discovered during first `dune build` after regen):

1. **C1/C2 fix**: `generate_combined_ml_modules` parameter changed from `?from_gobject_c_name:string` to `?from_gobject_c_name_for_entity:(entity -> string option)`. `gir_gen.ml` computes the function per-entity for cyclic groups. Fixes missing `from_gobject` in cyclic interface modules (e.g. `DInterface`/`DObject` in Gio).

2. **GType macro bug** (`GD_TYPE_BUS_INTERFACE` → `G_TYPE_DBUS_INTERFACE`): `gtype_macro_of_type_name` mishandled acronym-style names like `GDBusInterface` via `to_snake_case`. Fixed by adding `gtype_macro_from_get_type` which derives the macro from `glib_get_type` (already snake_case), avoiding the camel-case splitter entirely.

3. **Same-cycle interface inheritance** (`socket_connectable_t not yet completely defined`): When a class and the interface it implements are in the same cyclic `module rec` group, OCaml cannot reference the not-yet-defined class type. Fixed by checking `same_cluster_classes` before emitting `inherit`.

4. **Diamond interface inheritance** (warning 7 as error, `can_seek`/`can_truncate` overridden): When a class implements `Seekable` AND one of its ancestors also implements `Seekable`, the generated `inherit GSeekable.seekable` lines conflict. Fixed by adding `parent_chain_provides_interface ~ctx ~class_name iface_name` check in `class_gen_conflict_detection.ml`; if any ancestor already provides the interface, the child skips the redundant `inherit`.

5. **S1/S2 polymorphic equality**: Replaced bare `=` with `String.equal` throughout `class_gen_conflict_detection.ml` and `class_gen_body.ml`.

6. **S4 catch-all pattern**: Split `| _ -> ()` into explicit `| Some { layer2_class = None; _ } -> ()` and `| None -> ()` in both body and signature.

7. **C3 cast**: Added explicit `(GtkMyIface*)gobj` cast in `generate_from_gobject_stub`.

**Known limitation — cross-namespace parent chain**: `parent_chain_provides_interface` and
`collect_inherited_method_names` only traverse same-namespace parent chains (via `ctx.classes`).
A cross-namespace parent (e.g. `GtkApplication` → `GApplication` in Gio) is invisible, so
diamond interface inheritance through a cross-namespace ancestor is not detected. For now this
is safe because the Gtk library dune config suppresses warning 7 (`-w -7`). A proper fix would
add `implements : string list` to `Crt_Class` in the references file and resolve cross-namespace
ancestors through `ctx.cross_references` in the conflict-detection helpers.

**Tasks**:
- [x] Run `bash scripts/generate-bindings.sh` to regenerate all 9 namespace bindings
- [x] Run `cd ocgtk && dune build` — clean, only deprecation warnings from GDesktopAppInfoLookup
- [x] Spot-check generated files:
  - `gEntry.ml` inherits `GEditable.editable_t` and `GCellEditable.cell_editable_t` ✓
  - `gButton.ml` does NOT inherit `GEditable.editable_t` ✓
  - `gSpinButton.ml` inherits `GEditable.editable_t` (confirmed via grep)
  - `gEntry.ml` does NOT inherit `GActionable` ✓
- [x] All 424 gir_gen tests + GTK runtime tests pass

**Test gate**: ✅ Full `dune build` succeeds. All 424 tests pass locally.

**CI status** ✅ RESOLVED: regenerated bindings committed and all tests pass clean.

---

### Phase 6: Cross-Namespace Interface Awareness in References File — DONE ✅

**Goal**: Extend the references file so that cross-namespace parent chains are visible to
`parent_chain_provides_interface` and `collect_inherited_method_names`. Currently these helpers
only traverse same-namespace parents (via `ctx.classes`), so diamond interface inheritance
through a cross-namespace ancestor is not detected and cross-namespace interface methods are not
suppressed. This is safe today only because warning 7 is disabled in generated library dune configs.

**Root cause**: `Crt_Class` in the cross-reference type stores `parent : string option` but not
`implements : string list`. The consuming namespace therefore cannot know which interfaces a
cross-namespace parent provides.

**Example**: `GtkApplication` (Gtk) → parent `GApplication` (Gio) implements `ActionGroup`,
`ActionMap`. If `GtkApplication` also lists `ActionGroup` in its own `implements`, our
diamond-detection misses it because `GApplication` is not in `ctx.classes`.

**Tasks**:

- [ ] **`types.ml`**: Add `implements : string list` to `Crt_Class`:
  ```ocaml
  type entity_cross_reference_type =
    | Crt_Class of { parent : string option; implements : string list }
    | ...
  ```
  Update `sexp_of_entity_cross_reference_type` and `entity_cross_reference_type_of_sexp` accordingly.

- [ ] **`generate_references` in `gir_gen.ml`**: Populate the new field:
  ```ocaml
  cr_type = Crt_Class { parent = cls.parent; implements = cls.implements }
  ```

- [ ] **`class_gen_conflict_detection.ml` — `parent_chain_provides_interface`**: When `build_parent_chain`
  encounters a cross-namespace ancestor (not in `ctx.classes`), resolve it via `ctx.cross_references`
  and check its `implements` list from the `Crt_Class` record.

- [ ] **`class_gen_conflict_detection.ml` — `collect_inherited_method_names`**: For a
  cross-namespace `iface_name` (containing `.`), split on `.`, look up the namespace in
  `ctx.cross_references`, find the interface entity, and include its methods in the suppression set.

- [ ] Regenerate all references files (`scripts/generate-bindings.sh` runs the `references`
  subcommand first), then regenerate bindings and verify `dune build` still passes.

**Test gate**: `dune build` succeeds. Generated code produces no redundant cross-namespace
interface inherits for known cases (e.g. `GtkApplication` should NOT double-inherit
`ActionGroup`/`ActionMap` that `GApplication` already provides).

---

### Phase 7: Unfilter Methods with Interface-Typed Parameters and Return Values

**Status**: DONE ✅

**Goal**: Allow the generator to emit bindings for methods whose parameters or return values are
interface types. Currently these are silently dropped at Layer 2 by `method_has_interface_param`
in `class_gen_helpers.ml` and by a similar guard in `should_generate_property` in `filtering.ml`.
Now that interfaces have full type mappings and forward declarations, this filtering is no longer
necessary.

**Background**: The forward-declaration macros (`Val_GtkScrollable`, `GtkScrollable_val`, etc.)
are already emitted for every interface — identically to class types. The C layer, Layer 1
externals, and Layer 2 wrapping patterns are therefore already supported; they just need to be
wired up. The `get_delegate` method on `GtkEditable` (returns `GtkEditable*`) is a live example
demonstrating that interface return types at all three layers already work when the method is on
the interface itself. The only work here is enabling this for methods on other types.

**What is currently filtered and why**:

1. **`class_gen_helpers.ml:should_skip_method`** — calls `Filtering.method_has_interface_param`
   and skips the whole method if any parameter is an interface type. This was added before
   interfaces had type mappings. Now safe to remove.
2. **`filtering.ml:should_generate_property`** — skips properties whose type is an interface.
   Same reason. Now safe to remove or narrow.
3. **`filtering.ml:list_has_interface_element` / `method_has_unsupported_arrays`** — filters
   `GList`/`GSList` containing interface elements. This one remains correct: list element
   types require specialised marshalling that isn't generated yet. Leave this filter in place.

**Layer 0 (C) — no changes needed**

Interface types are already handled identically to class types:
```c
/* Return type: use Val_GtkScrollable (already in generated_forward_decls.h) */
GtkScrollable* result = gtk_foo_get_scrollable(GtkFoo_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GtkScrollable));

/* Parameter type: use GtkScrollable_val (already in generated_forward_decls.h) */
gtk_foo_set_scrollable(GtkFoo_val(self), GtkScrollable_val(arg1));
```

No changes to C stub generation are required.

**Layer 1 (OCaml externals) — no changes needed**

Interface types already have valid type mappings via `find_interface_mapping` in `type_mappings.ml`
(line 520). `should_skip_method_binding` in `filtering.ml` already passes methods with interface
types through (they are not excluded by `has_unknown_type`). Layer 1 externals for these methods
are therefore already being generated correctly:
```ocaml
external get_scrollable : t -> Scrollable.t option = "ml_gtk_foo_get_scrollable"
external set_scrollable : t -> Scrollable.t -> unit  = "ml_gtk_foo_set_scrollable"
```

**Layer 2 (OCaml class wrapper) — the work**

Two patterns are needed in `class_gen_method.ml`:

*Interface return type* — wrap the `Interface.t` from Layer 1 with the interface's Layer 2
class constructor (same pattern as `get_delegate` in `gEditable.ml:64`):
```ocaml
method get_scrollable : unit -> GScrollable.scrollable_t option =
  fun () ->
    Option.map (fun ret -> new GScrollable.scrollable ret) (Foo.get_scrollable obj)
```

*Interface parameter type* — use the `#as_interface` open-type accessor that every interface
class type already exposes (e.g. `as_editable` in `gEditable.ml:31`):
```ocaml
method set_scrollable : #GScrollable.scrollable_t -> unit =
  fun arg1 ->
    Foo.set_scrollable obj arg1#as_scrollable
```

The `#GScrollable.scrollable_t` accepts any class that satisfies the interface (e.g. an `entry_t`
which inherits `scrollable_t`). `arg1#as_scrollable` is the generated accessor that returns the
underlying `Scrollable.t`.

**Tasks**:

- [ ] **`class_gen_helpers.ml`**: Remove `has_interface_param` from `should_skip_method` (line 68–74).
  Delete the call to `Filtering.method_has_interface_param` entirely. Keep other skip conditions.
- [ ] **`filtering.ml`**: In `should_generate_property`, remove the `is_interface_type` guard (lines
  23–42). Interface properties are now supported.
- [ ] **`class_gen_method.ml`**: In the Layer 2 method return-value wrapper, detect when the return
  type maps to an interface (via `Type_mappings.find_interface_mapping`) and emit
  `Option.map (fun ret -> new GInterface.iface_class ret)` / `new GInterface.iface_class ret`
  wrapping, mirroring the existing class-return wrapping logic.
- [ ] **`class_gen_method.ml`**: In the Layer 2 method parameter generator, detect when a parameter
  type maps to an interface and emit `arg#as_<interface_snake_name>` instead of a direct coercion.
  Use `Type_mappings.find_interface_mapping` to resolve the interface module + accessor name.
- [ ] Regenerate all bindings with `bash scripts/generate-bindings.sh`.
- [ ] Build with `cd ocgtk && dune build` — fix any compilation errors.
- [ ] Run `xvfb-run dune runtest` — all tests must pass.

**Tests**

File: `ocgtk/src/tools/test_gir_gen/test_interface_method_types.ml`

Use synthetic GIR with a class `Foo` that has methods returning and accepting interface types.
Validate generated output with `Ml_validation` (AST) and `C_validation` (AST) — no string search.

```ocaml
(* Synthetic GIR: class Foo with a method returning interface MyIface *)
let gir_class_with_iface_return = Helpers.wrap_namespace ~version:"4.0"
  {|<interface name="MyIface"
               c:type="GtkMyIface"
               glib:type-name="GtkMyIface"
               glib:get-type="gtk_my_iface_get_type">
      <method name="do_thing" c:identifier="gtk_my_iface_do_thing"
              introspectable="1">
        <return-value transfer-ownership="none">
          <type name="none" c:type="void"/>
        </return-value>
      </method>
    </interface>
    <class name="Foo"
           c:type="GtkFoo"
           glib:type-name="GtkFoo"
           glib:get-type="gtk_foo_get_type"
           parent="GObject.Object">
      <method name="get_iface" c:identifier="gtk_foo_get_iface"
              introspectable="1">
        <return-value transfer-ownership="none" nullable="1">
          <type name="MyIface" c:type="GtkMyIface*"/>
        </return-value>
      </method>
      <method name="set_iface" c:identifier="gtk_foo_set_iface"
              introspectable="1">
        <return-value transfer-ownership="none">
          <type name="none" c:type="void"/>
        </return-value>
        <parameters>
          <parameter name="iface" transfer-ownership="none">
            <type name="MyIface" c:type="GtkMyIface*"/>
          </parameter>
        </parameters>
      </method>
    </class>|}

(* Layer 1: external for method returning interface type is generated *)
let test_layer1_interface_return_type () =
  let _content, ml_ast = run_and_parse_layer1_ml gir_class_with_iface_return "foo" in
  Ml_validation.assert_external_exists ml_ast
    ~name:"get_iface"
    ~return_type:"MyIface.t option"

(* Layer 1: external for method taking interface parameter is generated *)
let test_layer1_interface_param_type () =
  let _content, ml_ast = run_and_parse_layer1_ml gir_class_with_iface_return "foo" in
  Ml_validation.assert_external_exists ml_ast
    ~name:"set_iface"
    ~param_types:["t"; "MyIface.t"]

(* Layer 2: method returning interface is wrapped with interface class constructor *)
let test_layer2_interface_return_wrapped () =
  let _content, ml_ast = run_and_parse_layer2_ml gir_class_with_iface_return "foo" in
  (* Method exists in class type with interface class type as return *)
  Ml_validation.assert_method_exists ml_ast
    ~class_type:"foo_t" ~name:"get_iface"
    ~return_type:"GMyIface.my_iface_t option"

(* Layer 2: method taking interface parameter uses #as_ accessor pattern *)
let test_layer2_interface_param_uses_accessor () =
  let _content, ml_ast = run_and_parse_layer2_ml gir_class_with_iface_return "foo" in
  Ml_validation.assert_method_exists ml_ast
    ~class_type:"foo_t" ~name:"set_iface"
    ~param_types:["#GMyIface.my_iface_t"]

(* Real GIR spot-check: a class method with interface return is present in generated Layer 2 *)
(* e.g. GtkEditable.get_delegate — already working, confirms regression guard *)
let test_editable_get_delegate_generated () =
  let _content, ml_ast = run_and_parse_layer2_ml_real_gir "editable" in
  Ml_validation.assert_method_exists ml_ast
    ~class_type:"editable_t" ~name:"get_delegate"
    ~return_type:"editable_t option"
```

**Cross-namespace interfaces — no special treatment needed**

Cross-namespace interface types (e.g. `Gio.Initable`) are already handled by the existing
`find_type_mapping_for_gir_type` pipeline. When `normal_type_lookup` encounters a dotted name,
`find_cross_namespace_type_mapping` splits on `.`, looks up the namespace in
`ctx.cross_references`, and resolves the entity. `Crt_Interface` entries there are already
mapped to the correct qualified OCaml module path and `as_` accessor name (see
`type_mappings.ml:56–68`). The Layer 2 parameter and return-type generators just need to call
`find_type_mapping_for_gir_type` (as they already do for class types) and cross-namespace
interface resolution falls out for free.

**Note**: The `list_has_interface_element` filter in `filtering.ml` is intentionally left in
place — `GList`/`GSList` with interface elements still require specialised marshalling that
is out of scope for this phase.

**Test gate**: New tests pass, all existing tests pass, `dune build` succeeds, bindings compile.

---

### Phase 8: Runtime Tests — DONE ✅

**Goal**: Verify interface functionality at runtime with real GTK objects.

**Tasks**:
- [x] Create runtime test file: `ocgtk/tests/gtk/test_interface.ml`
- [x] Test: Entry inherits Editable methods (`set_text`/`get_text`, `delete_text`, `get_chars`, `set_position`)
- [x] Test: `Editable.from_gobject` succeeds for Entry and SpinButton (two implementing classes)
- [x] Test: `Editable.from_gobject` raises `Failure` for Button (non-implementing class)
- [x] Test: Layer 1 `set_text`/`get_text`, `insert_text`, `select_region`+`get_selection_bounds` via `Editable.t`
- [x] Test: `as_editable` accessor round-trip
- [x] Extract `gtk_available`/`require_gtk` into `gtk_test_helpers.ml`

**Test gate**: ✅ 12 tests pass under `xvfb-run dune runtest`.

```ocaml
(* Runtime test: Entry inherits Editable methods *)
let test_entry_has_editable_methods () =
  let entry = GEntry.new_ () in
  entry#set_text "hello";
  Alcotest.(check string) "get_text works via interface" "hello" (entry#get_text ())

(* Runtime test: from_gobject succeeds for implementing class *)
let test_from_gobject_succeeds () =
  let entry = GEntry.new_ () in
  let _editable = Editable.from_gobject entry#as_entry in
  ()

(* Runtime test: from_gobject fails for non-implementing class *)
let test_from_gobject_fails () =
  let button = GButton.new_ () in
  match Editable.from_gobject button#as_button with
  | exception Failure msg ->
      Alcotest.(check bool) "error message non-empty" true (String.length msg > 0)
  | _ -> Alcotest.fail "Expected Failure exception"
```

**Test gate**: All runtime tests pass under `xvfb-run dune runtest`.

---

## File Changes Summary

### Modified Files
- `ocgtk/src/tools/gir_gen/types.ml` — extend `gir_interface` ✅
- `ocgtk/src/tools/gir_gen/parse/gir_parser.ml` — parse interface metadata; fix `c_symbol_prefix`; add `<implements>` ✅
- `ocgtk/src/tools/gir_gen/gir_gen.ml` — generate `from_gobject` C stub ✅
- `ocgtk/src/tools/gir_gen/utils.ml` — `gtype_macro_of_type_name`, `cast_macro_of_type_name` ✅
- `ocgtk/src/tools/gir_gen/generate/class_gen_body.ml` — interface inheritance ✅
- `ocgtk/src/tools/gir_gen/generate/class_gen_conflict_detection.ml` — `parent_chain_provides_interface` ✅
- `ocgtk/src/tools/gir_gen/generate/layer1/layer1_main.ml` — `from_gobject` external, per-entity cyclic support ✅
- `ocgtk/src/tools/gir_gen/generate/layer1/layer1_main.mli` — updated signature ✅
- `ocgtk/src/tools/test_gir_gen/util/type_factory.ml` — extend `make_gir_interface` ✅

### New Test Files
- `ocgtk/src/tools/test_gir_gen/test_interface_parsing.ml` — Phase 1 ✅
- `ocgtk/src/tools/test_gir_gen/test_from_gobject_gen.ml` — Phase 2 ✅
- `ocgtk/src/tools/test_gir_gen/test_interface_inheritance.ml` — Phase 4 integration tests (not yet written — see Phase 4 test spec above)
- `ocgtk/tests/gtk/test_interface.ml` — Phase 8 runtime tests (not yet written)

### Regenerated Files (via `scripts/generate-bindings.sh`)
All files under `ocgtk/src/*/generated/` — regenerated in Phase 5 ✅:
- Interface `.c` files gain `from_gobject` function ✅
- Interface `.ml`/`.mli` files gain `from_gobject` external ✅
- Implementing class `g*.ml`/`g*.mli` files gain interface inheritance ✅

---

## Design Decisions

### D1: `from_gobject` raises exception, not `option`

Since we know at code-gen time which classes implement which interfaces, `from_gobject` is called
in contexts where failure indicates a code-gen bug. Returning `option` forces every call site to
handle `None` for an impossible case. Instead, `from_gobject` raises `Failure` with a message
including the actual and expected types.

### D2: No type parameter on interface class types

The existing generated `class type editable_t` has no type parameter and this works correctly.
Implementing classes inherit it directly: `inherit GEditable.editable_t`. No polymorphism needed —
OCaml's structural subtyping handles method inclusion.

### D3: Interface inheritance via class inheritance, not method delegation

Rather than generating individual method delegations for each interface method on each implementing
class, we use OCaml's `inherit` mechanism: `inherit GEditable.editable (Editable.from_gobject obj)`.
This automatically includes all interface methods and properties, avoids duplicating method wrappers,
and keeps generated code compact.

### D4: Virtual methods — generate regular methods only

The GIR has both `<virtual-method>` and `<method>` elements for interfaces. We generate only the
regular methods (which have `c:identifier`). The parser's `merge_methods` function handles
deduplication. Unchanged from existing behaviour.

### D5: Interface properties use same mechanism as class properties

Interface properties are accessed via `g_object_get_property`/`g_object_set_property`, same as class
properties. No changes needed.

### D6: Prerequisites are tracked but not enforced

`<prerequisite name="Widget"/>` on Editable means any implementing class must also implement Widget.
We store this in `gir_interface.prerequisites` but don't enforce it at code-gen time — the GIR data
is already consistent.

---

## Success Criteria

1. `Entry`, `Text`, `SpinButton`, `SearchEntry`, `PasswordEntry`, `EditableLabel` classes all inherit `GEditable.editable_t` in their generated Layer 2 code ✅
2. `Button` does NOT inherit `GEditable.editable_t` ✅
3. Interface methods work through inheritance: `entry#get_text ()` returns the entry's text
4. `Editable.from_gobject` succeeds on Entry, raises `Failure` on Button
5. All generated bindings compile with `dune build` ✅
6. All runtime tests pass under `xvfb-run dune runtest`
7. Method name conflicts between class and interface are handled gracefully ✅
8. Methods returning interface types on non-interface classes are generated at all three layers (Phase 7)
9. Methods taking interface parameters are generated with `#as_` accessor pattern at Layer 2 (Phase 7)
