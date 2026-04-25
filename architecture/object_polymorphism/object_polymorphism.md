# Object Polymorphism Design for GTK Class Hierarchies

**Related documents:**
- [Code Generator Changes](gir_gen_changes_spec.md) - Implementation details for gir_gen modifications
- [Design Rationale](object_polymorphism_design.md) - In-depth analysis of design options

---

## Overview

This document specifies the object polymorphism system for ocgtk, enabling type-safe, natural object-oriented programming with GTK widgets and other hierarchies.

### Goals

1. **Natural API**: Users shouldn't need explicit type coercions
2. **Type Safety**: Compile-time checking prevents passing wrong types
3. **Hide Layer 1**: Users shouldn't interact with low-level C bindings
4. **Consistent**: Same patterns across all GTK hierarchies

### User Experience (Current)

**What users write:**
```ocaml
open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain

(* Create Layer 1 objects, wrap in Layer 2 classes *)
let window = new window (Wrappers.Window.new_ ()) in
let vbox = new box (Wrappers.Box.new_ `VERTICAL 10) in
let btn = new button (Wrappers.Button.new_with_label "OK") in

(* Coerce child classes to parent type with :> *)
window#set_child (Some (vbox :> widget));
vbox#append (btn :> widget);

(* Use Layer 2 methods for properties and signals *)
btn#set_label "Click Me";
ignore (btn#on_clicked ~callback:(fun () -> print_endline "clicked"));
```

**What users DON'T write (old pattern):**
```ocaml
(* ❌ Long generated module names *)
let widget = new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget obj in

(* ❌ Manual as_widget unwrapping *)
box#append (new widget (Obj.magic btn#as_button));
```

**Future: Factory functions (not yet implemented)**
```ocaml
(* Factory functions will eliminate Layer 1 exposure *)
let btn = GButton.button ~label:"OK" () in
let box = GBox.box ~orientation:`HORIZONTAL () in
box#append btn;  (* Automatic coercion, no :> needed *)
```

---

## Architecture

### Two-Layer Design

**Layer 1: C Bindings** (`entry.ml`, `widget.ml`)
- Generated from GIR introspection
- Direct FFI to C functions
- Polymorphic variant types: `type t = [`entry | `widget] Gobject.obj`
- Provides `as_widget` coercion functions
- Users should never interact with this layer

**Layer 2: OO Classes** (`gEntry.ml`, `gWidget.ml`)
- Generated classes with natural OO API
- Factory functions for construction
- Class types for interfaces
- Class type definitions (`class type widget_t = object ... end`) for type-safe interfaces
- This is the user-facing API

---

## Class Types and Automatic Coercion

### Class Type Definition

Every class first defines a class type, then a class constrained by it:

```ocaml
(* In gWidget.mli *)
class type widget_t = object
  method show : unit -> unit
  method hide : unit -> unit
  method set_visible : bool -> unit
  method as_widget : Widget.t  (* Accessor to Layer 1 *)
  (* ... all widget methods ... *)
end

class widget : Widget.t -> widget_t
```

### Type References

Methods accepting hierarchy types use the class type name directly:

```ocaml
(* In gBox.mli *)
class type box_t = object
  (* References widget_t directly *)
  method append : widget_t -> unit
  method prepend : widget_t -> unit
  method as_box : Box.t
end
```

**Note:** `#class_type` syntax cannot be used in `class type` definitions because it introduces unbound type variables. Callers must use explicit coercion `(btn :> widget_t)` when passing subtypes.

### How It Works

**Generated implementation:**
```ocaml
(* In gBox.ml *)
class type box_t = object
  method append : widget_t -> unit
  method prepend : widget_t -> unit
  method as_box : Box.t
end

class box (obj : Box.t) : box_t = object (self)
  method append : widget_t -> unit =
    fun child ->
      Box.append obj (child#as_widget)

  method prepend : widget_t -> unit =
    fun child ->
      Box.prepend obj (child#as_widget)

  method as_box = obj
end
```

**Key points:**
1. Class type defined first, class constrained by `: box_t`
2. Parameters typed as `widget_t` — caller calls `v#as_widget` to get Layer 1 type
3. Self-referencing and mutual recursion work in `class type` definitions

---

## Constructor Functions

### Factory Function Pattern

Every class gets factory functions instead of exposing Layer 1 constructors:

```ocaml
(* In gButton.mli *)
class type button_t = object
  (* ... button methods ... *)
  method as_button : Button.t
end

class button : Button.t -> button_t

(* Factory functions *)
val button :
  ?label:string ->
  ?has_frame:bool ->
  ?icon_name:string ->
  unit -> button

val button_with_label : string -> button
val button_from_icon_name : string -> button
```

### Implementation

```ocaml
(* In gButton.ml *)
(* Primary constructor with optional properties *)
let button ?label ?has_frame ?icon_name () =
  let obj = Button.new_ () in
  let btn = new button obj in
  Option.iter (fun v -> btn#set_label v) label;
  Option.iter (fun v -> btn#set_has_frame v) has_frame;
  Option.iter (fun v -> btn#set_icon_name v) icon_name;
  btn

(* Named constructors for GIR alternates *)
let button_with_label label =
  new button (Button.new_with_label label)

let button_from_icon_name icon_name =
  new button (Button.new_from_icon_name icon_name)
```

### Construction Rules

1. **Primary constructor** matches default GIR constructor (`new_`)
   - Adds optional parameters for common writable properties
   - Returns class instance

2. **Named constructors** for each additional GIR constructor
   - Strip `new_` prefix: `gtk_button_new_with_label` → `button_with_label`
   - Take required parameters
   - Return class instance

3. **Property selection** for optional parameters
   - Only writable, non-construct-only properties
   - Limit to 5-6 most common properties
   - Configurable via exclude list

---

## Hierarchy Support

### Supported Hierarchies

| Hierarchy | Root Class | Layer 2 Module | Class Type | Status |
|-----------|------------|----------------|------------|--------|
| Widget | `Widget` | `GWidget` | `widget_t` | ✅ Implemented |
| EventController | `EventController` | `GEvent_controller` | `event_controller_t` | ✅ Generated |
| CellRenderer | `CellRenderer` | `GCell_renderer` | `cell_renderer_t` | ✅ Generated |
| LayoutManager | `LayoutManager` | `GLayout_manager` | `layout_manager_t` | ✅ Generated |
| Expression | `Expression` | `GExpression` | `expression_t` | ✅ Generated |

### Hierarchy Detection

The code generator automatically detects hierarchies by walking parent chains:

```ocaml
(* Button → Widget → [hierarchy root] *)
classify_class ~class_name:"Button" ~parent_chain:["Widget"]
  → WidgetHierarchy

(* GestureClick → GestureSingle → Gesture → EventController *)
classify_class ~class_name:"GestureClick" ~parent_chain:["GestureSingle"; "Gesture"; "EventController"]
  → EventControllerHierarchy
```

---

## Complete Example: Expander

### GIR Definition

```xml
<class name="Expander" parent="Widget">
  <constructor name="new" c:identifier="gtk_expander_new"/>

  <method name="set_child" c:identifier="gtk_expander_set_child">
    <parameters>
      <parameter name="child" nullable="1">
        <type name="Widget" c:type="GtkWidget*"/>
      </parameter>
    </parameters>
  </method>

  <property name="label" writable="1" construct="0">
    <type name="utf8"/>
  </property>
</class>
```

### Generated Code

**gExpander.mli:**
```ocaml
class type expander_t = object
  method set_child : widget_t option -> unit
  method get_child : unit -> widget_t option
  method set_label : string option -> unit
  method get_label : unit -> string option
  method set_expanded : bool -> unit
  method get_expanded : unit -> bool
  method as_expander : Expander.t
end

class expander : Expander.t -> expander_t
```

**gExpander.ml:**
```ocaml
class type expander_t = object
  method set_child : widget_t option -> unit
  method get_child : unit -> widget_t option
  method set_label : string option -> unit
  method get_label : unit -> string option
  method set_expanded : bool -> unit
  method get_expanded : unit -> bool
  method as_expander : Expander.t
end

class expander (obj : Expander.t) : expander_t = object (self)
  method set_child : widget_t option -> unit =
    fun child_opt ->
      let child_opt = Option.map (fun c -> c#as_widget) child_opt in
      Expander.set_child obj child_opt

  method get_child () =
    Option.map (fun ret -> new widget ret) (Expander.get_child obj)
  method set_label label = Expander.set_label obj label
  method get_label () = Expander.get_label obj
  method set_expanded expanded = Expander.set_expanded obj expanded
  method get_expanded () = Expander.get_expanded obj
  method as_expander = obj
end
```

### Usage

```ocaml
open Ocgtk_gtk.Gtk

(* Create expander *)
let exp = new expander (Wrappers.Expander.new_ (Some "Details")) in

(* Create button *)
let btn = new button (Wrappers.Button.new_with_label "Click me") in

(* Set button as child - coerce to widget_t *)
exp#set_child (Some (btn :> widget));

(* Works with any widget subclass *)
let lbl = new label (Wrappers.Label.new_ (Some "Hello")) in
exp#set_child (Some (lbl :> widget));
exp#set_child None;  (* Clear child *)
```

---

## Implementation Status

### Phase 1: Widget Hierarchy (Current)
- ✅ Layer 1 polymorphic variants
- ✅ Layer 2 classes with separate `class type` definitions
- ✅ Class types use plain type names (no `#` — incompatible with class type definitions)
- ✅ Parent class inheritance via `inherit` (e.g., `button_t` inherits `widget_t`)
- ✅ Inherited method conflict suppression (seen set)
- ✅ Type coercion with `:>` (e.g., `(btn :> widget)`)
- 🚧 Factory constructors (with optional property params)

### Phase 2: Other Hierarchies
- ✅ EventController hierarchy generated
- ✅ CellRenderer hierarchy generated
- ✅ LayoutManager hierarchy generated
- ✅ Expression hierarchy generated

---

## Benefits

1. **Intuitive API**: Feels like native OO programming
2. **Type Safe**: Can't pass Button where Label expected
3. **Discoverable**: IDE autocomplete shows all options
4. **Maintainable**: Generated, not hand-written
5. **Consistent**: Same patterns everywhere
6. **Zero Cost**: Coercions are compile-time only

---

## Migration Guide

### Updating Existing Code

**Old pattern (long module names, manual wrapping):**
```ocaml
open Ocgtk_gtk
let vbox = new GBox.box vbox_obj in
let lbl_widget = Label.as_widget lbl_obj in
vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget lbl_widget);
vbox#append (apply_btn :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget);
```

**New pattern (short names, type coercion):**
```ocaml
open Ocgtk_gtk.Gtk
let vbox = new box (Wrappers.Box.new_ `VERTICAL 10) in
let lbl = new label (Wrappers.Label.new_ (Some "Status")) in
vbox#append (lbl :> widget);
vbox#append (apply_btn :> widget);
```

### Key changes
- `open Ocgtk_gtk.Gtk` instead of `open Ocgtk_gtk` — brings short class names (`widget`, `button`, `box`) and `Wrappers` module into scope
- `Wrappers.ClassName.new_*` for Layer 1 construction
- `new classname l1_obj` for Layer 2 wrapping
- `(:> widget)` for passing any widget subclass — works because all generated class types inherit `widget_t`
- For interfaces not modeled in the type system (e.g., `Editable` on `Entry`), use `Obj.magic` cast to the interface L1 type

---

## See Also

- **[gir_gen_changes_spec.md](gir_gen_changes_spec.md)** - Complete code generator implementation specification
- **[object_polymorphism_design.md](object_polymorphism_design.md)** - Design rationale and alternatives considered
