# Automatic Coercion in Generated Classes - Implementation

## Goal

Enable natural usage in Layer 2 where users can pass any compatible subclass without explicit coercion:

```ocaml
let button = new GButton.button (Button.new_ ()) in
let expander = new GExpander.expander (Expander.new_ ()) in
expander#set_child button  (* Works automatically - no :> needed! *)
```

## Solution: Class Types with # Syntax

OCaml's `#class_type` syntax allows automatic subtype coercion. We generate:

1. **Class types** (interfaces) for each hierarchy base
2. **Methods accepting `#class_type`** for automatic coercion
3. **Internal coercion to Layer 1** types for C FFI

### Example

**Generated gWidget.mli:**
```ocaml
(* Class type - defines the interface *)
class type widget_skel = object
  method show : unit
  method hide : unit
  (* ... other widget methods ... *)
end

(* Concrete class *)
class widget : Widget.t -> widget_skel
```

**Generated gExpander.mli:**
```ocaml
class type expander_skel = object
  inherit GWidget.widget_skel
  method set_child : #GWidget.widget_skel option -> unit
  (* ... other expander methods ... *)
end

class expander : Expander.t -> expander_skel
```

**Generated gExpander.ml:**
```ocaml
class expander_skel (obj : Expander.t) = object (self)
  inherit GWidget.widget_skel (Expander.as_widget obj)

  (* Accepts any widget subclass via #widget_skel *)
  method set_child : 'a. (#GWidget.widget_skel as 'a) option -> unit =
    fun child_opt ->
      let layer1_child = Option.map (fun (c : #GWidget.widget_skel) ->
        (* Access the underlying Layer 1 object *)
        (c#as_widget : Widget.t)
      ) child_opt in
      Expander.set_child obj layer1_child

  (* Other methods... *)
end

class expander obj = object
  inherit expander_skel obj
end
```

**Usage:**
```ocaml
let button = new GButton.button (Button.new_ ()) in
let expander = new GExpander.expander (Expander.new_ ()) in
expander#set_child (Some button)  (* Automatic coercion! *)
```

## Architecture

### Layer 1 (C Bindings)
- Keep polymorphic variants: `type t = [`button | `widget] Gobject.obj`
- Provide `as_widget` functions: `val as_widget : t -> Widget.t`

### Layer 2 (OO Classes)
- **Class types** define interfaces
- **Classes** implement interfaces and wrap Layer 1
- **Methods** use `#class_type` for parameters
- **Internal coercion** to Layer 1 via `#as_widget`

## Required Methods in Each Class

Every widget class must provide `as_widget` to access the Layer 1 object:

```ocaml
class widget_skel (obj : Widget.t) = object (self)
  method private obj = obj

  (* Public accessor for Layer 1 type *)
  method as_widget : Widget.t = obj

  (* Widget methods *)
  method show = Widget.show obj
  method hide = Widget.hide obj
end
```

This allows internal coercion:
```ocaml
method set_child (child : #widget_skel option) =
  let layer1_child = Option.map (fun c -> c#as_widget) child_opt in
  Expander.set_child obj layer1_child
```

## Code Generator Changes

### 1. Generate Class Types in .mli

**In `class_gen.ml` - new function:**

```ocaml
let generate_class_type ~ctx ~class_name ~parent_class_type ~methods =
  let buf = Buffer.create 1024 in
  let class_snake = sanitize_name class_name in

  bprintf buf "(* Class type for %s *)\n" class_name;
  bprintf buf "class type %s_skel = object\n" class_snake;

  (* Inherit from parent class type if exists *)
  (match parent_class_type with
   | Some parent_type ->
       bprintf buf "  inherit %s\n" parent_type
   | None -> ());

  (* Generate method signatures *)
  List.iter methods ~f:(fun meth ->
    let method_sig = generate_method_signature_for_class_type ~ctx meth in
    Buffer.add_string buf method_sig
  );

  bprintf buf "end\n\n";
  Buffer.contents buf
```

### 2. Determine Parent Class Type

