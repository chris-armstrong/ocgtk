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

### User Experience

**What users write:**
```ocaml
(* Create widgets with factory functions *)
let button = GButton.button ~label:"OK" () in
let box = GBox.box ~orientation:`HORIZONTAL () in

(* Pass widgets naturally - automatic coercion *)
box#append button;

(* Works with any widget subclass *)
box#append (GLabel.label ~text:"Status" ());
box#append (GEntry.entry ())
```

**What users DON'T write:**
```ocaml
(* ❌ No Layer 1 exposure *)
let button = new GButton.button (Button.new_with_label "OK") in

(* ❌ No explicit coercion *)
box#append (button :> widget_t);

(* ❌ No accessing underlying objects *)
Widget.set_label (button#as_widget) "New Label"
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
(* Create expander with label *)
let exp = GExpander.expander ~label:"Details" () in

(* Create button *)
let btn = GButton.button ~label:"Click me" () in

(* Set button as child - automatic coercion! *)
exp#set_child (Some btn);

(* Works with any widget *)
exp#set_child (Some (GLabel.label ~text:"Hello" ()));
exp#set_child None;  (* Clear child *)
```

---

## Implementation Status

### Phase 1: Widget Hierarchy (Current)
- ✅ Layer 1 polymorphic variants
- ✅ Layer 2 classes with separate `class type` definitions
- ✅ Class types use plain type names (no `#` — incompatible with class type definitions)
- 🚧 Factory constructors
- 🚧 Coercion helpers for subtype passing

### Phase 2: EventController Hierarchy
- 🚧 Make EventController polymorphic
- 🚧 Create GController module
- 🚧 Handle Gesture intermediate base
- 🚧 Update controller_ops in GObj

### Phase 3: Other Hierarchies
- 🚧 CellRenderer
- 🚧 LayoutManager
- 🚧 Expression

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

**Old pattern:**
```ocaml
let btn = new GButton.button (Button.new_with_label "OK") in
let box = new GBox.box (Box.new_ ()) in
box#append (btn#as_widget)
```

**New pattern:**
```ocaml
let btn = GButton.button ~label:"OK" () in
let box = GBox.box ~orientation:`HORIZONTAL () in
box#append btn
```

### Compatibility

- Old `new GButton.button obj` constructor still works
- Existing code doesn't break
- Can migrate incrementally

---

## See Also

- **[gir_gen_changes_spec.md](gir_gen_changes_spec.md)** - Complete code generator implementation specification
- **[object_polymorphism_design.md](object_polymorphism_design.md)** - Design rationale and alternatives considered
