(* ML AST Helpers - Wrapper around OCaml compiler-libs for parsing and inspecting ML/MLI files *)

open Ppxlib
open Ppxlib.Parsetree
open Ppxlib.Asttypes

(* ========================================================================= *)
(* Parsing Functions *)
(* ========================================================================= *)

(* Parse .ml implementation code into AST *)
let parse_implementation code =
  let lexbuf = Lexing.from_string code in
  try
    Ppxlib.Parse.implementation lexbuf
  with
  | Ppxlib.Location.Error _ as e ->
      Printf.eprintf "Syntax error while parsing implementation:\n%s\n" code;
      raise e
  | e ->
      Printf.eprintf "Error while parsing implementation:\n%s\n" code;
      raise e

(* Parse .mli interface/signature code into AST *)
let parse_interface code =
  let lexbuf = Lexing.from_string code in
  try
    Ppxlib.Parse.interface lexbuf
  with
  | Ppxlib.Location.Error _ as e ->
      Printf.eprintf "Syntax error while parsing interface:\n%s\n" code;
      raise e
  | e ->
      Printf.eprintf "Error while parsing interface:\n%s\n" code;
      raise e

(* ========================================================================= *)
(* Type Declaration Helpers *)
(* ========================================================================= *)

(* Find a type declaration by name in a structure (implementation) *)
let find_type_declaration (ast : structure) (name : string) : type_declaration option =
  List.find_map (fun item ->
    match item.pstr_desc with
    | Pstr_type (_, type_decls) ->
        List.find_opt (fun td -> td.ptype_name.txt = name) type_decls
    | _ -> None
  ) ast

(* Find a type declaration by name in a signature (interface) *)
let find_type_declaration_sig (ast : signature) (name : string) : type_declaration option =
  List.find_map (fun item ->
    match item.psig_desc with
    | Psig_type (_, type_decls) ->
        List.find_opt (fun td -> td.ptype_name.txt = name) type_decls
    | _ -> None
  ) ast

(* Get all type declarations from a structure *)
let get_all_type_declarations (ast : structure) : type_declaration list =
  List.concat_map (fun item ->
    match item.pstr_desc with
    | Pstr_type (_, type_decls) -> type_decls
    | _ -> []
  ) ast

(* ========================================================================= *)
(* External Declaration Helpers *)
(* ========================================================================= *)

(* Find an external declaration by name in a structure *)
let find_external (ast : structure) (name : string) : value_description option =
  List.find_map (fun item ->
    match item.pstr_desc with
    | Pstr_primitive vd when vd.pval_name.txt = name ->
        Some vd
    | _ -> None
  ) ast

