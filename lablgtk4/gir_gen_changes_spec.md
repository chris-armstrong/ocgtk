# GIR Generator Changes Specification

## Overview

This document specifies all changes needed to the GIR code generator to support:
1. Class types with `#` syntax for automatic coercion
2. Constructor functions in Layer 2
3. Full object polymorphism across hierarchies

## Architecture Reminder

**Layer 1** (`entry.ml`, `widget.ml`): C bindings, polymorphic variants
**Layer 2** (`gEntry.ml`, `gWidget.ml`): OO classes, natural API

## Changes to `gir_gen` Modules

### 1. `types.ml` - Type Definitions

#### Add Hierarchy Classification

```ocaml
(* New type for hierarchy classification *)
type hierarchy_kind =
  | WidgetHierarchy
  | EventControllerHierarchy
  | CellRendererHierarchy
  | LayoutManagerHierarchy
  | ExpressionHierarchy
  | MonomorphicType

type hierarchy_info = {
  kind: hierarchy_kind;
  gir_root: string;           (* "Widget", "EventController", etc. *)
  layer2_module: string;       (* "GWidget", "GController", etc. *)
  class_type_name: string;     (* "widget_skel", "controller_skel", etc. *)
  accessor_method: string;     (* "as_widget", "as_controller", etc. *)
  layer1_base_type: string;    (* "Widget.t", "EventController.t", etc. *)
}
```

#### Update Context Type

```ocaml
type generation_context = {
  (* ... existing fields ... *)

  (* NEW: Hierarchy mapping *)
  hierarchy_map: (string, hierarchy_info) Hashtbl.t;
}
```

### 2. `hierarchy_detection.ml` - NEW MODULE

Create a new module to detect and classify hierarchies:

```ocaml
(* hierarchy_detection.ml *)

open Types

(* Hierarchy configuration *)
let hierarchy_definitions = [
  {
    kind = WidgetHierarchy;
    gir_root = "Widget";
    layer2_module = "GWidget";
    class_type_name = "widget_skel";
    accessor_method = "as_widget";
    layer1_base_type = "Widget.t";
  };
  {
    kind = EventControllerHierarchy;
    gir_root = "EventController";
    layer2_module = "GController";
    class_type_name = "controller_skel";
    accessor_method = "as_controller";
    layer1_base_type = "EventController.t";
  };
  {
    kind = CellRendererHierarchy;
    gir_root = "CellRenderer";
    layer2_module = "GCell";
    class_type_name = "cell_renderer_skel";
    accessor_method = "as_cellrenderer";
    layer1_base_type = "CellRenderer.t";
  };
  {
    kind = LayoutManagerHierarchy;
    gir_root = "LayoutManager";
    layer2_module = "GLayout";
    class_type_name = "layout_manager_skel";
    accessor_method = "as_layoutmanager";
    layer1_base_type = "LayoutManager.t";
  };
  {
    kind = ExpressionHierarchy;
    gir_root = "Expression";
    layer2_module = "GExpression";
    class_type_name = "expression_skel";
    accessor_method = "as_expression";
    layer1_base_type = "Expression.t";
  };
]

(* Build hierarchy map from definitions *)
let build_hierarchy_map () =
  let map = Hashtbl.create 10 in
  List.iter (fun info ->
    Hashtbl.add map info.gir_root info
  ) hierarchy_definitions;
  map

(* Find which hierarchy a class belongs to *)
let classify_class ~class_name ~parent_chain =
  let rec find_root = function
    | [] -> None
    | parent :: rest ->
        match Hashtbl.find_opt hierarchy_map parent with
        | Some info -> Some info
        | None -> find_root rest
  in
  (* Check if class itself is a root *)
  match Hashtbl.find_opt hierarchy_map class_name with
  | Some info -> Some info
  | None -> find_root parent_chain

(* Check if a GIR type name is a hierarchy type *)
let is_hierarchy_type ~ctx type_name =
  Hashtbl.mem ctx.hierarchy_map type_name

(* Get hierarchy info for a type *)
let get_hierarchy_info ~ctx type_name =
  Hashtbl.find_opt ctx.hierarchy_map type_name
```

### 3. `class_gen.ml` - Major Changes

#### 3.1 Add Class Type Generation

