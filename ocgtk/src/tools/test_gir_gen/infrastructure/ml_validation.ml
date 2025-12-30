(* ML Validation Helpers - High-level validation functions for ML AST testing *)

open Ppxlib
open Ppxlib.Parsetree
open Printf

(* ========================================================================= *)
(* Type Declaration Validations *)
(* ========================================================================= *)

(* Assert that a type declaration is a polymorphic variant *)
let assert_polymorphic_variant (type_decl : type_declaration) =
  if not (Ml_ast_helpers.is_polymorphic_variant type_decl) then
    Alcotest.fail (sprintf "Expected type '%s' to be a polymorphic variant"
      type_decl.ptype_name.txt)

(* Assert that a type declaration has a specific variant tag *)
let assert_has_variant_tag (type_decl : type_declaration) (tag : string) =
  let tags = Ml_ast_helpers.get_variant_tags type_decl in
  if not (List.mem tag tags) then
    Alcotest.fail (sprintf "Expected type '%s' to have variant tag '%s', found tags: [%s]"
      type_decl.ptype_name.txt
      tag
      (String.concat "; " tags))

(* Assert that a type declaration wraps Gobject.obj *)
let assert_wraps_gobject_obj (type_decl : type_declaration) =
  if not (Ml_ast_helpers.wraps_gobject_obj type_decl) then
    Alcotest.fail (sprintf "Expected type '%s' to wrap Gobject.obj"
      type_decl.ptype_name.txt)

(* Assert that a type is abstract (no manifest) *)
let assert_abstract_type (type_decl : type_declaration) =
  if not (Ml_ast_helpers.is_abstract_type type_decl) then
    Alcotest.fail (sprintf "Expected type '%s' to be abstract (no manifest)"
      type_decl.ptype_name.txt)

(* ========================================================================= *)
(* External Declaration Validations *)
(* ========================================================================= *)

(* Check if a specific parameter (by index) of an external is string option *)
let is_optional_string_param (ext_decl : value_description) (param_idx : int) : bool =
  let params = Ml_ast_helpers.get_param_types ext_decl.pval_type in
  match List.nth_opt params param_idx with
  | Some param_type -> Ml_ast_helpers.is_string_option_type param_type
  | None -> false

(* Check if an external returns unit *)
let returns_unit (ext_decl : value_description) : bool =
  let return_type = Ml_ast_helpers.get_return_type ext_decl.pval_type in
  Ml_ast_helpers.is_unit_type return_type

(* Check if an external returns string *)
let returns_string (ext_decl : value_description) : bool =
  let return_type = Ml_ast_helpers.get_return_type ext_decl.pval_type in
  Ml_ast_helpers.is_string_type return_type

(* Check if an external returns string option *)
let returns_string_option (ext_decl : value_description) : bool =
  let return_type = Ml_ast_helpers.get_return_type ext_decl.pval_type in
  Ml_ast_helpers.is_string_option_type return_type

(* Assert external has expected C name *)
let assert_external_c_name (ext_decl : value_description) (expected_c_name : string) =
  match Ml_ast_helpers.get_external_c_name ext_decl with
  | Some c_name ->
      if c_name <> expected_c_name then
        Alcotest.fail (sprintf "Expected external '%s' to have C name '%s', got '%s'"
          ext_decl.pval_name.txt expected_c_name c_name)
  | None ->
      Alcotest.fail (sprintf "External '%s' has no C name"
        ext_decl.pval_name.txt)

(* Assert external has expected number of parameters *)
let assert_param_count (ext_decl : value_description) (expected_count : int) =
  let params = Ml_ast_helpers.get_param_types ext_decl.pval_type in
  let actual_count = List.length params in
  if actual_count <> expected_count then
    Alcotest.fail (sprintf "Expected external '%s' to have %d parameters, got %d"
      ext_decl.pval_name.txt expected_count actual_count)

(* ========================================================================= *)
(* Function Signature Validations *)
(* ========================================================================= *)