```ocaml
let parent_class_type ~class_name ~parent_chain =
  match parent_chain with
  | [] -> None
  | parent :: _ ->
      let parent_snake = sanitize_name parent in
      let parent_module = module_name_of_class parent in
      Some (sprintf "G%s.%s_skel" parent_module parent_snake)
```

For example:
- `Button` → parent `Widget` → inherits `GWidget.widget_skel`
- `Expander` → parent `Widget` → inherits `GWidget.widget_skel`

### 3. Generate Method Signatures with # Syntax

```ocaml
let generate_method_signature_for_class_type ~ctx (meth : gir_method) =
  let method_name = ocaml_method_name ~class_name ~c_type meth in

  (* Build parameter types *)
  let param_types = List.map meth.parameters ~f:(fun p ->
    match p.param_type.name with
    | "Widget" ->
        "#GWidget.widget_skel"  (* Use # for automatic coercion *)
    | "EventController" ->
        "#GController.controller_skel"
    | "CellRenderer" ->
        "#GCell.cell_renderer_skel"
    | _ ->
        (* Regular types *)
        ocaml_type_of_gir_type ~ctx p.param_type
  ) in

  (* Handle optional parameters *)
  let param_types = List.map2 meth.parameters param_types ~f:(fun p typ ->
    if p.nullable then typ ^ " option" else typ
  ) in

  let return_type = ocaml_return_type ~ctx meth.return_type in
  let signature = String.concat " -> " (param_types @ [return_type]) in

  sprintf "  method %s : %s\n" method_name signature
```

### 4. Generate Class Implementation with Explicit Polymorphism

When a method accepts a class type parameter, we need explicit polymorphism:

```ocaml
let generate_method_with_class_param ~ctx ~class_name ~meth =
  let method_name = ocaml_method_name ~class_name ~c_type meth in
  let module_name = Utils.module_name_of_class class_name in

  (* Check which parameters need coercion *)
  let params_with_coercion = List.map meth.parameters ~f:(fun p ->
    let param_name = parameter_name p in
    match p.param_type.name with
    | "Widget" ->
        (param_name, Some ("GWidget.widget_skel", "as_widget", "Widget.t"))
    | "EventController" ->
        (param_name, Some ("GController.controller_skel", "as_controller", "EventController.t"))
    | _ ->
        (param_name, None)
  ) in

  let has_class_params = List.exists params_with_coercion ~f:(fun (_, coercion) ->
    coercion <> None
  ) in

  let buf = Buffer.create 256 in

  if has_class_params then begin
    (* Need explicit polymorphism for # syntax *)
    bprintf buf "  method %s : " method_name;

    (* Add type variables for each class parameter *)
    List.iter params_with_coercion ~f:(fun (name, coercion_opt) ->
      match coercion_opt with
      | Some _ -> bprintf buf "'%s. " name
      | None -> ()
    );

    (* Build the type signature *)
    let param_types = List.map params_with_coercion ~f:(fun (name, coercion_opt) ->
      match coercion_opt with
      | Some (class_type, _, _) -> sprintf "(#%s as '%s)" class_type name
      | None -> ocaml_type_of_param ...
    ) in

    bprintf buf "%s = \n" (String.concat " -> " (param_types @ [return_type]));

    (* Method body with coercion *)
    bprintf buf "    fun ";
    List.iter params_with_coercion ~f:(fun (name, _) ->
      bprintf buf "%s " name
    );
    bprintf buf "->\n";

    (* Call Layer 1 with coercions *)
    bprintf buf "      %s.%s obj" module_name method_name;
    List.iter params_with_coercion ~f:(fun (name, coercion_opt) ->
      match coercion_opt with
      | Some (_, accessor, target_type) ->
          bprintf buf " (%s#%s : %s)" name accessor target_type
      | None ->
          bprintf buf " %s" name
    );
    bprintf buf "\n"
  end else begin
    (* Regular method without class parameters *)
    bprintf buf "  method %s" method_name;
    List.iter params_with_coercion ~f:(fun (name, _) ->
      bprintf buf " %s" name
    );
    bprintf buf " = %s.%s obj" module_name method_name;
    List.iter params_with_coercion ~f:(fun (name, _) ->
      bprintf buf " %s" name
    );
    bprintf buf "\n"
  end;

  Buffer.contents buf
```