```ocaml
(* Generate class type (interface) for a class *)
let generate_class_type ~ctx ~class_name ~parent_chain ~methods ~properties =
  let buf = Buffer.create 1024 in
  let class_snake = sanitize_name class_name in

  (* Determine parent class type *)
  let parent_class_type = match parent_chain with
    | [] -> None
    | parent :: _ ->
        match classify_class ~class_name:parent ~parent_chain:(List.tl parent_chain) with
        | Some hier_info ->
            Some (sprintf "%s.%s" hier_info.layer2_module hier_info.class_type_name)
        | None -> None
  in

  bprintf buf "(* Class type for %s *)\n" class_name;
  bprintf buf "class type %s_skel = object\n" class_snake;

  (* Inherit from parent if exists *)
  (match parent_class_type with
   | Some parent_type ->
       bprintf buf "  inherit %s\n\n" parent_type
   | None -> ());

  (* Method signatures *)
  let _, method_code = List.fold_left methods ~init:(StringSet.empty, "") ~f:(fun (seen, acc) meth ->
    let sig_code, seen' = generate_method_signature_for_class_type ~ctx ~class_name ~seen meth in
    (seen', acc ^ sig_code)
  ) in

  Buffer.add_string buf method_code;

  bprintf buf "end\n\n";
  Buffer.contents buf

(* Generate method signature for class type *)
let generate_method_signature_for_class_type ~ctx ~class_name ~seen (meth : gir_method) =
  let ocaml_name = ocaml_method_name ~class_name ~c_type meth in

  if StringSet.mem ocaml_name seen then
    ("", seen)
  else
    (* Build parameter types with hierarchy detection *)
    let param_types = List.map meth.parameters ~f:(fun p ->
      match get_hierarchy_info ~ctx p.param_type.name with
      | Some hier_info ->
          (* Use # syntax for hierarchy types *)
          sprintf "#%s.%s" hier_info.layer2_module hier_info.class_type_name
      | None ->
          (* Regular type *)
          ocaml_type_of_gir_type ~ctx p.param_type
    ) in

    (* Handle nullability *)
    let param_types = List.map2 meth.parameters param_types ~f:(fun p typ ->
      if p.nullable then typ ^ " option" else typ
    ) in

    let return_type =
      if String.lowercase_ascii meth.return_type.c_type = "void" then
        "unit"
      else
        ocaml_type_of_gir_type ~ctx meth.return_type
    in

    let params_with_unit = if List.length param_types = 0 then ["unit"] else param_types in
    let signature = String.concat " -> " (params_with_unit @ [return_type]) in

    let seen' = StringSet.add ocaml_name seen in
    (sprintf "  method %s : %s\n" ocaml_name signature, seen')
```

#### 3.2 Update Method Generation for Explicit Polymorphism

```ocaml
(* Generate method implementation with automatic coercion *)
let generate_method_impl ~ctx ~class_name ~c_type ~seen (meth : gir_method) =
  let ocaml_name = ocaml_method_name ~class_name ~c_type meth in
  let module_name = Utils.module_name_of_class class_name in

  if StringSet.mem ocaml_name seen then
    ("", seen)
  else
    let buf = Buffer.create 256 in

    (* Detect hierarchy parameters *)
    let params_with_info = List.map meth.parameters ~f:(fun p ->
      let param_name = parameter_name p in
      let hier_info = get_hierarchy_info ~ctx p.param_type.name in
      (param_name, p, hier_info)
    ) in

    let has_hierarchy_params = List.exists params_with_info ~f:(fun (_, _, hier_opt) ->
      hier_opt <> None
    ) in

    if has_hierarchy_params then begin
      (* Need explicit polymorphism *)
      bprintf buf "  method %s : " ocaml_name;

      (* Type variables *)
      List.iter params_with_info ~f:(fun (name, _, hier_opt) ->
        match hier_opt with
        | Some _ -> bprintf buf "'%s. " name
        | None -> ()
      );

      (* Type signature *)
      let param_type_strings = List.map params_with_info ~f:(fun (name, p, hier_opt) ->
        match hier_opt with
        | Some hier ->
            let class_type = sprintf "#%s.%s" hier.layer2_module hier.class_type_name in
            if p.nullable then
              sprintf "(%s as '%s) option" class_type name
            else
              sprintf "(%s as '%s)" class_type name
        | None ->
            ocaml_type_of_gir_type ~ctx p.param_type
      ) in

      let return_type_str =
        if String.lowercase_ascii meth.return_type.c_type = "void" then "unit"
        else ocaml_type_of_gir_type ~ctx meth.return_type
      in

      let params_for_sig = if List.length param_type_strings = 0 then ["unit"] else param_type_strings in
      let full_sig = String.concat " -> " (params_for_sig @ [return_type_str]) in
      bprintf buf "%s =\n" full_sig;

      (* Function body *)
      bprintf buf "    fun ";
      List.iter params_with_info ~f:(fun (name, _, _) ->
        bprintf buf "%s " name
      );
      bprintf buf "->\n";

      (* Call Layer 1 with coercions *)
      bprintf buf "      %s.%s obj" module_name ocaml_name;

      List.iter params_with_info ~f:(fun (name, p, hier_opt) ->
        match hier_opt with
        | Some hier ->
            if p.nullable then
              bprintf buf " (Option.map (fun c -> (c#%s : %s)) %s)"
                hier.accessor_method hier.layer1_base_type name
            else
              bprintf buf " (%s#%s : %s)"
                name hier.accessor_method hier.layer1_base_type
        | None ->
            bprintf buf " %s" name
      );

      bprintf buf "\n\n"
    end else begin
      (* Regular method without hierarchy parameters *)
      bprintf buf "  method %s" ocaml_name;
      List.iter params_with_info ~f:(fun (name, _, _) ->
        bprintf buf " %s" name
      );
      bprintf buf " = %s.%s obj" module_name ocaml_name;
      List.iter params_with_info ~f:(fun (name, _, _) ->
        bprintf buf " %s" name
      );
      bprintf buf "\n\n"
    end;

    (Buffer.contents buf, StringSet.add ocaml_name seen)
```

