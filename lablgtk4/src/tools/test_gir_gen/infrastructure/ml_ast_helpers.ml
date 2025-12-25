(* ML AST Helpers - Wrapper around OCaml compiler-libs for parsing and inspecting ML/MLI files *)

open Parsetree
open Asttypes

(* ========================================================================= *)
(* Parsing Functions *)
(* ========================================================================= *)

(* Parse .ml implementation code into AST *)
let parse_implementation code =
  let lexbuf = Lexing.from_string code in
  try
    Parse.implementation lexbuf
  with
  | Syntaxerr.Error _ as e ->
      Printf.eprintf "Syntax error while parsing implementation:\n%s\n" code;
      raise e
  | e ->
      Printf.eprintf "Error while parsing implementation:\n%s\n" code;
      raise e

(* Parse .mli interface/signature code into AST *)
let parse_interface code =
  let lexbuf = Lexing.from_string code in
  try
    Parse.interface lexbuf
  with
  | Syntaxerr.Error _ as e ->
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
    | Longident.Ldot (parent_loc, s_loc) -> to_str parent_loc.txt ^ "." ^ s_loc.txt
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
  | Ptyp_constr (lid_loc, args) ->
      let args_str = String.concat ", " (List.map core_type_to_string args) in
      Printf.sprintf "%s<%s>" (longident_loc_to_string lid_loc) args_str
  | Ptyp_tuple types ->
      (* In OCaml 5.4+, tuple types include optional labels *)
      let types_str = String.concat " * " (List.map (fun (_, ct) -> core_type_to_string ct) types) in
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
       | Longident.Ldot (parent_loc, s_loc) ->
           (match parent_loc.txt, s_loc.txt with
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