### 5. Handle Optional Widget Parameters

For `set_child : widget option -> unit`:

```ocaml
method set_child : 'a. (#GWidget.widget_skel as 'a) option -> unit =
  fun child_opt ->
    let layer1_child = Option.map (fun c -> (c#as_widget : Widget.t)) child_opt in
    Expander.set_child obj layer1_child
```

## Hierarchy Mapping Table

Define which Layer 2 class types to use for each GIR type:

```ocaml
type class_type_info = {
  gir_name: string;          (* "Widget" *)
  module_name: string;       (* "GWidget" *)
  class_type: string;        (* "widget_skel" *)
  accessor_method: string;   (* "as_widget" *)
  layer1_type: string;       (* "Widget.t" *)
}

let class_type_hierarchy = [
  {
    gir_name = "Widget";
    module_name = "GWidget";
    class_type = "widget_skel";
    accessor_method = "as_widget";
    layer1_type = "Widget.t";
  };
  {
    gir_name = "EventController";
    module_name = "GController";
    class_type = "controller_skel";
    accessor_method = "as_controller";
    layer1_type = "EventController.t";
  };
  {
    gir_name = "CellRenderer";
    module_name = "GCell";
    class_type = "cell_renderer_skel";
    accessor_method = "as_cellrenderer";
    layer1_type = "CellRenderer.t";
  };
  {
    gir_name = "LayoutManager";
    module_name = "GLayout";
    class_type = "layout_manager_skel";
    accessor_method = "as_layoutmanager";
    layer1_type = "LayoutManager.t";
  };
]

let find_class_type_info gir_type_name =
  List.find_opt (fun info -> info.gir_name = gir_type_name) class_type_hierarchy
```

## Complete Example: Expander

### Input GIR:
```xml
<method name="set_child" c:identifier="gtk_expander_set_child">
  <return-value transfer-ownership="none">
    <type name="none" c:type="void"/>
  </return-value>
  <parameters>
    <instance-parameter name="expander">
      <type name="Expander" c:type="GtkExpander*"/>
    </instance-parameter>
    <parameter name="child" nullable="1">
      <type name="Widget" c:type="GtkWidget*"/>
    </parameter>
  </parameters>
</method>
```

### Generated gExpander.mli:

```ocaml
class type expander_skel = object
  inherit GWidget.widget_skel

  (* Accepts any widget subclass *)
  method set_child : #GWidget.widget_skel option -> unit

  method get_child : unit -> GWidget.widget_skel option
  method get_expanded : unit -> bool
  method set_expanded : bool -> unit
end

class expander : Expander.t -> expander_skel
```

### Generated gExpander.ml:

```ocaml
class expander_skel (obj : Expander.t) = object (self)
  inherit GWidget.widget_skel (Expander.as_widget obj)

  method set_child : 'a. (#GWidget.widget_skel as 'a) option -> unit =
    fun child_opt ->
      let layer1_child = Option.map (fun c -> (c#as_widget : Widget.t)) child_opt in
      Expander.set_child obj layer1_child

  method get_child () =
    match Expander.get_child obj with
    | None -> None
    | Some widget_obj ->
        (* Wrap Layer 1 widget in Layer 2 class *)
        Some (new GWidget.widget widget_obj :> GWidget.widget_skel)

  method get_expanded () = Expander.get_expanded obj

  method set_expanded expanded = Expander.set_expanded obj expanded
end

class expander obj = object
  inherit expander_skel obj
end
```

## Return Type Handling

When a method returns a Widget, wrap it in the Layer 2 class:

```ocaml
method get_child () : GWidget.widget_skel option =
  match Expander.get_child obj with
  | None -> None
  | Some layer1_widget ->
      Some (new GWidget.widget layer1_widget :> GWidget.widget_skel)
```

But this is problematic - we lose the specific type (e.g., if it was a Button, we just get a widget).

**Better approach:** Return the Layer 1 type and let user wrap if needed:

```ocaml
method get_child () : Widget.t option =
  Expander.get_child obj
```

Or provide both:

```ocaml
method get_child_raw () : Widget.t option =
  Expander.get_child obj

method get_child () : GWidget.widget_skel option =
  Option.map (fun w -> new GWidget.widget w :> GWidget.widget_skel) (self#get_child_raw)
```

**Recommendation:** For now, return Layer 1 types to avoid object creation overhead.

## Phase 1 Implementation: Widget Hierarchy Only

Start by adding class types just for Widget:

### Step 1: Add `as_widget` to all widget classes

Ensure every generated widget class has:

```ocaml
class widget_skel (obj : Widget.t) = object (self)
  inherit GObj.widget_impl (Widget.as_widget obj)

  method as_widget : Widget.t = obj  (* Essential for coercion! *)

  (* ... other methods ... *)
end
```

### Step 2: Generate class type in gWidget.mli

Extract method signatures from `widget_skel` into a class type:

```ocaml
class type widget_skel = object
  method show : unit
  method hide : unit
  method as_widget : Widget.t
  (* ... all widget methods ... *)
end
```

### Step 3: Update methods accepting widgets

Change:
```ocaml
method set_parent : Gtk.widget -> unit
```

To:
```ocaml
method set_parent : 'a. (#widget_skel as 'a) -> unit =
  fun parent -> Widget.set_parent obj (parent#as_widget)
```

### Step 4: Update subclasses to inherit class type

In gButton.mli:
```ocaml
class type button_skel = object
  inherit GWidget.widget_skel
  method set_label : string -> unit
  (* ... *)
end
```

## Testing

### Test 1: Basic Widget Parameter

```ocaml
let test_widget_param () =
  let button1 = new GButton.button (Button.new_ ()) in
  let button2 = new GButton.button (Button.new_ ()) in
  let box = new GBox.box (Box.new_ ()) in

  (* Both should work without coercion *)
  box#append button1;
  box#append button2
```

### Test 2: Optional Widget Parameter

```ocaml
let test_optional_widget () =
  let button = new GButton.button (Button.new_ ()) in
  let expander = new GExpander.expander (Expander.new_ ()) in

  (* Should work without coercion *)
  expander#set_child (Some button);
  expander#set_child None
```

### Test 3: Subtype Acceptance

```ocaml
let test_accepts_subtypes () =
  let box = new GBox.box (Box.new_ ()) in

  (* All widgets should work *)
  box#append (new GButton.button (Button.new_ ()));
  box#append (new GLabel.label (Label.new_ ()));
  box#append (new GEntry.entry (Entry.new_ ()));

  (* Even nested containers *)
  let inner_box = new GBox.box (Box.new_ ()) in
  box#append inner_box
```

## Implementation Checklist

- [ ] Add `method as_widget : Widget.t` to all generated widget classes
- [ ] Generate `class type widget_skel` in gWidget.mli
- [ ] Update generator to detect Widget parameters
- [ ] Generate explicit polymorphism for Widget parameters: `'a. (#widget_skel as 'a) ->`
- [ ] Add internal coercion: `parent#as_widget`
- [ ] Handle optional Widget parameters
- [ ] Test with Box, Expander, Window
- [ ] Extend to EventController hierarchy (Phase 2)
- [ ] Extend to CellRenderer hierarchy (Phase 3)

## Benefits

1. **Natural OO API**: `expander#set_child button` - no coercion needed
2. **Type Safety**: Still type-checked, can't pass non-widgets
3. **Automatic Subtyping**: Works with any widget subclass
4. **No Runtime Cost**: Coercions compile to identity functions
5. **Consistent with OO Patterns**: Feels like Java/C++ virtual methods

## Summary

The key insight is using **class types with # syntax**:

```ocaml
method set_child : 'a. (#widget_skel as 'a) option -> unit
```

This allows passing any `widget_skel` subclass without explicit coercion, while internally we access the Layer 1 type via `#as_widget` for C FFI calls.

The generator needs to:
1. Create class types for each hierarchy
2. Use `#class_type` for parameters
3. Add `method as_*` accessors to all classes
4. Generate explicit polymorphism syntax
5. Insert internal coercion to Layer 1 types