#### 3.3 Add Constructor Generation

```ocaml
(* Generate factory functions for constructors *)
let generate_constructors ~ctx ~class_name ~constructors ~properties =
  let buf = Buffer.create 512 in
  let class_snake = sanitize_name class_name in
  let module_name = Utils.module_name_of_class class_name in

  (* Sort - default constructor first *)
  let sorted_ctors = List.sort (fun c1 c2 ->
    let is_default c =
      c.ctor_name = "new" || c.ctor_name = "new_" ||
      String.ends_with c.c_identifier "_new"
    in
    match is_default c1, is_default c2 with
    | true, false -> -1
    | false, true -> 1
    | _ -> String.compare c1.ctor_name c2.ctor_name
  ) constructors in

  match sorted_ctors with
  | [] ->
      (* No explicit constructors - generate basic one *)
      bprintf buf "(* Constructor *)\n";
      bprintf buf "let %s () = new %s (%s.new_ ())\n\n"
        class_snake class_snake module_name

  | default_ctor :: rest_ctors ->
      (* Primary constructor with property initialization *)
      generate_primary_constructor buf ~ctx ~class_name ~class_snake ~module_name
        ~ctor:default_ctor ~properties;

      (* Named constructors for alternates *)
      List.iter (fun ctor ->
        generate_named_constructor buf ~ctx ~class_name ~class_snake ~module_name ~ctor
      ) rest_ctors;

  Buffer.contents buf

(* Generate primary constructor with optional properties *)
let generate_primary_constructor buf ~ctx ~class_name ~class_snake ~module_name ~ctor ~properties =
  (* Select common writable properties for optional params *)
  let opt_properties =
    properties
    |> List.filter ~f:(fun p -> p.writable && not p.construct_only)
    |> List.filter ~f:(fun p -> has_simple_type ~ctx p.prop_type)
    |> List.take 5  (* Limit to avoid too many params *)
  in

  bprintf buf "(* Primary constructor *)\n";
  bprintf buf "let %s" class_snake;

  (* Optional property parameters *)
  List.iter opt_properties ~f:(fun prop ->
    bprintf buf " ?%s" (sanitize_property_name prop.prop_name)
  );

  (* Required constructor parameters *)
  List.iter ctor.ctor_parameters ~f:(fun p ->
    bprintf buf " ~%s" (parameter_name p)
  );

  bprintf buf " () =\n";

  (* Create Layer 1 object *)
  bprintf buf "  let obj = %s.%s" module_name ctor.ctor_name;
  if List.length ctor.ctor_parameters > 0 then begin
    List.iter ctor.ctor_parameters ~f:(fun p ->
      bprintf buf " %s" (parameter_name p)
    );
  end;
  bprintf buf " in\n";

  (* Create class instance *)
  bprintf buf "  let instance = new %s obj in\n" class_snake;

  (* Set optional properties *)
  List.iter opt_properties ~f:(fun prop ->
    let prop_snake = sanitize_property_name prop.prop_name in
    bprintf buf "  Option.iter (fun v -> instance#set_%s v) %s;\n" prop_snake prop_snake
  );

  bprintf buf "  instance\n\n"

(* Generate named constructor *)
let generate_named_constructor buf ~ctx ~class_name ~class_snake ~module_name ~ctor =
  (* Convert constructor name: new_with_label -> button_with_label *)
  let ctor_suffix =
    let ctor_snake = sanitize_name ctor.ctor_name in
    if String.starts_with ctor_snake "new_" then
      String.sub ctor_snake 4 (String.length ctor_snake - 4)
    else if ctor_snake = "new" then
      ""  (* Skip if just "new" *)
    else
      ctor_snake
  in

  if ctor_suffix = "" then
    ()  (* Don't generate duplicate *)
  else begin
    let factory_name = sprintf "%s_%s" class_snake ctor_suffix in

    bprintf buf "(* Named constructor: %s *)\n" factory_name;
    bprintf buf "let %s" factory_name;

    (* Parameters *)
    List.iter ctor.ctor_parameters ~f:(fun p ->
      bprintf buf " %s" (parameter_name p)
    );

    bprintf buf " =\n";
    bprintf buf "  new %s (%s.%s" class_snake module_name ctor.ctor_name;

    List.iter ctor.ctor_parameters ~f:(fun p ->
      bprintf buf " %s" (parameter_name p)
    );

    bprintf buf ")\n\n"
  end
```

