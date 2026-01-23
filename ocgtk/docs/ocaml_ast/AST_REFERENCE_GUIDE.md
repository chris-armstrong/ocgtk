# OCaml AST Reference for ppxlib 0.37.0 - Layer 2 Class Patterns

This guide shows how OCaml Layer 2 class code patterns map to AST structures using ppxlib 0.37.0.
Use this as a reference when writing AST validation tests.

## Quick Reference: Core Type Patterns

### Hierarchy Type: `#GWidget.widget`
```ocaml
(* OCaml syntax *)
method set_focus (w : #GWidget.widget) = ...

(* AST pattern *)
Ppat_constraint
  pattern: Ppat_var "w"
  core_type:
    Ptyp_class "GWidget.widget"  (* Note: Ptyp_class, NOT Ptyp_constr *)
    []
```

### Nullable Type: `string option`
```ocaml
(* OCaml syntax *)
method set_label (text : string option) = ...

(* AST pattern *)
Ppat_constraint
  pattern: Ppat_var "text"
  core_type:
    Ptyp_constr "option"
    [
      Ptyp_constr "string" []
    ]
```

### Structural Type with Method: `<as_widget: Widget.t; ..>`
```ocaml
(* OCaml syntax *)
method set_child (w : <as_widget: Widget.t; ..>) = ...

(* AST pattern *)
Ppat_constraint
  pattern: Ppat_var "w"
  core_type:
    Ptyp_object
      fields: [
        Otag "as_widget"
          Ptyp_constr "Widget.t" []
      ]
      closed: Open  (* ".." means Open *)
```

### Polymorphic Method: `'b. ('a -> 'b) -> 'b generic`
```ocaml
(* OCaml syntax *)
method map : 'b. ('a -> 'b) -> 'b generic = ...

(* AST pattern *)
Pexp_poly
  expression: <method body>
  Some (
    Ptyp_poly ['b']  (* Universally quantified type variable *)
      Ptyp_arrow
        Nolabel
        Ptyp_arrow
          Nolabel
          Ptyp_var "'a"
          Ptyp_var "'b"
        Ptyp_constr "generic" [Ptyp_var "'b"]
  )
```

### Result Type: `(string, GError.t) result`
```ocaml
(* OCaml syntax *)
method get_file : (string, GError.t) result = ...

(* AST pattern *)
Some (
  Ptyp_constr "result"
  [
    Ptyp_constr "string" []
    Ptyp_constr "GError.t" []
  ]
)
```

## Class Structure Patterns

### Basic Class with Method
```ocaml
class button obj = object
  method set_focus (w : #GWidget.widget) = ...
end
```

**AST Structure:**
```
Pstr_class
  [class_declaration
    pci_name = "button"
    pci_expr =
      Pcl_fun                        (* Parameter before object *)
        Nolabel
        None
        Ppat_var "obj"               (* Class parameter *)
        Pcl_structure
          class_structure
            Ppat_any                 (* Self pattern (ghost) *)
            [class_field
              Pcf_method Public
                "set_focus"
                Concrete Fresh
                Pexp_poly            (* Method wrapped in Pexp_poly *)
                  Pexp_function      (* Method is a function *)
                    [Pparam_val ...]
                  None               (* No explicit type annotation *)
            ]
  ]
```

### Class with Type-Annotated Method
```ocaml
class container obj = object
  method get_child : widget = new widget (GContainer.get_child obj)
end
```

**AST Structure:**
```
Pcf_method Public
  "get_child"
  Concrete Fresh
  Pexp_poly
    <method body expression>
    Some (                          (* Type annotation present *)
      Ptyp_constr "widget" []
    )
```

**Key insight**: When a method has an explicit type annotation (`: widget`), 
the `Pexp_poly` has `Some core_type`, otherwise `None`.

### Class with Inheritance
```ocaml
class button_with_signals obj = object
  inherit GWidget.widget_skel obj
  inherit GButton_signals.button_signals obj
end
```

**AST Structure:**
```
Pcl_structure
  class_structure
    Ppat_any
    [
      class_field
        Pcf_inherit
          class_expr:
            Pcl_apply                    (* Applied to obj parameter *)
              Pcl_constr "GWidget.widget_skel" []
              [Nolabel, Pexp_ident "obj"]
          None                           (* No override *)
      
      class_field
        Pcf_inherit
          class_expr:
            Pcl_apply
              Pcl_constr "GButton_signals.button_signals" []
              [Nolabel, Pexp_ident "obj"]
          None
    ]
```

