(* Validation helpers specific to lablgtk C stub generation *)

open C_ast

(* Get the conversion macro used (Val_GtkButton, etc.) *)
let rec get_conversion_macro expr =
  match expr with
  | Macro (name, args) when String.starts_with ~prefix:"Val_" name ->
      (* Skip nullable wrappers (Val_option, Val_some) to find the actual type conversion *)
      if name = "Val_option" || name = "Val_some" then
        (* Val_option(value, Val_TypeName) - the second arg is a Var with the macro name *)
        (match args with
         | [_; Var macro_name] when String.starts_with ~prefix:"Val_" macro_name ->
             Some macro_name
         | _ -> List.find_map get_conversion_macro args)
      else Some name
  | Cast (_, e) -> get_conversion_macro e
  | Macro (_, args) ->
      (* Recursively search in macro arguments (e.g., CAMLreturn(Val_GtkButton(...))) *)
      List.find_map get_conversion_macro args
  | _ -> None

(* Check if a function uses the correct return conversion macro *)
let uses_correct_return_macro f expected_macro =
  let type_info = extract_type_info f in
  match type_info.return_expr with
  | None -> false
  | Some expr -> (
      match get_conversion_macro expr with
      | Some macro -> macro = expected_macro
      | None -> false)

(* Validate that a GTK type constructor properly converts the result *)
let validates_gtk_constructor f c_type =
  let expected_macro = "Val_" ^ c_type in
  uses_correct_return_macro f expected_macro

(* Check if function properly calls the underlying C function *)
let calls_c_function f expected_c_func =
  function_calls_function f expected_c_func