#### 3.4 Add Accessor Method Generation

```ocaml
(* Generate as_* accessor method *)
let generate_accessor_method ~ctx ~class_name ~parent_chain =
  match classify_class ~class_name ~parent_chain with
  | Some hier_info ->
      sprintf "  method %s : %s = obj\n\n"
        hier_info.accessor_method
        hier_info.layer1_base_type
  | None ->
      ""  (* Not a hierarchy type *)
```

#### 3.5 Update Main Generation Function

```ocaml
let generate_class_module ~ctx ~class_name ~c_type ~parent_chain ~methods ~properties ~signals ~constructors =
  let buf = Buffer.create 4096 in
  let class_snake = sanitize_name class_name in
  let module_name = Utils.module_name_of_class class_name in

  (* 1. Generate class type (.mli) *)
  let class_type_code = generate_class_type ~ctx ~class_name ~parent_chain ~methods ~properties in

  (* 2. Generate class implementation *)
  bprintf buf "(* %s class implementation *)\n\n" class_name;

  bprintf buf "class %s_skel (obj : %s.t) = object (self)\n" class_snake module_name;

  (* Inherit from parent if widget hierarchy *)
  let parent_inherit = match parent_chain with
    | [] -> None
    | parent :: _ ->
        match classify_class ~class_name:parent ~parent_chain:(List.tl parent_chain) with
        | Some hier_info ->
            Some (sprintf "  inherit %s.%s_skel (%s.as_%s obj)\n"
              hier_info.layer2_module
              (sanitize_name parent)
              module_name
              (String.lowercase_ascii parent))
        | None -> None
  in

  Option.iter (fun code -> Buffer.add_string buf code) parent_inherit;

  (* Accessor method *)
  let accessor_code = generate_accessor_method ~ctx ~class_name ~parent_chain in
  Buffer.add_string buf accessor_code;

  (* Signal connection helper if signals exist *)
  if List.length signals > 0 then begin
    bprintf buf "  method connect = new %s_signals.%s_signals obj\n\n"
      (sanitize_name class_name) class_snake
  end;

  (* Generate methods *)
  let _, method_impls = List.fold_left methods ~init:(StringSet.empty, "") ~f:(fun (seen, acc) meth ->
    let code, seen' = generate_method_impl ~ctx ~class_name ~c_type ~seen meth in
    (seen', acc ^ code)
  ) in

  Buffer.add_string buf method_impls;

  bprintf buf "end\n\n";

  (* Concrete class *)
  bprintf buf "class %s obj = object\n" class_snake;
  bprintf buf "  inherit %s_skel obj\n" class_snake;
  bprintf buf "end\n\n";

  (* 3. Generate constructors *)
  let constructor_code = generate_constructors ~ctx ~class_name ~constructors ~properties in
  Buffer.add_string buf constructor_code;

  (* Return both .mli and .ml content *)
  (class_type_code, Buffer.contents buf)
```

### 4. `ml_interface.ml` - Layer 1 Changes

Keep Layer 1 generation mostly the same, but ensure:

1. **Polymorphic variants** for hierarchy types
2. **`as_*` functions** for coercion