## How to Extract Type Information from AST

### 1. Find Class Declaration
```ocaml
let find_class_declaration ast class_name =
  List.find_map (fun item ->
    match item.pstr_desc with
    | Pstr_class class_decls ->
        List.find_opt (fun cd -> cd.pci_name.txt = class_name) class_decls
    | _ -> None
  ) ast
```

### 2. Extract Inherit Clauses
```ocaml
let rec get_class_inherit_clauses class_expr =
  match class_expr.pcl_desc with
  | Pcl_structure { pcstr_fields; _ } ->
      List.filter_map (fun cf ->
        match cf.pcf_desc with
        | Pcf_inherit (_, ce, _) ->
            (* Extract the inherited class name from Pcl_constr or Pcl_apply *)
            (match ce.pcl_desc with
             | Pcl_constr (lid, _) -> Some (Longident.flatten_exn lid.txt |> String.concat ".")
             | Pcl_apply (func, _) ->
                 (match func.pcl_desc with
                  | Pcl_constr (lid, _) -> Some (Longident.flatten_exn lid.txt |> String.concat ".")
                  | _ -> None)
             | _ -> None)
        | _ -> None
      ) pcstr_fields
  | Pcl_fun (_, _, _, body) -> get_class_inherit_clauses body
  | _ -> []
```

### 3. Find Method in Class
```ocaml
let rec find_method_in_class class_expr method_name =
  match class_expr.pcl_desc with
  | Pcl_structure { pcstr_fields; _ } ->
      List.find_opt (fun cf ->
        match cf.pcf_desc with
        | Pcf_method (name, _, _) -> name.txt = method_name
        | _ -> false
      ) pcstr_fields
  | Pcl_fun (_, _, _, body) -> find_method_in_class body method_name
  | _ -> None
```

### 4. Extract Method Type
```ocaml
let get_method_type class_field =
  match class_field.pcf_desc with
  | Pcf_method (_, _, Cfk_virtual ct) -> Some ct
  | Pcf_method (_, _, Cfk_concrete (_, expr)) ->
      (match expr.pexp_desc with
       | Pexp_poly (_, Some ct) -> Some ct  (* Explicit type annotation *)
       | Pexp_poly (_, None) -> None        (* No type annotation *)
       | _ -> None)
  | _ -> None
```

### 5. Check for Hierarchy Type in Parameters
```ocaml
let rec has_hierarchy_parameter class_field =
  match class_field.pcf_desc with
  | Pcf_method (_, _, Cfk_concrete (_, expr)) ->
      (match expr.pexp_desc with
       | Pexp_poly (Pexp_function params, _) ->
           List.exists (fun param ->
             match param with
             | Pparam_val (_, _, Ppat_constraint (_, ct)) ->
                 (match ct.ptyp_desc with
                  | Ptyp_class _ -> true  (* This is a hierarchy type! *)
                  | _ -> false)
             | _ -> false
           ) params
       | _ -> false)
  | _ -> false
```

## Common Validation Patterns

### Validate Class Has Method
```ocaml
let assert_class_has_method ast class_name method_name =
  match find_class_declaration ast class_name with
  | None -> Alcotest.fail (Printf.sprintf "Class %s not found" class_name)
  | Some cd ->
      match find_method_in_class cd.pci_expr method_name with
      | None -> Alcotest.fail (Printf.sprintf "Method %s not found in class %s" method_name class_name)
      | Some _ -> ()  (* Success *)
```

### Validate Method Has Hierarchy Parameter
```ocaml
let assert_method_has_hierarchy_param ast class_name method_name =
  match find_class_declaration ast class_name with
  | None -> Alcotest.fail (Printf.sprintf "Class %s not found" class_name)
  | Some cd ->
      match find_method_in_class cd.pci_expr method_name with
      | None -> Alcotest.fail (Printf.sprintf "Method %s not found" method_name)
      | Some cf ->
          if not (has_hierarchy_parameter cf) then
            Alcotest.fail (Printf.sprintf "Method %s does not have hierarchy parameter" method_name)
```

