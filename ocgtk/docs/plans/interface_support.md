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

### Phase 3: Layer 1 — `from_gobject` External Declaration

**Goal**: Add a `from_gobject` external declaration to each interface's Layer 1 `.ml` and `.mli`.

**Tasks**:
- [ ] Extend Layer 1 generation in `layer1_main.ml` or the layer1 pipeline to emit, for each
  interface that has a `glib_type_name`:
  ```ocaml
  external from_gobject : 'a Gobject.obj -> t = "ml_gtk_editable_from_gobject"
  ```
- [ ] Emit the external in both `.ml` and `.mli` files
- [ ] The C name is `ml_<namespace_snake>_<iface_snake>_from_gobject`
- [ ] Only emit when `glib_type_name` is `Some` (guard same as Phase 2 C stub)

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

### Phase 4: Layer 2 — Interface Inheritance on Implementing Classes

**Goal**: Make implementing classes inherit the interface's Layer 2 class type and include all
interface methods/properties via `inherit`.

When `Entry` implements `Editable`, the generated `gEntry.ml` must:
1. Inherit `GEditable.editable_t` in the class type
2. Inherit `GEditable.editable (Editable.from_gobject obj)` in the class implementation

**Tasks**:
- [ ] **Add `~implements:string list` parameter** to `generate_class_module` and `generate_class_signature`
  in `class_gen.ml`, to `generate_class_module_body` and `generate_class_signature_body` in
  `class_gen_body.ml`, and to the combined-class variants. Thread from `entity.implements` at
  every call site in `gir_gen.ml`.
- [ ] In `class_gen_body.ml`, **after parent class inheritance but before signal inheritance**:
  - Iterate `implements`
  - For each interface name, resolve the Layer 2 class type name (e.g. `GEditable.editable_t`)
    and class name (e.g. `GEditable.editable`)
  - Emit `inherit <interface_class_type>` in the class type definition
  - Emit `inherit <interface_class> (<InterfaceLayer1>.from_gobject obj)` in the class body
- [ ] **Interface method conflict detection**: extend `Class_gen_conflict_detection` so that any
  method name that appears in an inherited interface is suppressed on the implementing class's own
  method list (the class's own method wins). This prevents duplicate definitions.
- [ ] Handle cross-namespace interfaces: use `Type_mappings.find_type_mapping_for_gir_type` to
  resolve the qualified module path for interfaces in other namespaces.

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

### Phase 5: Integration — Generate and Compile All Bindings

**Goal**: Regenerate all bindings and verify everything compiles.

**Tasks**:
- [ ] Run `bash scripts/generate-bindings.sh` to regenerate all 9 namespace bindings
- [ ] Run `cd ocgtk && dune build` and fix any compilation errors
- [ ] Spot-check generated files:
  - `gEntry.ml` inherits `GEditable.editable_t` and `GCellEditable.cell_editable_t` (and others)
  - `gButton.ml` does NOT inherit `GEditable.editable_t` (Button doesn't implement Editable)
  - `gSpinButton.ml` inherits `GEditable.editable_t`
  - `gEntry.ml` does NOT inherit `GActionable` (Entry does not implement Actionable)

**Potential issues to watch for**:
- Method name conflicts between multiple interfaces on the same class
- Cross-namespace interface resolution (e.g. Gio interfaces implemented by Gtk classes)
- Circular dependency issues if interface classes reference each other
- OCaml class linearisation issues with diamond inheritance (multiple interfaces sharing a
  common prerequisite like Widget)

**Test gate**: Full `dune build` succeeds with zero errors.

---

### Phase 6: Runtime Tests

**Goal**: Verify interface functionality at runtime with real GTK objects.

**Tasks**:
- [ ] Create runtime test file: `ocgtk/tests/gtk/test_interface.ml`
- [ ] Test: Create `Entry` via `GEntry.new_ ()`, verify `entry#get_text ()` returns `""`
  (inherited from Editable interface)
- [ ] Test: Call `Editable.from_gobject` on an Entry's underlying object — must succeed
- [ ] Test: Call `Editable.from_gobject` on a Button's underlying object — must raise `Failure`
- [ ] Test: Verify `Editable.set_text` / `Editable.get_text` work through the interface on an Entry

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
- `ocgtk/src/tools/gir_gen/generate/class_gen.ml` — add `~implements` parameter (Phase 4)
- `ocgtk/src/tools/gir_gen/generate/class_gen_body.ml` — interface inheritance (Phase 4)
- `ocgtk/src/tools/gir_gen/generate/layer1/layer1_main.ml` — `from_gobject` external (Phase 3)
- `ocgtk/src/tools/test_gir_gen/util/type_factory.ml` — extend `make_gir_interface` ✅

### New Test Files
- `ocgtk/src/tools/test_gir_gen/test_interface_parsing.ml` — Phase 1 ✅
- `ocgtk/src/tools/test_gir_gen/test_from_gobject_gen.ml` — Phase 2 ✅
- `ocgtk/src/tools/test_gir_gen/test_interface_inheritance.ml` — Phase 4 (integration tests)
- `ocgtk/tests/gtk/test_interface.ml` — Phase 6 runtime tests

### Regenerated Files (via `scripts/generate-bindings.sh`)
All files under `ocgtk/src/*/generated/` — specifically:
- Interface `.c` files gain `from_gobject` function (Phase 2 ✅)
- Interface `.ml`/`.mli` files gain `from_gobject` external (Phase 3)
- Implementing class `g*.ml`/`g*.mli` files gain interface inheritance (Phase 4)

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

1. `Entry`, `Text`, `SpinButton`, `SearchEntry`, `PasswordEntry`, `EditableLabel` classes all inherit `GEditable.editable_t` in their generated Layer 2 code
2. `Button` does NOT inherit `GEditable.editable_t`
3. Interface methods work through inheritance: `entry#get_text ()` returns the entry's text
4. `Editable.from_gobject` succeeds on Entry, raises `Failure` on Button
5. All generated bindings compile with `dune build`
6. All runtime tests pass under `xvfb-run dune runtest`
7. Method name conflicts between class and interface are handled gracefully