(* Assert that a function/external has a specific signature pattern *)
let assert_function_signature
    (func_type : core_type)
    ~(expected_params : string list)
    ~(expected_return : string) =
  let param_types = Ml_ast_helpers.get_param_types func_type in
  let actual_return = Ml_ast_helpers.get_return_type func_type in

  (* Check parameter count *)
  let expected_count = List.length expected_params in
  let actual_count = List.length param_types in
  if actual_count <> expected_count then
    Alcotest.fail (sprintf "Expected %d parameters, got %d"
      expected_count actual_count);

  (* Check each parameter type *)
  List.iter2 (fun expected_param actual_param_type ->
    let actual_param_str = Ml_ast_helpers.core_type_to_string actual_param_type in
    if actual_param_str <> expected_param then
      Alcotest.fail (sprintf "Expected parameter type '%s', got '%s'"
        expected_param actual_param_str)
  ) expected_params param_types;

  (* Check return type *)
  let actual_return_str = Ml_ast_helpers.core_type_to_string actual_return in
  if actual_return_str <> expected_return then
    Alcotest.fail (sprintf "Expected return type '%s', got '%s'"
      expected_return actual_return_str)

(* ========================================================================= *)
(* Type Compatibility Checks *)
(* ========================================================================= *)

(* Check if two types are compatible (for .mli vs .ml consistency) *)
let assert_types_compatible (sig_type : core_type) (impl_type : core_type) =
  let sig_str = Ml_ast_helpers.core_type_to_string sig_type in
  let impl_str = Ml_ast_helpers.core_type_to_string impl_type in
  if sig_str <> impl_str then
    Alcotest.fail (sprintf "Type mismatch: signature has '%s', implementation has '%s'"
      sig_str impl_str)

(* ========================================================================= *)
(* Convenience Assertions *)
(* ========================================================================= *)

(* Assert that a type is defined in the AST *)
let assert_type_exists (ast : structure) (type_name : string) =
  match Ml_ast_helpers.find_type_declaration ast type_name with
  | Some _ -> ()
  | None ->
      let available_types =
        Ml_ast_helpers.get_all_type_declarations ast
        |> List.map (fun td -> td.ptype_name.txt)
        |> String.concat ", " in
      Alcotest.fail (sprintf "Type '%s' not found. Available types: [%s]"
        type_name available_types)

(* Assert that an external is defined in the AST *)
let assert_external_exists (ast : structure) (external_name : string) =
  match Ml_ast_helpers.find_external ast external_name with
  | Some _ -> ()
  | None ->
      let available_externals =
        Ml_ast_helpers.get_all_externals ast
        |> List.map (fun vd -> vd.pval_name.txt)
        |> String.concat ", " in
      Alcotest.fail (sprintf "External '%s' not found. Available externals: [%s]"
        external_name available_externals)

(* Assert that a type is defined in a signature AST *)
let assert_type_exists_sig (ast : signature) (type_name : string) =
  match Ml_ast_helpers.find_type_declaration_sig ast type_name with
  | Some _ -> ()
  | None ->
      Alcotest.fail (sprintf "Type '%s' not found in signature" type_name)

(* Assert parameter type at specific index *)
let assert_param_type (ext_decl : value_description) (param_idx : int) (expected_type : string) =
  let params = Ml_ast_helpers.get_param_types ext_decl.pval_type in
  match List.nth_opt params param_idx with
  | Some param_type ->
      let actual_type = Ml_ast_helpers.core_type_to_string param_type in
      if actual_type <> expected_type then
        Alcotest.fail (sprintf "Expected parameter %d of '%s' to be '%s', got '%s'"
          param_idx ext_decl.pval_name.txt expected_type actual_type)
  | None ->
      Alcotest.fail (sprintf "Parameter %d not found in '%s' (has %d params)"
        param_idx ext_decl.pval_name.txt (List.length params))

(* Assert return type *)
let assert_return_type (ext_decl : value_description) (expected_type : string) =
  let return_type = Ml_ast_helpers.get_return_type ext_decl.pval_type in
  let actual_type = Ml_ast_helpers.core_type_to_string return_type in
  if actual_type <> expected_type then
    Alcotest.fail (sprintf "Expected '%s' to return '%s', got '%s'"
      ext_decl.pval_name.txt expected_type actual_type)

(* Assert that a value (let binding or external) exists in implementation *)
let assert_value_exists (ast : structure) (value_name : string) =
  match Ml_ast_helpers.find_let_binding ast value_name with
  | Some _ -> ()
  | None ->
      (* Also check externals *)
      match Ml_ast_helpers.find_external ast value_name with
      | Some _ -> ()
      | None ->
          Alcotest.fail (sprintf "Value '%s' not found in implementation" value_name)