### Validate Class Inherits From Parent
```ocaml
let assert_class_inherits ast class_name parent_class =
  match find_class_declaration ast class_name with
  | None -> Alcotest.fail (Printf.sprintf "Class %s not found" class_name)
  | Some cd ->
      let inherits = get_class_inherit_clauses cd.pci_expr in
      if not (List.exists (fun name -> name = parent_class) inherits) then
        Alcotest.fail (Printf.sprintf "Class %s does not inherit from %s. Found: [%s]"
          class_name parent_class (String.concat "; " inherits))
```

## Testing Tips

1. **Parse once, validate multiple aspects**: Parse the generated code once with `Ml_ast_helpers.parse_implementation`, then perform multiple AST-based validations

2. **Fallback to string matching for debug**: If AST validation fails, use `core_type_to_string` to print the type and debug what you're actually getting

3. **Handle nested structures**: Classes are often wrapped in `Pcl_fun` for parameters. Always traverse recursively.

4. **Ghost nodes**: The compiler inserts "ghost" nodes (like `Ppat_any` for self). These are marked with the `.ghost` flag.

5. **Hierarchy types use `Ptyp_class`**: The `#widget` syntax maps to `Ptyp_class`, NOT `Ptyp_constr`!

# Layer 1 Generated Code Patterns

Layer 1 consists of the generated widget modules (e.g., `box.ml`, `button.ml`, `label.ml`). These follow consistent patterns that can be validated using AST inspection.

## Quick Reference: Layer 1 Type Patterns

### Widget Type Definition
```ocaml
(* OCaml syntax *)
type t = [`box | `widget | `initially_unowned] Gobject.obj