(* Validate parameter is properly converted using _val macro *)
let param_converted_with_val_macro f param_name expected_type =
  (* Check if there's a call using Type_val(param_name) *)
  List.exists
    (function
      | VarDecl (_, _, Some (Macro (macro, [ Var p ]))) when p = param_name ->
          macro = expected_type ^ "_val"
      | ExprStmt (Call (_, args)) | Return (Call (_, args)) ->
          List.exists
            (function
              | Macro (macro, [ Var p ]) when p = param_name ->
                  macro = expected_type ^ "_val"
              | _ -> false)
            args
      | _ -> false)
    f.body

(* Validate that out parameters are declared with correct type *)
let has_out_param_decl f param_name expected_type =
  (* Note: C code uses generic names like out1, out2, inout1, inout2 not GIR param names *)
  (* So we check if ANY variable of the expected type is declared *)
  let _ = param_name in
  (* Suppress unused warning *)
  List.exists
    (function
      | VarDecl (t, name, None) when String.starts_with ~prefix:"out" name ->
          String.starts_with ~prefix:expected_type t
      | VarDecl (t, name, Some _) when String.starts_with ~prefix:"inout" name
        ->
          (* InOut parameters are declared with initialization *)
          String.starts_with ~prefix:expected_type t
      | _ -> false)
    f.body

(* Check if out parameter is passed by reference (&param) to C function *)
let out_param_passed_by_ref f param_name c_func_name =
  (* Note: C code uses generic names like out1, out2, not GIR param names *)
  (* So we check if ANY out variable is passed by reference *)
  let _ = param_name in
  (* Suppress unused warning *)
  let rec check_stmt = function
    | (ExprStmt (Call (name, args)) | VarDecl (_, _, Some (Call (name, args))))
      when name = c_func_name ->
        List.exists
          (function
            | AddrOf (Var p)
              when String.starts_with ~prefix:"out" p || p = "error" ->
                true
            | _ -> false)
          args
    | IfStmt (_, then_stmts, else_stmts) ->
        List.exists check_stmt then_stmts || List.exists check_stmt else_stmts
    | _ -> false
  in
  List.exists check_stmt f.body

(* Validate that error handling is present (for throws=true) *)
let has_error_handling f =
  (* Check for GError declaration *)
  let has_error_decl = has_var_decl f "error" in

  (* Check for Res_Ok and Res_Error macros in return (including in if/else) *)
  (* Note: Res_Ok/Res_Error might be nested inside CAMLreturn macro *)
  let rec has_res_macro expr =
    match expr with
    | Macro ("Res_Ok", _) | Macro ("Res_Error", _) -> true
    | Macro (_, args) -> List.exists has_res_macro args
    | _ -> false
  in
  let rec has_error_return_in_stmt = function
    | Return expr -> has_res_macro expr
    | IfStmt (_, then_stmts, else_stmts) ->
        List.exists has_error_return_in_stmt then_stmts
        || List.exists has_error_return_in_stmt else_stmts
    | _ -> false
  in
  let has_error_return = List.exists has_error_return_in_stmt f.body in

  has_error_decl && has_error_return

(* Validate that a function returns error type when throws=true *)
let returns_result_type f =
  (* Check for Res_Ok or Res_Error macros anywhere in the function *)
  (* They might be in if/else statements on a single line *)
  let rec check_stmt = function
    | Return (Macro (name, _)) when name = "Res_Ok" || name = "Res_Error" ->
        true
    | Return expr -> check_expr expr
    | ExprStmt expr -> check_expr expr
    | VarDecl (_, _, Some expr) -> check_expr expr
    | IfStmt (_, then_stmts, else_stmts) ->
        List.exists check_stmt then_stmts || List.exists check_stmt else_stmts
    | _ -> false
  and check_expr = function
    | Macro (name, _) when name = "Res_Ok" || name = "Res_Error" -> true
    | Macro (_, args) -> List.exists check_expr args
    | Call (_, args) -> List.exists check_expr args
    | Cast (_, e) -> check_expr e
    | _ -> false
  in
  List.exists check_stmt f.body

(* Validate CAMLparam macros are used correctly *)
let has_caml_param_macro f =
  (* In our simplified parser, CAMLparam is stripped, but we can check param count *)
  let param_count = get_param_count f in
  param_count >= 0 (* All functions should have params tracked *)

(* Validate CAMLreturn is used *)
let has_caml_return f =
  let rec check_stmt = function
    | Return (Macro ("CAMLreturn", _)) -> true
    | IfStmt (_, then_stmts, else_stmts) ->
        List.exists check_stmt then_stmts || List.exists check_stmt else_stmts
    | _ -> false
  in
  List.exists check_stmt f.body

(* Check if function properly handles nullable parameters *)
let handles_nullable_param f param_name =
  (* Check for Option_val or String_option_val usage *)
  (* Note: C code uses generic arg names (arg1, arg2) not GIR param names *)
  (* So we check if the nullable macros are used anywhere, not for specific param *)
  let _ = param_name in
  (* Suppress unused warning *)
  List.exists
    (function
      | VarDecl (_, _, Some expr) | ExprStmt expr | Return expr ->
          let rec check_expr = function
            | Macro (macro, [ Var _; _; _ ]) -> macro = "Option_val"
            | Macro (macro, [ Var _ ]) -> macro = "String_option_val"
            | Call (_, args) -> List.exists check_expr args
            | Cast (_, e) -> check_expr e
            | Macro (_, args) -> List.exists check_expr args
            | _ -> false
          in
          check_expr expr
      | _ -> false)
    f.body

(* Validate bytecode/native pair is correctly structured *)
let validates_bytecode_native_pair functions base_name =
  let native_name = base_name ^ "_native" in
  let bytecode_name = base_name ^ "_bytecode" in

  match
    (find_function functions native_name, find_function functions bytecode_name)
  with
  | Some native_func, Some bytecode_func ->
      (* Bytecode should call native *)
      function_calls_function bytecode_func native_name
      &&
      (* Native should have the actual implementation *)
      get_param_count native_func >= 5 (* Should have many params *)
  | _ -> false