```ocaml
(* Ensure as_widget function is generated *)
let generate_as_widget_function ~class_name =
  match classify_class ~class_name ~parent_chain with
  | Some hier_info when hier_info.gir_root <> class_name ->
      (* Not the root itself, so generate coercion *)
      sprintf "let as_%s (obj : t) : %s = (obj :> %s)\n\n"
        (String.lowercase_ascii hier_info.gir_root)
        hier_info.layer1_base_type
        hier_info.layer1_base_type
  | _ -> ""
```

### 5. `main.ml` - Entry Point Changes

Initialize hierarchy map in context:

```ocaml
let run_generation gir_file output_dir =
  (* Parse GIR *)
  let parsed_data = Gir_parser.parse_gir_file gir_file in

  (* Build context with hierarchy map *)
  let hierarchy_map = Hierarchy_detection.build_hierarchy_map () in

  let ctx = {
    classes = parsed_data.classes;
    enums = parsed_data.enums;
    bitfields = parsed_data.bitfields;
    records = parsed_data.records;
    hierarchy_map = hierarchy_map;
  } in

  (* Generate Layer 1 (ml_interface.ml) *)
  List.iter (fun cls ->
    let layer1_code = Ml_interface.generate_ml_interface ~ctx ~class_name:cls.name ... in
    write_file (Filename.concat output_dir (sprintf "%s.ml" (to_snake_case cls.name))) layer1_code;
  ) ctx.classes;

  (* Generate Layer 2 (class_gen.ml) *)
  List.iter (fun cls ->
    let (mli_code, ml_code) = Class_gen.generate_class_module ~ctx ~class_name:cls.name ... in
    write_file (Filename.concat output_dir (sprintf "g%s.mli" (Utils.module_name_of_class cls.name))) mli_code;
    write_file (Filename.concat output_dir (sprintf "g%s.ml" (Utils.module_name_of_class cls.name))) ml_code;
  ) ctx.classes
```

## File Structure Changes

### New Files to Create

1. **`src/tools/gir_gen/hierarchy_detection.ml`** - Hierarchy classification
2. **`src/tools/gir_gen/hierarchy_detection.mli`** - Interface

### Modified Files

1. **`src/tools/gir_gen/types.ml`** - Add hierarchy types
2. **`src/tools/gir_gen/generate/class_gen.ml`** - Major rewrite
3. **`src/tools/gir_gen/generate/class_gen.mli`** - Updated signatures
4. **`src/tools/gir_gen/generate/ml_interface.ml`** - Minor updates
5. **`src/tools/gir_gen/main.ml`** - Context initialization

## Testing Strategy

### Unit Tests

Create `test/test_hierarchy_detection.ml`:

```ocaml
let test_classify_widget () =
  let info = classify_class ~class_name:"Button" ~parent_chain:["Widget"] in
  assert (info.kind = WidgetHierarchy);
  assert (info.layer2_module = "GWidget")

let test_classify_controller () =
  let info = classify_class ~class_name:"GestureClick" ~parent_chain:["Gesture"; "EventController"] in
  assert (info.kind = EventControllerHierarchy)
```

### Integration Tests

Create `test/test_generated_code.ml`:

```ocaml
let test_button_factory () =
  let btn = GButton.button ~label:"Test" () in
  assert (btn#get_label () = "Test")

let test_widget_parameter () =
  let btn = GButton.button () in
  let box = GBox.box ~orientation:`HORIZONTAL () in
  box#append btn;  (* Should compile without coercion *)
  assert true
```

## Migration Path

### Phase 1: Layer 1 Polymorphic Variants (Already Done)
- [x] Widget hierarchy uses variants
- [x] Basic type safety

### Phase 2: Add Class Types
- [ ] Generate class types for Widget hierarchy
- [ ] Update method signatures to use `#widget_skel`
- [ ] Test compilation

### Phase 3: Add Constructors
- [ ] Generate factory functions
- [ ] Generate named constructors
- [ ] Test usage

### Phase 4: Extend to Other Hierarchies
- [ ] EventController
- [ ] CellRenderer
- [ ] LayoutManager
- [ ] Expression

## Summary

**Key Changes:**

1. **New module**: `hierarchy_detection.ml` - classifies types into hierarchies
2. **Class types**: Generate `class type widget_skel = object ... end`
3. **`#` syntax**: Use `#widget_skel` in parameters for automatic coercion
4. **Accessors**: Generate `method as_widget : Widget.t` in all classes
5. **Constructors**: Generate factory functions like `let button ~label () = ...`
6. **Explicit polymorphism**: Use `'a. (#widget_skel as 'a) -> unit` for methods

**Benefits:**

- Natural OO API for users
- Type-safe hierarchy coercion
- No Layer 1 exposure
- Consistent with OO patterns in other languages