(* AST pattern *)
Pstr_type (rec, [
  {ptype_name = {txt = "t"; loc = _};
   ptype_params = [];
   ptype_cstrs = [];
   ptype_kind = 
     Ptyp_variant (
       [{prf_desc = Rtag ({txt = "box"; loc = _}, true, []);
         prf_loc = _; prf_attributes = []};
        {prf_desc = Rtag ({txt = "widget"; loc = _}, true, []);
         prf_loc = _; prf_attributes = []};
        {prf_desc = Rtag ({txt = "initially_unowned"; loc = _}, true, []);
         prf_loc = _; prf_attributes = []}],
       Closed, None);
   ptype_private = Private;
   ptype_manifest = 
     Some (Ptyp_constr ({txt = Ldot (Lident "Gobject", "obj"); loc = _}, []));
   ptype_loc = _; ptype_attributes = []}
])
```

### as_widget Function
```ocaml
(* OCaml syntax *)
let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(* AST pattern *)
Pstr_value (Nonrecursive, [
  {pvb_pat = 
     {ppat_desc = Ppat_var {txt = "as_widget"; loc = _};
      ppat_loc = _; ppat_attributes = []};
   pvb_expr = 
     {pexp_desc = Pexp_fun 
        (Nolabel, None,
         {ppat_desc = Ppat_constraint 
            ({ppat_desc = Ppat_var {txt = "obj"; loc = _};
              ppat_loc = _; ppat_attributes = []},
             {ptyp_desc = Ptyp_constr ({txt = Lident "t"; loc = _}, []);
              ptyp_loc = _; ptyp_attributes = []});
          ppat_loc = _; ppat_attributes = []},
         {pexp_desc = Pexp_constraint 
            ({pexp_desc = Pexp_apply 
               ({pexp_desc = Pexp_ident {txt = Lident "Obj.magic"; loc = _};
                 pexp_loc = _; pexp_attributes = []},
                [(Nolabel, 
                  {pexp_desc = Pexp_ident {txt = Lident "obj"; loc = _};
                   pexp_loc = _; pexp_attributes = []})]);
              pexp_loc = _; pexp_attributes = []},
             {ptyp_desc = Ptyp_constr 
                ({txt = Ldot 
                   (Ldot 
                      (Ldot 
                         (Ldot 
                            (Ldot 
                               (Ldot 
                                  (Ldot 
                                     (Ldot 
                                        (Ldot 
                                           (Ldot 
                                              (Lident "Event_controller", "layout_child"),
                                             "layout_manager"),
                                            "root"),
                                           "widget"),
                                          "Widget"),
                                         "t");
                ptyp_loc = _; ptyp_attributes = []});
          pexp_loc = _; pexp_attributes = []});
   pvb_attributes = []}
])
```

## Quick Reference: Layer 1 External Patterns

### Simple External Constructor
```ocaml
(* OCaml syntax *)
external new_ : unit -> t = "ml_gtk_button_new"

(* AST pattern *)
Pstr_primitive (
  {pval_name = {txt = "new_"; loc = _};
   pval_type = 
     {ptyp_desc = Ptyp_arrow (Nolabel, 
        {ptyp_desc = Ptyp_constr ({txt = Lident "unit"; loc = _}, []);
         ptyp_loc = _; ptyp_attributes = []},
        {ptyp_desc = Ptyp_constr ({txt = Lident "t"; loc = _}, []);
         ptyp_loc = _; ptyp_attributes = []});
      ptyp_loc = _; ptyp_attributes = []};
   pval_prim = ["ml_gtk_button_new"];
   pval_attributes = []}
)
```

### External with Parameters
```ocaml
(* OCaml syntax *)
external set_spacing : t -> int -> unit = "ml_gtk_box_set_spacing"

(* AST pattern *)
Pstr_primitive (
  {pval_name = {txt = "set_spacing"; loc = _};
   pval_type = 
     {ptyp_desc = Ptyp_arrow (Nolabel,
        {ptyp_desc = Ptyp_constr ({txt = Lident "t"; loc = _}, []);
         ptyp_loc = _; ptyp_attributes = []},
        {ptyp_desc = Ptyp_arrow (Nolabel,
           {ptyp_desc = Ptyp_constr ({txt = Lident "int"; loc = _}, []);
            ptyp_loc = _; ptyp_attributes = []},
           {ptyp_desc = Ptyp_constr ({txt = Lident "unit"; loc = _}, []);
            ptyp_loc = _; ptyp_attributes = []});
        ptyp_loc = _; ptyp_attributes = []});
      ptyp_loc = _; ptyp_attributes = []};
   pval_prim = ["ml_gtk_box_set_spacing"];
   pval_attributes = []}
)
```

### External with Option Parameter
```ocaml
(* OCaml syntax *)
external new_ : string option -> t = "ml_gtk_label_new"

(* AST pattern *)
Pstr_primitive (
  {pval_name = {txt = "new_"; loc = _};
   pval_type = 
     {ptyp_desc = Ptyp_arrow (Nolabel,
        {ptyp_desc = Ptyp_constr ({txt = Lident "option"; loc = _},
           [{ptyp_desc = Ptyp_constr ({txt = Lident "string"; loc = _}, []);
             ptyp_loc = _; ptyp_attributes = []}]);
         ptyp_loc = _; ptyp_attributes = []},
        {ptyp_desc = Ptyp_constr ({txt = Lident "t"; loc = _}, []);
         ptyp_loc = _; ptyp_attributes = []});
      ptyp_loc = _; ptyp_attributes = []};
   pval_prim = ["ml_gtk_label_new"];
   pval_attributes = []}
)
```

### External Returning Option
```ocaml
(* OCaml syntax *)
external get_label : t -> string option = "ml_gtk_button_get_label"

(* AST pattern *)
Pstr_primitive (
  {pval_name = {txt = "get_label"; loc = _};
   pval_type = 
     {ptyp_desc = Ptyp_arrow (Nolabel,
        {ptyp_desc = Ptyp_constr ({txt = Lident "t"; loc = _}, []);
         ptyp_loc = _; ptyp_attributes = []},
        {ptyp_desc = Ptyp_constr ({txt = Lident "option"; loc = _},
           [{ptyp_desc = Ptyp_constr ({txt = Lident "string"; loc = _}, []);
             ptyp_loc = _; ptyp_attributes = []}]);
         ptyp_loc = _; ptyp_attributes = []});
      ptyp_loc = _; ptyp_attributes = []};
   pval_prim = ["ml_gtk_button_get_label"];
   pval_attributes = []}
)
```

### External with Widget Option Parameter
```ocaml
(* OCaml syntax *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_button_set_child"

(* AST pattern *)
Pstr_primitive (
  {pval_name = {txt = "set_child"; loc = _};
   pval_type = 
     {ptyp_desc = Ptyp_arrow (Nolabel,
        {ptyp_desc = Ptyp_constr ({txt = Lident "t"; loc = _}, []);
         ptyp_loc = _; ptyp_attributes = []},
        {ptyp_desc = Ptyp_arrow (Nolabel,
           {ptyp_desc = Ptyp_constr ({txt = Lident "option"; loc = _},
              [{ptyp_desc = Ptyp_constr 
                 ({txt = Ldot 
                    (Ldot 
                       (Ldot 
                          (Ldot 
                             (Ldot 
                                (Ldot 
                                   (Ldot 
                                      (Ldot 
                                         (Ldot 
                                            (Ldot 
                                               (Lident "Event_controller", "layout_child"),
                                              "layout_manager"),
                                             "root"),
                                            "widget"),
                                           "Widget"),
                                          "t");
                ptyp_loc = _; ptyp_attributes = []}]);
            ptyp_loc = _; ptyp_attributes = []},
           {ptyp_desc = Ptyp_constr ({txt = Lident "unit"; loc = _}, []);
            ptyp_loc = _; ptyp_attributes = []});
        ptyp_loc = _; ptyp_attributes = []});
      ptyp_loc = _; ptyp_attributes = []};
   pval_prim = ["ml_gtk_button_set_child"];
   pval_attributes = []}
)
```

### External Returning Tuple
```ocaml
(* OCaml syntax *)
external get_selection_bounds : t -> bool * int * int = "ml_gtk_label_get_selection_bounds"

(* AST pattern *)
Pstr_primitive (
  {pval_name = {txt = "get_selection_bounds"; loc = _};
   pval_type = 
     {ptyp_desc = Ptyp_arrow (Nolabel,
        {ptyp_desc = Ptyp_constr ({txt = Lident "t"; loc = _}, []);
         ptyp_loc = _; ptyp_attributes = []},
        {ptyp_desc = Ptyp_tuple 
           [{ptyp_desc = Ptyp_constr ({txt = Lident "bool"; loc = _}, []);
             ptyp_loc = _; ptyp_attributes = []};
            {ptyp_desc = Ptyp_constr ({txt = Lident "int"; loc = _}, []);
             ptyp_loc = _; ptyp_attributes = []};
            {ptyp_desc = Ptyp_constr ({txt = Lident "int"; loc = _}, []);
             ptyp_loc = _; ptyp_attributes = []}];
        ptyp_loc = _; ptyp_attributes = []});
      ptyp_loc = _; ptyp_attributes = []};
   pval_prim = ["ml_gtk_label_get_selection_bounds"];
   pval_attributes = []}
)
```

### External with Enum Parameter
```ocaml
(* OCaml syntax *)
external set_justify : t -> Gtk_enums.justification -> unit = "ml_gtk_label_set_justify"

(* AST pattern *)
Pstr_primitive (
  {pval_name = {txt = "set_justify"; loc = _};
   pval_type = 
     {ptyp_desc = Ptyp_arrow (Nolabel,
        {ptyp_desc = Ptyp_constr ({txt = Lident "t"; loc = _}, []);
         ptyp_loc = _; ptyp_attributes = []},
        {ptyp_desc = Ptyp_arrow (Nolabel,
           {ptyp_desc = Ptyp_constr 
              ({txt = Ldot (Lident "Gtk_enums", "justification"); loc = _}, []);
            ptyp_loc = _; ptyp_attributes = []},
           {ptyp_desc = Ptyp_constr ({txt = Lident "unit"; loc = _}, []);
            ptyp_loc = _; ptyp_attributes = []});
        ptyp_loc = _; ptyp_attributes = []});
      pval_loc = _; ptyp_attributes = []};
   pval_prim = ["ml_gtk_label_set_justify"];
   pval_attributes = []}
)
```

### External with Float Parameter
```ocaml
(* OCaml syntax *)
external set_xalign : t -> float -> unit = "ml_gtk_label_set_xalign"

(* AST pattern *)
Pstr_primitive (
  {pval_name = {txt = "set_xalign"; loc = _};
   pval_type = 
     {ptyp_desc = Ptyp_arrow (Nolabel,
        {ptyp_desc = Ptyp_constr ({txt = Lident "t"; loc = _}, []);
         ptyp_loc = _; ptyp_attributes = []},
        {ptyp_desc = Ptyp_arrow (Nolabel,
           {ptyp_desc = Ptyp_constr ({txt = Lident "float"; loc = _}, []);
            ptyp_loc = _; ptyp_attributes = []},
           {ptyp_desc = Ptyp_constr ({txt = Lident "unit"; loc = _}, []);
            ptyp_loc = _; ptyp_attributes = []});
        ptyp_loc = _; ptyp_attributes = []});
      pval_loc = _; ptyp_attributes = []};
   pval_prim = ["ml_gtk_label_set_xalign"];
   pval_attributes = []}
)
```

## Layer 1 Validation Patterns

### Validate Widget Type Definition
```ocaml
let assert_widget_type_definition ast widget_name =
  match Ml_ast_helpers.find_type_declaration ast "t" with
  | None -> Alcotest.fail "Widget type 't' not found"
  | Some td ->
      (* Check it's a polymorphic variant wrapping Gobject.obj *)
      match td.ptype_manifest with
      | Some {ptyp_desc = Ptyp_constr ({txt = Longident.Ldot (Longident.Lident "Gobject", "obj"); _}, []); _} -> ()
      | _ -> Alcotest.fail "Widget type should wrap Gobject.obj"
```

### Validate as_widget Function
```ocaml
let assert_as_widget_function ast =
  match Ml_ast_helpers.find_let_binding ast "as_widget" with
  | None -> Alcotest.fail "as_widget function not found"
  | Some vb ->
      (* Check it uses Obj.magic *)
      let rec uses_obj_magic expr =
        match expr.pexp_desc with
        | Pexp_ident {txt = Longident.Ldot (Longident.Lident "Obj", "magic"); _} -> true
        | Pexp_apply (func, _) -> uses_obj_magic func
        | Pexp_constraint (inner, _) -> uses_obj_magic inner
        | _ -> false
      in
      if not (uses_obj_magic vb.pvb_expr) then
        Alcotest.fail "as_widget should use Obj.magic"
```

### Validate External Function Pattern
```ocaml
let assert_external_function ast name expected_c_name =
  match Ml_ast_helpers.find_external ast name with
  | None -> Alcotest.fail (Printf.sprintf "External %s not found" name)
  | Some vd ->
      match Ml_ast_helpers.get_external_c_name vd with
      | Some c_name when c_name = expected_c_name -> ()
      | Some c_name -> Alcotest.fail (Printf.sprintf "Expected C name %s, got %s" expected_c_name c_name)
      | None -> Alcotest.fail (Printf.sprintf "External %s has no C name" name)
```

### Validate Widget Method Signature
```ocaml
let assert_widget_method_signature ast method_name =
  match Ml_ast_helpers.find_external ast method_name with
  | None -> Alcotest.fail (Printf.sprintf "Method %s not found" method_name)
  | Some vd ->
      (* Check first parameter is widget type 't' *)
      match vd.pval_type.ptyp_desc with
      | Ptyp_arrow (_, {ptyp_desc = Ptyp_constr ({txt = Longident.Lident "t"; _}, []); _}, _) -> ()
      | _ -> Alcotest.fail (Printf.sprintf "Method %s should take widget type 't' as first parameter" method_name)
```

### Validate Option Return Type
```ocaml
let assert_returns_option ast function_name =
  match Ml_ast_helpers.find_external ast function_name with
  | None -> Alcotest.fail (Printf.sprintf "Function %s not found" function_name)
  | Some vd ->
      let return_type = Ml_ast_helpers.get_return_type vd.pval_type in
      if not (Ml_ast_helpers.is_option_type return_type) then
        Alcotest.fail (Printf.sprintf "Function %s should return option type" function_name)
```

## Layer 1 Testing Tips

1. **Consistent patterns**: All generated widgets follow the same AST structure - use pattern matching to validate consistency

2. **Type checking**: Always verify that external functions have the correct parameter and return types

3. **C name validation**: Check that the C function names follow the expected naming convention (`ml_gtk_<widget>_<method>`)

4. **Widget type validation**: Ensure the widget type `t` is always a polymorphic variant wrapping `Gobject.obj`

5. **as_widget function**: Verify that every widget has an `as_widget` function using `Obj.magic`

6. **Option handling**: Check that optional parameters and return values are properly wrapped in `option` type

## ppxlib Version

This guide is for **ppxlib 0.37.0**. AST structures may differ in other versions.
