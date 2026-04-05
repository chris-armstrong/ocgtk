# Interface Support Implementation Plan

## Overview

This plan adds GObject interface inheritance to ocgtk's code generator so that implementing classes (e.g. `Entry`) inherit their interfaces' Layer 2 class types (e.g. `editable_t`), and a `from_gobject` conversion function allows runtime conversion of any GObject to an interface type.

### Current State (what already works)

The generator **already** produces standalone bindings for interfaces at all three layers:

- **C stubs**: `ml_editable_gen.c` — all method wrappers and property getters/setters
- **Layer 1**: `editable.ml`/`.mli` — `type t = [`editable] Gobject.obj` with external declarations for all 20+ methods and 4 properties
- **Layer 2**: `gEditable.ml`/`.mli` — `class type editable_t` with method/property wrappers delegating to Layer 1, plus `class editable` implementing it
- **Forward declarations**: `Val_GtkEditable`/`GtkEditable_val` macros in `generated_forward_decls.h`

The parser (`gir_parser.ml:1239-1364`) already parses interface methods (including `<virtual-method>` elements, merged via `merge_methods`), properties, and signals. Interfaces flow through the same unified `entity` pipeline as classes.

### What's missing

1. **`from_gobject` function** — A C function + Layer 1 external that converts any `GObject` to an interface type with a runtime type check, raising an exception on failure.
2. **Interface inheritance at Layer 2** — Implementing classes (e.g. `Entry`) do not `inherit editable_t` or include interface methods/properties. The `gir_interface` type lacks the metadata needed to wire this up.
3. **Missing type metadata** — `gir_interface` lacks `glib_type_name`, `glib_get_type`, `prerequisites`, and `introspectable` fields.

### What the EditableInterface record is

The GIR defines `<record name="EditableInterface" glib:is-gtype-struct-for="Editable">` — this is the C struct containing virtual method pointers (vtable). The generator currently produces `editable_interface.ml`/`.mli` for this record, which is essentially empty. This is a GTypeStruct, not the interface itself. **It should continue to be generated as-is** (it may be useful for advanced use cases like implementing interfaces from OCaml in future).

## Reference Interface for Testing

**Primary Test Interface: `GtkEditable`**
- **GIR Location**: `/usr/share/gir-1.0/Gtk-4.0.gir`
- **glib:type-name**: `GtkEditable`
- **glib:get-type**: `gtk_editable_get_type`
- **glib:type-struct**: `EditableInterface`
- **c:type**: `GtkEditable`
- **c:symbol-prefix**: `editable`
- **Prerequisite**: `Widget`
- **Regular methods**: 20+ (get_text, set_text, insert_text, delete_text, etc.)
- **Virtual methods**: 9 (changed, delete_text, do_delete_text, do_insert_text, get_delegate, get_selection_bounds, get_text, insert_text, set_selection_bounds) — none have `c:identifier`
- **Properties**: 8 (text, cursor-position, selection-bound, editable, width-chars, max-width-chars, enable-undo, xalign)
- **Implementing classes**: Entry, Text, SpinButton, SearchEntry, PasswordEntry, EditableLabel

**Entry class implements**: Accessible, Buildable, CellEditable, ConstraintTarget, Editable (NOT Actionable)

**All GTK4 interfaces (28 total)**: Accessible, AccessibleRange, AccessibleText, Actionable, AppChooser, Buildable, BuilderScope, CellEditable, CellLayout, ColorChooser, ConstraintTarget, Editable, FileChooser, FontChooser, Native, Orientable, PrintOperationPreview, Root, Scrollable, SectionModel, SelectionModel, ShortcutManager, StyleProvider, SymbolicPaintable, TreeDragDest, TreeDragSource, TreeModel, TreeSortable

## Implementation Phases

### Phase 1: Type System and Parser Extensions

**Goal**: Add missing metadata to `gir_interface` and parse it from GIR.

**Tasks**:
- [ ] Extend `gir_interface` in `types.ml` (lines 156-164) with:
  - `glib_type_name : string option`
  - `glib_get_type : string option`
  - `prerequisites : string list`
  - `introspectable : bool`
- [ ] Update `parse_interface` in `gir_parser.ml` (line 1239) to:
  - Extract `glib:type-name` and `glib:get-type` from interface attributes (same pattern as `parse_class` at line 1046)
  - Parse `<prerequisite>` child elements into the `prerequisites` list
  - Set `introspectable` from attributes
- [ ] Update `entity_of_interface` in `types.ml` (line 199) if any new fields are needed on `entity`
- [ ] Fix all compilation errors from the type change (update record literals in parser, filtering, etc.)

**Tests**:

File: `ocgtk/src/tools/test_gir_gen/interface_tests/interface_parsing_tests.ml`

Parse `GtkEditable` from the real GIR file and verify:
- `glib_type_name` = `Some "GtkEditable"`
- `glib_get_type` = `Some "gtk_editable_get_type"`
- `prerequisites` = `["Widget"]`
- `introspectable` = `true`
- `methods` list is non-empty (verify count)
- `properties` list is non-empty (verify count)

**Test gate**: Tests pass, `dune build` succeeds.

---

### Phase 2: C Layer — `from_gobject` Function

**Goal**: Generate a C function for each interface that converts a GObject to the interface type, raising an OCaml exception on failure.

**Tasks**:
- [ ] Add `from_gobject` C stub generation in the entity generator pipeline (in `gir_gen.ml` or a new helper called from it)
- [ ] For each interface entity, generate a C function `ml_<ns>_<iface>_from_gobject` that:
  - Takes a `value obj` (any GObject)
  - Checks `g_type_is_a(G_OBJECT_TYPE(gobj), <IFACE_GTYPE>)` where `<IFACE_GTYPE>` is derived from `glib:type-name` (e.g. `GTK_TYPE_EDITABLE`)
  - On success: casts with the `GTK_EDITABLE()` macro and returns `Val_GtkEditable(iface)`
  - On failure: calls `caml_failwith` with a descriptive error message including the object's actual type name and the target interface name
- [ ] The `GTK_TYPE_EDITABLE` macro is derived from `glib:type-name` by: splitting on case boundaries, uppercasing, inserting underscores, appending `_TYPE_` between namespace and name (e.g. `GtkEditable` → `GTK_TYPE_EDITABLE`)

**Generated C Code Pattern**:
```c
CAMLexport CAMLprim value ml_gtk_editable_from_gobject(value obj)
{
    CAMLparam1(obj);
    GObject *gobj = GObject_val(obj);
    if (!g_type_is_a(G_OBJECT_TYPE(gobj), GTK_TYPE_EDITABLE)) {
        char msg[256];
        snprintf(msg, sizeof(msg),
            "from_gobject: object of type '%s' does not implement GtkEditable",
            G_OBJECT_TYPE_NAME(gobj));
        caml_failwith(msg);
    }
    GtkEditable *iface = GTK_EDITABLE(gobj);
    CAMLreturn(Val_GtkEditable(iface));
}
```

**Note**: `GTK_EDITABLE()` is a **cast macro** (checks and casts to `GtkEditable*`). This is different from `GTK_EDITABLE_GET_IFACE()` which returns the vtable struct — we want the cast macro.

**Tests**:
- [ ] Verify the generated C code for Editable compiles (include it in `ml_editable_gen.c`)
- [ ] C validation: function name, parameter count, presence of `g_type_is_a` check, presence of `caml_failwith`

**Test gate**: `dune build` succeeds with the new C function.

---

### Phase 3: Layer 1 — `from_gobject` External Declaration

**Goal**: Add a `from_gobject` external to each interface's Layer 1 module.

**Tasks**:
- [ ] Extend Layer 1 generation (in `layer1_main.ml` or the layer1 pipeline) to emit an additional external for interfaces:
  ```ocaml
  external from_gobject : 'a Gobject.obj -> t = "ml_gtk_editable_from_gobject"
  ```
- [ ] This should appear in both `.ml` and `.mli` files
- [ ] The C function name is derived from the interface's namespace and name

**Generated OCaml Pattern** (addition to existing `editable.mli`):
```ocaml
(* existing type and methods unchanged *)
type t = [`editable] Gobject.obj

(* NEW *)
external from_gobject : 'a Gobject.obj -> t = "ml_gtk_editable_from_gobject"

(* existing methods continue *)
external get_text : t -> string = "ml_gtk_editable_get_text"
(* ... *)
```

**Tests**:
- [ ] AST-validate the generated `.mli`: `from_gobject` external exists with correct C name
- [ ] AST-validate the generated `.ml`: `from_gobject` external exists

**Test gate**: Tests pass, `dune build` succeeds.

---

### Phase 4: Layer 2 — Interface Inheritance on Implementing Classes

**Goal**: Make implementing classes inherit the interface's Layer 2 class type and include all interface methods/properties.

This is the core deliverable. When `Entry` implements `Editable`, the generated `gEntry.ml` should:
1. Inherit `GEditable.editable_t`
2. Include all Editable methods (delegating to Layer 1 via `from_gobject` conversion)
3. Include all Editable properties (delegating similarly)

**Tasks**:
- [ ] In `class_gen_body.ml`, after parent class inheritance and signal inheritance, add interface inheritance:
  - Look up the entity's `implements` list (from `gir_class.implements`, already parsed)
  - For each implemented interface, resolve the Layer 2 class type name (e.g. `GEditable.editable_t`)
  - Emit `inherit <interface_class_type>` in the class type definition
  - Emit `inherit <interface_class> (Editable.from_gobject obj)` in the class implementation (this calls `from_gobject` to convert the class's Layer 1 `obj` to the interface type, then constructs the interface class)
- [ ] Handle method/property name conflicts between the class's own methods and inherited interface methods:
  - Use the existing conflict detection mechanism (`Class_gen_conflict_detection`)
  - When a class method and an interface method have the same name, the class's own method takes precedence (skip the inherited one)
- [ ] Handle cross-namespace interfaces (e.g. a Gtk class implementing a Gio interface):
  - Use `Type_mappings.find_type_mapping_for_gir_type` to resolve the qualified module path
- [ ] Handle signal inheritance from interfaces:
  - Interface signals should be inherited via the interface class type (already happens if `gEditable.ml` inherits signal class)

**Generated OCaml Pattern** — `gEntry.ml` (changes shown):
```ocaml
class type entry_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit GEditable.editable_t  (* NEW — interface class type *)
    inherit Gentry_signals.entry_signals
    (* Entry-specific methods ... *)
    method as_entry : Entry.t
end

class entry (obj : Entry.t) : entry_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit GEditable.editable (Editable.from_gobject obj)  (* NEW — inherits interface impl *)
  inherit Gentry_signals.entry_signals obj
  (* Entry-specific methods ... *)
end
```

**Implementation Notes**:
- The `from_gobject` call in `inherit GEditable.editable (Editable.from_gobject obj)` is safe because we know at code-gen time that Entry implements Editable. The exception from `from_gobject` would indicate a GIR/code-gen bug, not a user error.
- The interface class (`GEditable.editable`) already delegates all methods to Layer 1 functions that take `Editable.t` — no additional method delegation code is needed since OCaml's class inheritance handles this automatically.
- Interface inheritance should come **after** parent class inheritance but **before** signal inheritance, to match OCaml's linearisation order.

**Tests**:

File: `ocgtk/src/tools/test_gir_gen/interface_tests/class_interface_inheritance_tests.ml`

```ocaml
(* Test: Entry class type includes interface inheritance *)
(* Generate Entry with implements:[Editable], verify AST has inherit editable_t *)

(* Test: Entry class implementation inherits interface class with from_gobject *)
(* Verify the inherit line includes from_gobject call *)

(* Test: Method conflict — Entry.get_alignment (own) vs Editable.get_alignment *)
(* Verify only one get_alignment exists, from Entry not Editable *)

(* Test: Class without interface has no interface inheritance *)
(* Generate a class with implements:[], verify no interface inherit lines *)
```

**Test gate**: Tests pass, `dune build` succeeds, regenerated bindings compile.

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
- OCaml class linearisation issues with diamond inheritance (multiple interfaces sharing a common prerequisite like Widget)

**Test gate**: Full `dune build` succeeds with zero errors.

---

### Phase 6: Runtime Tests

**Goal**: Verify interface functionality at runtime with real GTK objects.

**Tasks**:
- [ ] Create runtime test file: `ocgtk/tests/gtk/test_interface.ml`
- [ ] Test: Create `Entry` via `GEntry.new_ ()`, verify `entry#get_text ()` returns `""` (inherited from Editable interface)
- [ ] Test: Verify `entry#as_editable` returns an `Editable.t` value
- [ ] Test: Call `Editable.from_gobject` on an Entry's underlying object, verify it succeeds
- [ ] Test: Call `Editable.from_gobject` on a Button's underlying object, verify it raises an exception (Failure)
- [ ] Test: Verify `Editable.set_text` / `Editable.get_text` work through the interface on an Entry
- [ ] Test: Verify `entry#get_delegate ()` returns an `editable_t option` (interface return type)

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
  () (* no exception = success *)

(* Runtime test: from_gobject fails for non-implementing class *)
let test_from_gobject_fails () =
  let button = GButton.new_ () in
  match Editable.from_gobject button#as_button with
  | exception Failure msg ->
    Alcotest.(check bool) "error mentions type" true
      (String.length msg > 0)
  | _ -> Alcotest.fail "Expected Failure exception"
```

**Test gate**: All runtime tests pass under `xvfb-run dune runtest`.

---

## File Changes Summary

### Modified Files
- `ocgtk/src/tools/gir_gen/types.ml` — extend `gir_interface` with 4 new fields
- `ocgtk/src/tools/gir_gen/parse/gir_parser.ml` — parse new interface attributes and prerequisites
- `ocgtk/src/tools/gir_gen/gir_gen.ml` — generate `from_gobject` C stub for interface entities
- `ocgtk/src/tools/gir_gen/generate/class_gen_body.ml` — add interface inheritance to class body generation
- `ocgtk/src/tools/gir_gen/generate/layer1/layer1_main.ml` — add `from_gobject` external to interface Layer 1

### New Test Files
- `ocgtk/src/tools/test_gir_gen/interface_tests/interface_parsing_tests.ml` — Phase 1
- `ocgtk/src/tools/test_gir_gen/interface_tests/class_interface_inheritance_tests.ml` — Phase 4
- `ocgtk/tests/gtk/test_interface.ml` — Phase 6 runtime tests

### Regenerated Files (via `scripts/generate-bindings.sh`)
All files under `ocgtk/src/*/generated/` — specifically:
- Interface `.c` files gain `from_gobject` function
- Interface `.ml`/`.mli` files gain `from_gobject` external
- Implementing class `g*.ml`/`g*.mli` files gain interface inheritance

---

## Design Decisions

### D1: `from_gobject` raises exception, not `option`

Since we know at code-gen time which classes implement which interfaces, `from_gobject` is called in contexts where failure indicates a code-gen bug. Returning `option` would force every call site to handle `None` for an impossible case. Instead, `from_gobject` raises `Failure` with a descriptive message including the actual and expected types.

### D2: No type parameter on interface class types

The existing generated `class type editable_t` has no type parameter and this works correctly. Implementing classes inherit it directly: `inherit GEditable.editable_t`. No `['a] editable_t` polymorphism is needed — OCaml's structural subtyping handles method inclusion.

### D3: Interface inheritance via class inheritance, not method delegation

Rather than generating individual method delegations for each interface method on each implementing class, we use OCaml's `inherit` mechanism: `inherit GEditable.editable (Editable.from_gobject obj)`. This:
- Automatically includes all interface methods and properties
- Avoids duplicating method wrappers across every implementing class
- Keeps generated code compact
- Leverages the existing `GEditable.editable` class which already delegates to Layer 1

### D4: Virtual methods — generate regular methods only

The GIR has both `<virtual-method>` and `<method>` elements for interfaces. Virtual methods define the vtable contract; regular methods are convenience wrappers that dispatch through the vtable. We generate only the regular methods (which have `c:identifier`). The parser's `merge_methods` function handles deduplication. This matches the existing behaviour and is unchanged by this plan.

### D5: Interface properties use same mechanism as class properties

Interface properties are accessed via `g_object_get_property`/`g_object_set_property`, same as class properties. The generator already handles this correctly. No changes needed.

### D6: Prerequisites are tracked but not enforced

`<prerequisite name="Widget"/>` on Editable means any implementing class must also implement Widget. We store this in `gir_interface.prerequisites` for documentation and potential future validation, but don't enforce it at code-gen time — the GIR data is already consistent.

---

## Success Criteria

1. `Entry`, `Text`, `SpinButton`, `SearchEntry`, `PasswordEntry`, `EditableLabel` classes all inherit `GEditable.editable_t` in their generated Layer 2 code
2. `Button` does NOT inherit `GEditable.editable_t`
3. Interface methods work through inheritance: `entry#get_text ()` returns the entry's text
4. `Editable.from_gobject` succeeds on Entry, raises `Failure` on Button
5. All generated bindings compile with `dune build`
6. All runtime tests pass under `xvfb-run dune runtest`
7. Method name conflicts between class and interface are handled gracefully
