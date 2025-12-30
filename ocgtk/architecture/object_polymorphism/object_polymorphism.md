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
box#append (button :> GWidget.widget_skel);

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
- Automatic coercion via `#class_type` syntax
- This is the user-facing API

---

## Class Types and Automatic Coercion

### Class Type Definition

Every hierarchy defines a class type (interface):

```ocaml
(* In gWidget.mli *)
class type widget_skel = object
  method show : unit
  method hide : unit
  method set_visible : bool -> unit
  method as_widget : Widget.t  (* Accessor to Layer 1 *)
  (* ... all widget methods ... *)
end

class widget : Widget.t -> widget_skel
```

### The `#` Syntax

Methods accepting hierarchy types use `#class_type` for automatic coercion:

```ocaml
(* In gBox.mli *)
class type box_skel = object
  inherit widget_skel

  (* Accepts any widget subclass automatically *)
  method append : #widget_skel -> unit
  method prepend : #widget_skel -> unit
end
```

### How It Works

**Generated implementation:**
```ocaml
(* In gBox.ml *)
class box_skel (obj : Box.t) = object (self)
  inherit GWidget.widget_skel (Box.as_widget obj)

  method append : 'a. (#widget_skel as 'a) -> unit =
    fun child ->
      Box.append obj (child#as_widget : Widget.t)

  method prepend : 'a. (#widget_skel as 'a) -> unit =
    fun child ->
      Box.prepend obj (child#as_widget : Widget.t)
end
```

**Key points:**
1. Explicit polymorphism: `'a. (#widget_skel as 'a) -> unit`
2. Internal coercion to Layer 1: `child#as_widget`
3. Users just pass objects directly

---

## Constructor Functions

### Factory Function Pattern

Every class gets factory functions instead of exposing Layer 1 constructors:

```ocaml
(* In gButton.mli *)
class type button_skel = object
  inherit widget_skel
  (* ... button methods ... *)
end

class button : Button.t -> button_skel

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
| Widget | `Widget` | `GWidget` | `widget_skel` | ✅ Implemented |
| EventController | `EventController` | `GController` | `controller_skel` | 🚧 Planned |
| CellRenderer | `CellRenderer` | `GCell` | `cell_renderer_skel` | 🚧 Planned |
| LayoutManager | `LayoutManager` | `GLayout` | `layout_manager_skel` | 🚧 Planned |
| Expression | `Expression` | `GExpression` | `expression_skel` | 🚧 Planned |

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
class type expander_skel = object
  inherit GWidget.widget_skel

  method set_child : #widget_skel option -> unit
  method get_child : unit -> Widget.t option
  method set_label : string option -> unit
  method get_label : unit -> string option
  method set_expanded : bool -> unit
  method get_expanded : unit -> bool
end

class expander : Expander.t -> expander_skel

(* Factory function *)
val expander : ?label:string -> unit -> expander
```

**gExpander.ml:**
```ocaml
class expander_skel (obj : Expander.t) = object (self)
  inherit GWidget.widget_skel (Expander.as_widget obj)

  method as_widget = obj

  method set_child : 'a. (#widget_skel as 'a) option -> unit =
    fun child_opt ->
      let layer1_child = Option.map (fun c -> (c#as_widget : Widget.t)) child_opt in
      Expander.set_child obj layer1_child

  method get_child () = Expander.get_child obj
  method set_label label = Expander.set_label obj label
  method get_label () = Expander.get_label obj
  method set_expanded expanded = Expander.set_expanded obj expanded
  method get_expanded () = Expander.get_expanded obj
end

class expander obj = object
  inherit expander_skel obj
end

let expander ?label () =
  let obj = Expander.new_ () in
  let exp = new expander obj in
  Option.iter (fun v -> exp#set_label (Some v)) label;
  exp
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
- ✅ Basic Layer 2 classes
- 🚧 Class types with `#` syntax
- 🚧 Factory constructors
- 🚧 Automatic coercion in methods

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
