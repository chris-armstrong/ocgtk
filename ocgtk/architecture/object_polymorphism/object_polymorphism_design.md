# Automatic Coercion in Generated Classes - Implementation Status

**Last Updated:** 2025-12-03

## Goal

Enable natural usage in Layer 2 where users can pass any compatible subclass without explicit coercion:

```ocaml
let button = new GButton.button (Button.new_ ()) in
let expander = new GExpander.expander (Expander.new_ ()) in
expander#set_child button  (* Works automatically - no :> needed! *)
```

## Implementation Progress

### ✅ Completed

1. **Hierarchy Detection System** ([hierarchy_detection.ml](src/tools/gir_gen/hierarchy_detection.ml))
   - Created hierarchy classification for 5 GTK hierarchies:
     - `WidgetHierarchy` (root: Widget)
     - `EventControllerHierarchy` (root: EventController)
     - `CellRendererHierarchy` (root: CellRenderer)
     - `LayoutManagerHierarchy` (root: LayoutManager)
     - `ExpressionHierarchy` (root: Expression)
   - Each hierarchy has: root class, Layer 2 module name, class type name, accessor method

2. **Layer 1 Polymorphic Variant Types** ([ml_interface.ml](src/tools/gir_gen/generate/ml_interface.ml))
   - All GTK classes now use polymorphic variants: `type t = [\`button | \`widget | \`initially_unowned] Gobject.obj`
   - OCaml keywords in variants are properly escaped: `object` → `object_`, `constraint` → `constraint_`
   - Accessor methods generated for hierarchy roots: `val as_widget : t -> Widget.t`

3. **Layer 2 Automatic Coercion** ([class_gen.ml](src/tools/gir_gen/generate/class_gen.ml))
   - Methods use plain class type references: `method set_child : widget_t option -> unit`
   - No `#` prefix (invalid in class type definitions — introduces unbound type variable)
   - Internal coercion in implementations: `child#as_widget`
   - Optional parameter handling: `Option.map (fun c -> c#as_widget) child_opt`

### ✅ All Original Issues Resolved

All three originally identified outstanding issues have been successfully fixed:

