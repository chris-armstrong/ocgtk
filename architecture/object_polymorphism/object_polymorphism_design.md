# Object Polymorphism — Implementation Status

**Last Updated:** 2026-03-23

## Overview

The object polymorphism system enables type-safe, natural OO programming
with GTK class hierarchies. Users write:

```ocaml
open Ocgtk_gtk.Gtk

let window = Window.new_ () in
let vbox = Box.new_ `VERTICAL 10 in
let btn = Button.new_with_label "OK" in

window#set_child (Some (vbox :> widget));
vbox#append (btn :> widget);
btn#set_label "Click Me";
```

## Architecture

### Layer 1 (C Bindings)

Each class gets a module (`Button`, `Widget`, etc.) with:

- **Polymorphic variant type**: `type t = [`button | `widget | `initially_unowned] Gobject.obj`
  - Tags include the class itself plus all ancestors in the parent chain
  - Built by `detect_class_hierarchy_names` in `layer1_helpers.ml` using the
    parent chain passed from `gir_gen.ml`
- **C FFI externals**: `external new_ : unit -> t = "ml_gtk_button_new"`
- **No accessor methods currently generated** — Layer 2 `inherit` provides
  parent access instead

### Layer 2 (OO Classes)

Each class gets a `G`-prefixed module (`GButton`, `GWidget`, etc.) with:

- **Class type definitions**: `class type button_t = object ... end`
  - Defined separately from classes for type-safe mutual recursion
  - Use plain type references (`widget_t` not `#widget_t`)
- **Classes constrained by class types**: `class button : button_t = object ... end`
- **Parent class inheritance**: `inherit widget (Obj.magic obj : Widget.t)`
  - Provides all ancestor methods automatically
  - Uses `Obj.magic` for L1 type cast (safe — GObject pointer representation
    is identical across hierarchy)
  - Skipped when parent is in the same cyclic cluster
- **Method conflict suppression**: When a child class declares a method with
  an incompatible signature vs an inherited parent method, the child's version
  is commented out with a `(* CONFLICT *)` marker
- **Internal coercion**: Class-typed parameters unwrap via `v#as_widget`
  before passing to C stubs
- **Converter method**: Each class has `method as_<class> = obj` for L1 access
- **Constructor wrappers**: Factory functions like `Button.new_with_label`
  that wrap L1 constructors with L2 class instantiation

### Module Organization

- **Module aliases** in `Gtk.ml`: `module Button = GButton` (compiler-erased,
  enables dead code elimination)
- **Wrappers submodule**: Re-exports L1 modules for direct access
- **Cyclic clusters**: Classes with mutual dependencies are grouped into
  combined modules (e.g., `gEvent_controller_and__widget.ml`) with `module rec`

### Type Resolution

Type resolution for cross-namespace references uses `type_mappings.ml`:

1. Check static type mappings (primitive types)
2. Check classes → `Module.t` (with `layer2_class` for L2 info)
3. Check interfaces → `Module.t`
4. Check records → `Module.t`
5. Cross-namespace: resolve via `ctx.cross_references`
6. `classify_type` returns `Tk_Class | Tk_Interface | Tk_Record | Tk_Enum | Tk_Bitfield | Tk_Primitive`

Self-references are simplified: `Button.t` → `t` within `button.ml`.

## History

### Hierarchy Detection System (removed 2026-03-23)

The original design used a `hierarchy_detection.ml` module with hardcoded
definitions for 5 GTK hierarchies (Widget, EventController, CellRenderer,
LayoutManager, Expression). Each class was classified by `hierarchy_kind`
and given a `hierarchy_info` record with accessor method names, root class
info, etc.

This system was removed because:

1. **`classify_class` always returned `MonomorphicType`** — the hierarchy
   matching logic (`build_hierarchy_definitions`) was defined but never called,
   so no class was ever classified into a named hierarchy
2. **Layer 1 accessor generation was dead** — `generate_hierarchy_accessor_section`
   always took the `| _ -> ()` branch
3. **Layer 2 usage was dead** — `get_param_hierarchy_info` was called but both
   `Some`/`None` branches did equivalent work
4. **Parent chain replaces it** — the parent chain (from `gir_class.parent` and
   `Crt_Class { parent }`) provides all the information the hierarchy system
   was supposed to provide, without hardcoding specific hierarchies

The removal was done in two steps:
- Step 5 (commit `777b5e0a`): Removed dead `hierarchy_info` from Layer 2
- Step 6 (commit `8bf9ab48`): Removed from Layer 1, deleted
  `hierarchy_detection.ml`, removed types from `types.ml`

### What's Not Yet Implemented

- **Layer 1 parent chain accessors**: `as_widget : t -> Widget.t` for each
  ancestor — would use `Obj.magic` and be driven by the parent chain
- **Interface prerequisites**: `gir_interface` doesn't carry prerequisite
  info yet (`Crt_Interface` has no parent data)
- **Factory constructors with optional property params**: Not yet generated
  (current constructors are positional wrappers around C constructors)
- **Interface implementation in type system**: e.g., Entry doesn't expose
  Editable methods — would require interface-typed `inherit`

## Implementation Checklist

### Phase 1: Core Infrastructure ✅
- [x] Polymorphic variant types for all classes
- [x] Keyword escaping in variant tags
- [x] Cross-namespace type resolution

### Phase 2: Layer 2 Automatic Coercion ✅
- [x] Class type definitions separate from class implementations
- [x] Plain class type references (no `#` prefix)
- [x] Internal coercion via `v#as_widget` in method bodies
- [x] Nullable parameter handling with `Option.map`

### Phase 3: Class Inheritance ✅
- [x] `inherit parent_t` in class types
- [x] `inherit parent (Obj.magic obj)` in implementations
- [x] Conflict suppression via seen set
- [x] Cyclic cluster handling (skip inherit for same-cluster parents)
- [x] All 9 namespaces compile with inheritance

### Phase 4: Dead Code Elimination ✅
- [x] Module aliases replace class re-exports in `Gtk.ml`
- [x] Wrappers submodule defined before aliases (avoids shadowing)
- [x] Constructor wrappers in L2 modules
- [x] Cyclic shim modules for cross-cluster constructors

### Phase 5: Cleanup ✅
- [x] Hierarchy detection system removed (was dead code)
- [x] Constructor wrapper duplication eliminated (6x → shared helpers)
- [x] Naming helpers centralized in `utils.ml`