(* Find an external declaration by name in a signature *)
let find_external_sig (ast : signature) (name : string) : value_description option =
  List.find_map (fun item ->
    match item.psig_desc with
    | Psig_value vd when vd.pval_name.txt = name ->
        (* Check if it's actually an external by looking at pval_prim *)
        if vd.pval_prim <> [] then Some vd else None
    | _ -> None
  ) ast

(* Get the C function name from an external declaration *)
let get_external_c_name (ext_decl : value_description) : string option =
  match ext_decl.pval_prim with
  | c_name :: _ -> Some c_name
  | [] -> None

(* Get all external declarations from a structure *)
let get_all_externals (ast : structure) : value_description list =
  List.filter_map (fun item ->
    match item.pstr_desc with
    | Pstr_primitive vd -> Some vd
    | _ -> None
  ) ast

(* ========================================================================= *)
(* Value Declaration Helpers *)
(* ========================================================================= *)

(* Find a let binding by name in an implementation *)
let find_let_binding (ast : structure) (name : string) : value_binding option =
  List.find_map (fun item ->
    match item.pstr_desc with
    | Pstr_value (_, bindings) ->
        List.find_opt (fun vb ->
          match vb.pvb_pat.ppat_desc with
          | Ppat_var { txt; _ } when txt = name -> true
          | _ -> false
        ) bindings
    | _ -> None
  ) ast

(* Find a value declaration (let binding) by name in a signature *)
let find_value_declaration_sig (ast : signature) (name : string) : value_description option =
  List.find_map (fun item ->
    match item.psig_desc with
    | Psig_value vd when vd.pval_name.txt = name -> Some vd
    | _ -> None
  ) ast

(* Get all value declarations from a signature *)
let get_all_value_declarations_sig (ast : signature) : (string * core_type) list =
  List.filter_map (fun item ->
    match item.psig_desc with
    | Psig_value vd -> Some (vd.pval_name.txt, vd.pval_type)
    | _ -> None
  ) ast

(* ========================================================================= *)
(* Type Inspection Helpers *)
(* ========================================================================= *)

(* Convert a longident_loc to a simple string - handles common cases *)
let longident_loc_to_string (lid_loc : Longident.t Asttypes.loc) : string =
  let rec to_str lid =
    match lid with
    | Longident.Lident s -> s
    | Longident.Ldot (parent, s) -> to_str parent ^ "." ^ s
    | Longident.Lapply _ -> "<apply>"
  in
  to_str lid_loc.txt

(* Convert a core_type to a string representation (simplified) *)
let rec core_type_to_string (ct : core_type) : string =
  match ct.ptyp_desc with
  | Ptyp_any -> "_"
  | Ptyp_var v -> "'" ^ v
  | Ptyp_constr (lid_loc, []) ->
      longident_loc_to_string lid_loc
  | Ptyp_constr (lid_loc, [arg]) ->
      (* Single argument: use postfix notation (e.g., "t option", not "option<t>") *)
      Printf.sprintf "%s %s"
        (core_type_to_string arg)
        (longident_loc_to_string lid_loc)
  | Ptyp_constr (lid_loc, args) ->
      (* Multiple arguments: use prefix notation with parens *)
      let args_str = String.concat ", " (List.map core_type_to_string args) in
      Printf.sprintf "(%s) %s" args_str (longident_loc_to_string lid_loc)
  | Ptyp_tuple types ->
      (* ppxlib uses version-independent tuple representation without labels *)
      let types_str = String.concat " * " (List.map core_type_to_string types) in
      Printf.sprintf "(%s)" types_str
  | Ptyp_arrow (_, param_type, return_type) ->
      Printf.sprintf "%s -> %s"
        (core_type_to_string param_type)
        (core_type_to_string return_type)
  | Ptyp_variant (row_fields, _, _) ->
      let tags = List.map (fun rf ->
        match rf.prf_desc with
        | Rtag (label_loc, _, _) -> "`" ^ label_loc.txt
        | Rinherit _ -> "<inherit>"
      ) row_fields in
      Printf.sprintf "[%s]" (String.concat " | " tags)
  | _ -> "<complex type>"

(* Extract parameter types from a function type *)
let rec get_param_types (ct : core_type) : core_type list =
  match ct.ptyp_desc with
  | Ptyp_arrow (_, param_type, return_type) ->
      param_type :: get_param_types return_type
  | _ -> []

(* Extract the return type from a function type *)
let rec get_return_type (ct : core_type) : core_type =
  match ct.ptyp_desc with
  | Ptyp_arrow (_, _, return_type) -> get_return_type return_type
  | _ -> ct

(* Check if a type is an option type *)
let is_option_type (ct : core_type) : bool =
  match ct.ptyp_desc with
  | Ptyp_constr (lid_loc, [_]) ->
      (match lid_loc.txt with
       | Longident.Lident "option" -> true
       | _ -> false)
  | _ -> false

(* Check if a type is unit *)
let is_unit_type (ct : core_type) : bool =
  match ct.ptyp_desc with
  | Ptyp_constr (lid_loc, []) ->
      (match lid_loc.txt with
       | Longident.Lident "unit" -> true
       | _ -> false)
  | _ -> false

(* Check if a type is a string *)
let is_string_type (ct : core_type) : bool =
  match ct.ptyp_desc with
  | Ptyp_constr (lid_loc, []) ->
      (match lid_loc.txt with
       | Longident.Lident "string" -> true
       | _ -> false)
  | _ -> false

(* Check if a type is "string option" *)
let is_string_option_type (ct : core_type) : bool =
  match ct.ptyp_desc with
  | Ptyp_constr (lid_loc, [inner]) ->
      (match lid_loc.txt with
       | Longident.Lident "option" -> is_string_type inner
       | _ -> false)
  | _ -> false

(* Extract variant tags from a polymorphic variant type *)
let get_variant_tags (type_decl : type_declaration) : string list =
  match type_decl.ptype_manifest with
  | Some { ptyp_desc = Ptyp_variant (row_fields, _, _); _ } ->
      List.filter_map (fun rf ->
        match rf.prf_desc with
        | Rtag (label_loc, _, _) -> Some label_loc.txt
        | Rinherit _ -> None
      ) row_fields
  | Some { ptyp_desc = Ptyp_constr (_, [{ ptyp_desc = Ptyp_variant (row_fields, _, _); _ }]); _ } ->
      (* Handle case like: type t = [`button | `widget] Gobject.obj *)
      List.filter_map (fun rf ->
        match rf.prf_desc with
        | Rtag (label_loc, _, _) -> Some label_loc.txt
        | Rinherit _ -> None
      ) row_fields
  | _ -> []

(* Check if a type wraps Gobject.obj *)
let wraps_gobject_obj (type_decl : type_declaration) : bool =
  match type_decl.ptype_manifest with
  | Some { ptyp_desc = Ptyp_constr (lid_loc, [_]); _ } ->
      (match lid_loc.txt with
       | Longident.Ldot (parent, s) ->
           (match parent, s with
            | Longident.Lident "Gobject", "obj" -> true
            | _ -> false)
       | _ -> false)
  | _ -> false

(* Check if a type is a polymorphic variant *)
let is_polymorphic_variant (type_decl : type_declaration) : bool =
  match type_decl.ptype_manifest with
  | Some { ptyp_desc = Ptyp_variant _; _ } -> true
  | _ -> false

(* Check if a type is abstract (no manifest) *)
let is_abstract_type (type_decl : type_declaration) : bool =
  type_decl.ptype_manifest = None

(* ========================================================================= *)
(* Class Declaration Helpers *)
(* ========================================================================= *)

(* Find a class declaration by name in a structure *)
let find_class_declaration (ast : structure) (name : string) : class_declaration option =
  List.find_map (fun item ->
    match item.pstr_desc with
    | Pstr_class class_decls ->
        List.find_opt (fun cd -> cd.pci_name.txt = name) class_decls
    | _ -> None
  ) ast

(* Get inherit clauses from a class expression *)
let rec get_class_inherit_clauses (class_expr : class_expr) : string list =
  match class_expr.pcl_desc with
  | Pcl_constr ({ txt = Longident.Lident name; _ }, []) -> [name]
  | Pcl_constr ({ txt = Longident.Ldot (parent, name); _ }, []) ->
      [longident_loc_to_string { txt = Longident.Ldot (parent, name); loc = Location.none }]
  | Pcl_apply (cexp, _) ->
      get_class_inherit_clauses cexp
  | _ -> []

(* Find a method by name in a class expression *)
let find_method_in_class (class_expr : class_expr) (method_name : string) : class_field option =
  match class_expr.pcl_desc with
  | Pcl_structure { pcstr_fields; _ } ->
      List.find_opt (fun cf ->
        match cf.pcf_desc with
        | Pcf_method ({ txt; _ }, _, _) when txt = method_name -> true
        | _ -> false
      ) pcstr_fields
  | _ -> None

(* Get the type annotation of a method *)
let get_method_type (class_field : class_field) : core_type option =
  match class_field.pcf_desc with
  | Pcf_method (_, _, Cfk_virtual virtual_type) ->
      (* virtual_type is already a core_type, return it directly *)
      Some virtual_type
  | Pcf_method (_, _, Cfk_concrete (_, { pexp_desc = Pexp_poly (_, Some poly_type); _ })) ->
      Some poly_type
  | Pcf_method (_, _, Cfk_concrete (_, { pexp_desc = Pexp_poly (_, None); _ })) ->
      (* Poly type with no explicit type - infer from body (not implemented) *)
      None
  | _ -> None

(* Convert class expression to string for debugging *)
let rec class_expr_to_string (class_expr : class_expr) : string =
  match class_expr.pcl_desc with
  | Pcl_constr ({ txt = Longident.Lident name; _ }, []) -> "class " ^ name
  | Pcl_constr ({ txt = Longident.Ldot (parent, name); _ }, []) ->
      "class " ^ longident_loc_to_string { txt = Longident.Ldot (parent, name); loc = Location.none }
  | Pcl_structure { pcstr_self; pcstr_fields } ->
      let self_str = match pcstr_self with
        | { ppat_desc = Ppat_var { txt; _ }; _ } -> txt
        | _ -> "<self>"
      in
      let field_strs = List.map (fun cf ->
        match cf.pcf_desc with
        | Pcf_method ({ txt; _ }, _, _) -> "method " ^ txt
        | Pcf_val ({ txt; _ }, _, _) -> "val " ^ txt
        | Pcf_inherit _ -> "inherit ..."
        | _ -> "..."
      ) pcstr_fields in
      Printf.sprintf "class %s = { %s }" self_str (String.concat "; " field_strs)
  | Pcl_apply (cexp, _) -> class_expr_to_string cexp
  | _ -> "<class expression>"

(* ========================================================================= *)
(* Hierarchy Type Helpers *)
(* ========================================================================= *)

(* Recursively check if a core_type contains a Ptyp_class (hierarchy type) *)
let rec contains_hierarchy_type (ct : core_type) : bool =
  match ct.ptyp_desc with
  | Ptyp_class _ -> true  (* This is a hierarchy type! *)
  | Ptyp_constr (_, args) -> List.exists contains_hierarchy_type args
  | Ptyp_arrow (_, arg_type, return_type) ->
      contains_hierarchy_type arg_type || contains_hierarchy_type return_type
  | Ptyp_tuple types -> List.exists contains_hierarchy_type types
  | Ptyp_variant (row_fields, _, _) ->
      List.exists (fun rf ->
        match rf.prf_desc with
        | Rtag (_, _, types) -> List.exists contains_hierarchy_type types
        | Rinherit ct -> contains_hierarchy_type ct
      ) row_fields
  | Ptyp_object (fields, _) ->
      List.exists (fun field ->
        match field.pof_desc with
        | Otag (_, ct) -> contains_hierarchy_type ct
        | Oinherit ct -> contains_hierarchy_type ct
      ) fields
  | Ptyp_poly (_, ct) -> contains_hierarchy_type ct
  | _ -> false

(* Check if a method parameter has a hierarchy type (#widget syntax) *)
(* Hierarchy types use Ptyp_class in the AST, NOT Ptyp_constr *)
let has_hierarchy_parameter (class_field : class_field) : bool =
  match class_field.pcf_desc with
  | Pcf_method (_, _, Cfk_concrete (_, { pexp_desc = Pexp_poly (_, poly_type); _ })) ->
      (match poly_type with
       | Some ct -> contains_hierarchy_type ct
       | None -> false)
  | _ -> false

(* Assert that a method in a class has a hierarchy parameter *)
let assert_method_has_hierarchy_param ast class_name method_name =
  match find_class_declaration ast class_name with
  | None -> Alcotest.fail (Printf.sprintf "Class %s not found" class_name)
  | Some cd ->
      match find_method_in_class cd.pci_expr method_name with
      | None -> Alcotest.fail (Printf.sprintf "Method %s not found" method_name)
      | Some cf ->
          if not (has_hierarchy_parameter cf) then
            Alcotest.fail (Printf.sprintf "Method %s does not have hierarchy parameter" method_name)