1. **✅ Missing Hierarchy Root Classes - FIXED**
   - All hierarchy roots (Widget, LayoutManager, CellRenderer, EventController, Expression) now exist
   - Fixed circular self-references (no more `Widget.as_widget : t -> Widget.t`)
   - Accessor methods only generated for non-root hierarchy members
   - Implementation in [ml_interface.ml:118-133](src/tools/gir_gen/generate/ml_interface.ml#L118-L133)

2. **✅ Non-Widget Classes Inheriting from widget_impl - FIXED**
   - Only Widget hierarchy classes now inherit from `GObj.widget_impl`
   - Non-widget classes (interfaces, other hierarchies) no longer inherit incorrectly
   - Hierarchy detection check added to both implementation and signature generation
   - Implementation in [class_gen.ml:248-265](src/tools/gir_gen/generate/class_gen.ml#L248-L265)

3. **✅ Type Mapping Using Gtk.widget Fallback - FIXED**
   - All types now use proper module types (Widget.t, Tree_model.t, Tree_iter.t, etc.)
   - Fixed static GtkWidget* mapping to use Widget.t instead of Gtk.widget
   - Added dynamic type lookup with proper module name generation
   - Added interface type support (TreeModel, Accessible, etc.)
   - Added record type support with proper module references
   - Self-references simplified (Tree_model.t → t within tree_model.ml)
   - Record definitions use Obj.t internally while exposing opaque types externally
   - Implementation across [type_mappings.ml](src/tools/gir_gen/type_mappings.ml) and [main.ml](src/tools/gir_gen/main.ml)

## Solution: Class Type Definitions with Constrained Classes

We generate separate `class type` definitions and `class` implementations constrained by those types:

1. **Class types** (`class type widget_t = object ... end`) for type-safe interfaces — can self-reference and mutually recurse
2. **Classes** constrained by class types (`class widget : widget_t = object ... end`)
3. **Plain type references** — `widget_t` not `#widget_t` (the `#` syntax introduces unbound type variables in class type definitions)
4. **Internal coercion to Layer 1** types via `v#as_widget` accessor methods

### Current Generated Output Example

**Layer 1 - button.mli:**
```ocaml
(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Button *)

type t = [`button | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Widget.t

external new_ : unit -> t = "ml_gtk_button_new"
external set_child : t -> Widget.t option -> unit = "ml_gtk_button_set_child"
```

**Layer 2 - gButton.mli:**
```ocaml
class type button_t = object
    method set_child : widget_t option -> unit
    (* ... other methods ... *)
    method as_button : Button.t
end

class button : Button.t -> button_t
```

**Layer 2 - gButton.ml:**
```ocaml
class type button_t = object
    method set_child : widget_t option -> unit
    (* ... other methods ... *)
    method as_button : Button.t
end

class button (obj : Button.t) : button_t = object (self)
  method set_child : widget_t option -> unit =
    fun child ->
      let child = Option.map (fun c -> c#as_widget) child in
      Button.set_child obj child

  method as_button = obj
end
```

## Architecture

### Layer 1 (C Bindings)
- ✅ Polymorphic variants: `type t = [\`button | \`widget] Gobject.obj`
- ✅ Accessor functions: `val as_widget : t -> Widget.t`
- ✅ Direct C FFI bindings with proper types

### Layer 2 (OO Classes)
- ✅ **Class types** defined separately (`class type widget_t = object ... end`)
- ✅ **Classes** constrained by class types (`class widget : widget_t = object ... end`)
- ✅ **Type references** use plain class type names (`widget_t` not `#widget_t`)
- ✅ **Internal coercion** to Layer 1 via `v#as_widget`
- ✅ **Self-referencing** works in class type definitions

## Implemented Generator Fixes

### ✅ Fix 1: Only Generate widget_impl Inheritance for Widgets

**File:** [class_gen.ml:248-265](src/tools/gir_gen/generate/class_gen.ml#L248-L265)

**Implementation:**
```ocaml
(* Check if this class is in the Widget hierarchy *)
let in_widget_hierarchy =
  match Hierarchy_detection.get_hierarchy_info ctx class_name with
  | Some info -> info.hierarchy = WidgetHierarchy
  | None -> false
in

bprintf buf "class %s_skel (obj : %s.t) = object (self)\n" class_snake module_name;

if in_widget_hierarchy then
  bprintf buf "  inherit GObj.widget_impl (%s.as_widget obj)\n\n" module_name
else
  (* Non-widget classes don't inherit from widget_impl *)
  bprintf buf "\n";
```

This check is applied in both the implementation generation and signature generation to ensure only Widget hierarchy classes inherit from `widget_impl`.

### ✅ Fix 2: Generate Hierarchy Root Classes Without Circular References

**File:** [ml_interface.ml:118-133](src/tools/gir_gen/generate/ml_interface.ml#L118-L133)

**Implementation:**
```ocaml
(* Generate accessor method for hierarchy types *)
(match Hierarchy_detection.get_hierarchy_info ctx class_name with
 | Some hier_info when hier_info.hierarchy <> MonomorphicType ->
     (* Only generate accessor if this is NOT the hierarchy root itself *)
     if class_name <> hier_info.gir_root then begin
       let accessor = hier_info.accessor_method in
       let base_type = hier_info.layer1_base_type in
       let base_type = simplify_self_reference ~class_name base_type in
       if is_impl then
         bprintf buf "let %s (obj : t) : %s = Obj.magic obj\n\n" accessor base_type
       else
         bprintf buf "val %s : t -> %s\n\n" accessor base_type
     end
 | _ -> ());
```

This prevents circular references like `Widget.as_widget : t -> Widget.t` by skipping accessor generation for hierarchy roots.

### ✅ Fix 3: Comprehensive Type Mapping Overhaul

**Files:** [type_mappings.ml](src/tools/gir_gen/type_mappings.ml), [ml_interface.ml](src/tools/gir_gen/generate/ml_interface.ml), [main.ml](src/tools/gir_gen/main.ml)

**Changes:**

1. **Static mapping fix** - type_mappings.ml:52-57
   ```ocaml
   ("GtkWidget*", {
     ocaml_type = "Widget.t";  (* Changed from "Gtk.widget" *)
     c_to_ml = "Val_GtkWidget";
     ml_to_c = "GtkWidget_val";
     needs_copy = false;
   });
   ```

2. **Dynamic class/interface/record lookup** - type_mappings.ml:293-338
   - Added `find_interface_mapping` for interface types
   - Modified type lookup to check classes, then interfaces, then records
   - All use proper module names: `Utils.module_name_of_class cls.class_name ^ ".t"`

3. **Self-reference simplification** - ml_interface.ml:14-21
   ```ocaml
   let simplify_self_reference ~class_name ocaml_type =
     let current_module = Utils.module_name_of_class class_name in
     let self_type = current_module ^ ".t" in
     if ocaml_type = self_type then "t"
     else ocaml_type
   ```
   Applied to return types, parameters, out parameters, and accessor methods.

4. **Record base type fix** - main.ml:250-252
   ```ocaml
   (* Records always use Obj.t as their base type implementation *)
   let base_type = "Obj.t" in
   ```
   Ensures records have `type t = Obj.t` internally while other modules reference them as `Tree_iter.t`, etc.

## Additional Type Mapping Fixes

Through iterative testing and feedback, several additional type mapping issues were identified and resolved:

### Issue 4: Interface Types Using Gtk.widget Fallback
**Problem:** Interface types like TreeModel were falling back to `Gtk.widget` because only classes were checked in type mapping.

**Example:** `tree_model_sort.ml` had parameters/returns typed as `Gtk.widget` instead of `Tree_model.t`

**Fix:** Added `find_interface_mapping` function in type_mappings.ml:247-261 to check interfaces after classes in the type lookup chain.

### Issue 5: Self-References Not Simplified
**Problem:** Methods returning the same type used full module path: `external filter_new : t -> Tree_path.t option -> Tree_model.t` in tree_model.ml

**Should be:** `external filter_new : t -> Tree_path.t option -> t`

**Fix:** Created `simplify_self_reference` helper in ml_interface.ml:14-21 and applied it to all return types, parameters, out parameters, and accessor methods.

### Issue 6: Record Types Using Obj.t in Parameters
**Problem:** Methods accepting GtkTreeIter* had `Obj.t` parameters instead of `Tree_iter.t`

**Example:** Parameters and returns using record types were typed as `Obj.t` instead of proper module references

**Fix:** Modified record mapping in type_mappings.ml to use `Utils.module_name_of_class record.record_name ^ ".t"` for all external references.

### Issue 7: Record Definitions with Circular References
**Problem:** Record modules defined `type t = Tree_iter.t` (circular) after fix #6

**Should be:**
- In tree_iter.ml: `type t = Obj.t` (implementation)
- In tree_iter.mli: `type t` (opaque)
- In other modules: `Tree_iter.t` (external reference)

**Fix:** Hardcoded record base types to use `Obj.t` in main.ml:250-252, ensuring only the record's own definition uses Obj.t while all external references use the proper module type.

### Type Mapping Priority Chain

The final type lookup chain in type_mappings.ml (lines 293-338) is:

1. Check static type mappings (primitive types, GtkWidget*, etc.)
2. Check if it's a known class → use `Module.t`
3. Check if it's a known interface → use `Module.t`
4. Check if it's a known record → use `Module.t`
5. Fall back to warning + return `unit`

All module names are generated using `Utils.module_name_of_class` which converts snake_case GIR names to proper OCaml module names.

## Hierarchy Mapping

Defined in [hierarchy_detection.ml](src/tools/gir_gen/hierarchy_detection.ml):

```ocaml
let hierarchy_definitions = [
  {
    hierarchy = WidgetHierarchy;
    gir_root = "Widget";
    layer2_module = "GWidget";
    class_type_name = "widget_t";
    accessor_method = "as_widget";
    layer1_base_type = "Widget.t";
  };
  {
    hierarchy = EventControllerHierarchy;
    gir_root = "EventController";
    layer2_module = "GEvent_controller";
    class_type_name = "event_controller_t";
    accessor_method = "as_event_controller";
    layer1_base_type = "EventController.t";
  };
  (* ... 3 more hierarchies ... *)
]
```

## Implementation Checklist

### Phase 1: Core Infrastructure ✅
- [x] Create hierarchy_detection.ml module
- [x] Add hierarchy_kind and hierarchy_info types to types.ml
- [x] Build hierarchy_map in generation_context
- [x] Generate polymorphic variant types for all classes
- [x] Escape OCaml keywords in variant tags
- [x] Generate accessor methods for hierarchy roots

### Phase 2: Layer 2 Automatic Coercion ✅
- [x] Detect hierarchy parameters in methods
- [x] Generate plain class type references in signatures (no `#` — invalid in class type defs)
- [x] Add explicit polymorphism `'a.` for hierarchy parameters
- [x] Generate automatic coercion in implementations
- [x] Handle optional hierarchy parameters

### Phase 3: Bug Fixes ✅
- [x] Only generate `widget_impl` inheritance for Widget hierarchy
- [x] Generate missing hierarchy root classes (removed circular self-references)
- [x] Fix return types using Gtk.widget → Widget.t
- [x] Fix interface type support (TreeModel, Accessible, etc.)
- [x] Fix record types using Obj.t → proper module types (Tree_iter.t, Tree_path.t)
- [x] Fix self-reference simplification (Tree_model.t → t in same file)
- [ ] Resolve circular type dependencies in GTK API

### Phase 4: Parent Class Inheritance ✅
- [x] Add `inherit parent_t` to class types (e.g., `button_t` inherits `widget_t`)
- [x] Add `inherit parent` to class implementations (with `Obj.magic` for L1 type cast)
- [x] Suppress inherited methods via seen set (conflict detection)
- [x] Build examples with `:>` coercion pattern
- [x] All 9 namespaces compile with inheritance

## Benefits

1. **Type-safe coercion**: `(btn :> widget)` — checked at compile time
2. **Inherited methods**: Button instances automatically have all Widget methods
3. **Short class names**: `open Ocgtk_gtk.Gtk` brings `widget`, `button`, `box`, etc.
4. **Type Safety**: Can't pass Button where Label expected
5. **No Runtime Cost**: `:>` coercions are compile-time only

## Known Working Examples

From the current generated code (see `examples/` directory):

```ocaml
open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain

(* Box accepts any widget via :> coercion *)
let vbox = new box (Wrappers.Box.new_ `VERTICAL 10) in
let btn = new button (Wrappers.Button.new_with_label "OK") in
vbox#append (btn :> widget);

(* Window.set_child takes widget_t option *)
let window = new window (Wrappers.Window.new_ ()) in
window#set_child (Some (vbox :> widget));

(* Label, Entry, etc. all coerce to widget *)
let lbl = new label (Wrappers.Label.new_ (Some "Hello")) in
vbox#append (lbl :> widget);
```

## Summary

The polymorphic object system is **complete for current scope**:
- ✅ Layer 1 polymorphic variants work correctly
- ✅ Layer 2 class type inheritance (`button_t` inherits `widget_t`)
- ✅ Layer 2 class implementation inheritance (with `Obj.magic` for L1 type casts)
- ✅ Type coercion via `:>` (e.g., `(btn :> widget)`) works for all widget subclasses
- ✅ Keyword escaping prevents syntax errors
- ✅ Inherited method conflict suppression via seen set
- ✅ All 9 namespaces generate and compile cleanly
- ✅ Fixed all type mapping issues (classes, interfaces, records, self-references)
- ⚠️ Dependency cycles in GTK API handled via clustered modules (e.g., `gEvent_controller_and__layout_child_and__...`)
- 🚧 Factory constructors (with optional property params) not yet implemented
- 🚧 Interface implementation not modeled in type system (e.g., Entry doesn't expose Editable — requires `Obj.magic` cast)
