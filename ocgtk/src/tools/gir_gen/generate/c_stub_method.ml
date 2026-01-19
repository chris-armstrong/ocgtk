(* C Stub Code Generation - Method Support *)

open Printf
open Containers
open StdLabels
open Types

(* Option binding operator for flattening nested Option.bind chains *)
let ( let* ) = Option.bind

(* Assertion-style option extraction for "impossible" None cases *)
let option_get_exn ~message o = match o with Some v -> v | None -> failwith message

module Log =
  (val Logs.src_log
         (Logs.Src.create "gir_gen.c_stub_method"
            ~doc:"C stub code generation for method support"))

(* [get_c_type_str ~ctx gir_type] retrieves the C type string representation for a GIR type.
   Returns the c_type directly if present, otherwise consults the type mapping context.
   Falls back to "void" if no mapping is found. *)
let get_c_type_str ~ctx (gir_type : gir_type) =
  match gir_type.c_type with
  | Some c_type -> c_type
  | None ->
      Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type
      |> Option.map (fun tm -> tm.c_type)
      |> Option.value ~default:"void"

(* [get_element_c_type ~fallback array_info] extracts the C type of array elements.
   Returns the element_type's c_type if present, otherwise uses the fallback value.
   This is used to determine the base type for array element conversions. *)
let get_element_c_type ~fallback (array_info : gir_array) =
  array_info.element_type.c_type |> Option.value ~default:fallback

(* [var_name_for_direction direction idx] generates a unique variable name based on parameter direction.
   Out parameters use "out<N>", InOut use "inout<N>", and In use "arg<N>".
   The index is 0-based but incremented by 1 in the name for human readability. *)
let var_name_for_direction direction idx =
  match direction with
  | Out -> sprintf "out%d" (idx + 1)
  | InOut -> sprintf "inout%d" (idx + 1)
  | In -> sprintf "arg%d" (idx + 1)

(* [safe_nth_opt parameters idx] safely accesses list element with bounds checking.
   Returns Some element if index is valid, None otherwise with a warning log.
   Used for GIR data validation to detect malformed/inconsistent index references. *)
let safe_nth_opt parameters idx =
  if idx >= 0 && idx < List.length parameters then
    Some (List.nth parameters idx)
  else (
    Log.warn (fun m -> m "Invalid length param index %d (parameters length: %d)" idx (List.length parameters));
    None
  )

(* [handle_out_param ~param_index ~base_type ~acc p] processes an out-direction parameter.
   Generates a C variable declaration (as pointer for arrays, as value otherwise) and
   adds the variable's address to the C function arguments list.
   Returns the updated accumulator with new declarations and arguments. *)
let handle_out_param ~param_index ~base_type ~acc (p : gir_param) =
  let var_name = sprintf "out%d" (param_index + 1) in
  let is_array = Option.is_some p.param_type.array in
  (* Out-parameter array: declare as pointer; regular: declare as value *)
  if is_array then
    bprintf acc.C_stub_helpers.decls "%s* %s = NULL;\n" base_type var_name
  else bprintf acc.C_stub_helpers.decls "%s %s;\n" base_type var_name;
  { acc with C_stub_helpers.args = acc.C_stub_helpers.args @ [ sprintf "&%s" var_name ] }

(* [handle_inout_param ~_ctx ~param_index ~base_type ~acc ~tm p] processes an inout-direction parameter.
   Generates a C variable declaration initialized from the OCaml argument using type-specific
   conversion. The variable is added as a pointer reference in the C function arguments.
   Returns the updated accumulator with declarations, arguments, and updated OCaml index. *)
 let handle_inout_param ~ctx ~param_index ~base_type ~acc ~tm (p : gir_param) =
  let (_ : generation_context) = ctx in
  let ocaml_idx = acc.C_stub_helpers.ocaml_idx + 1 in
  let arg_name = sprintf "arg%d" ocaml_idx in
  let var_name = sprintf "inout%d" (param_index + 1) in
  let init_expr =
    match tm with
    | Some mapping ->
        let param_type =
          { p.param_type with nullable = p.nullable || p.param_type.nullable }
        in
        C_stub_helpers.nullable_ml_to_c_expr ~var:arg_name ~gir_type:param_type
          ~mapping
    | None -> arg_name
  in
  bprintf acc.decls "%s %s = %s;\n" base_type var_name init_expr;
  {
    C_stub_helpers.ocaml_idx = ocaml_idx;
    decls = acc.decls;
    args = acc.args @ [ sprintf "&%s" var_name ];
    cleanups = acc.cleanups;
  }

(* [handle_in_array_param ~ctx ~acc ~arg_name ~base_type ~tm p array_info] processes
    an in-direction array parameter. Generates conversion code from OCaml array to C array,
    producing the C variable name and any required cleanup code. Returns a tuple of
    (c_array_var_name, updated_cleanup_code_list) to be used as function arguments. *)
let handle_in_array_param ~ctx ~acc ~arg_name ~base_type ~tm (p : gir_param)
    (array_info : gir_array) =
  match tm with
  | Some mapping ->
      (* Use element's c:type directly for modifiable local array *)
      let element_c_type = get_element_c_type ~fallback:base_type array_info in
      let conv_code, c_array_var, _length_var, cleanup_code =
        C_stub_helpers.generate_array_ml_to_c ~ctx ~var:arg_name ~array_info
          ~element_mapping:mapping ~element_c_type
          ~transfer_ownership:p.param_type.transfer_ownership
      in
      bprintf acc.C_stub_helpers.decls "    %s\n" conv_code;
      let new_cleanups =
        if String.length cleanup_code > 0 then acc.cleanups @ [ cleanup_code ]
        else acc.cleanups
      in
      (c_array_var, new_cleanups)
  | None -> (arg_name, acc.cleanups)

(* [handle_scalar_param ~arg_name ~ocaml_idx ~length_param_map ~p ~tm] processes
    a scalar (non-array) in-direction parameter. Checks if this is a length parameter
    for another array (via length_param_map), and if so substitutes the length variable.
    Otherwise uses type mapping or returns the argument name. *)
let handle_scalar_param ~arg_name ~ocaml_idx ~length_param_map ~p ~tm =
  match List.assoc_opt ocaml_idx length_param_map with
  | Some length_var -> length_var
  | None ->
      (* Normal parameter handling *)
      match tm with
      | Some mapping ->
          let param_type =
            {
              p.param_type with
              nullable = p.nullable || p.param_type.nullable;
            }
          in
          C_stub_helpers.nullable_ml_to_c_expr ~var:arg_name
            ~gir_type:param_type ~mapping
      | None -> arg_name

(* [handle_in_param ~ctx ~acc ~length_param_map ~base_type ~tm p] processes an in-direction parameter.
   Handles both array and scalar types. For arrays, generates conversion code. For scalars,
   uses type mapping or substitutes length variable from length_param_map. Returns updated
   accumulator with arguments, declarations, and cleanup code. *)
let handle_in_param ~ctx ~acc ~length_param_map ~base_type ~tm (p : gir_param) =
  let ocaml_idx = acc.C_stub_helpers.ocaml_idx + 1 in
  let arg_name = sprintf "arg%d" ocaml_idx in
  match p.param_type.array with
  | Some array_info ->
      let arg_expr, new_cleanups =
        handle_in_array_param ~ctx ~acc ~arg_name ~base_type ~tm p array_info
      in
      {
        C_stub_helpers.ocaml_idx;
        decls = acc.decls;
        args = acc.args @ [ arg_expr ];
        cleanups = new_cleanups;
      }
  | None ->
      let arg_expr =
        handle_scalar_param ~arg_name ~ocaml_idx ~length_param_map ~p ~tm
      in
      {
        C_stub_helpers.ocaml_idx;
        decls = acc.decls;
        args = acc.args @ [ arg_expr ];
        cleanups = acc.cleanups;
      }


(* [convert_out_array ~ctx ~out_array_length_map ~out_array_conversions_buf
                ~parameters ~idx ~var_name p array_info] converts
     an out-direction array parameter from C to OCaml. Looks up the array length from
     out_array_length_map (which maps parameter indices to length parameter indices) and
     uses type mapping for conversion. Appends conversion code to the buffer.
     Returns a tuple of (optional OCaml array variable name, cleanup code list). *)
let convert_out_array ~ctx ~out_array_length_map ~out_array_conversions_buf
    ~parameters ~idx ~var_name (p : gir_param)
    (array_info : gir_array) =
  let element_c_type =
    match array_info.element_type.c_type with
    | Some ct -> ct
    | None ->
        Type_mappings.find_type_mapping_for_gir_type ~ctx
          array_info.element_type
        |> Option.map (fun tm -> tm.c_type)
        |> Option.value ~default:"void"
  in
   let length_expr =
     let* length_idx = List.assoc_opt idx out_array_length_map in
     let* param = safe_nth_opt parameters length_idx in
     Some (var_name_for_direction param.direction length_idx)
   in
   let* _mapping = Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type in
   let conv_code, ml_array_var, cleanup_code =
     C_stub_helpers.generate_array_c_to_ml ~ctx ~var:var_name ~array_info
       ~length_expr ~element_c_type
       ~transfer_ownership:p.param_type.transfer_ownership
   in
    bprintf out_array_conversions_buf "    %s\n" conv_code;
    let cleanups = if String.length cleanup_code > 0 then [ cleanup_code ] else [] in
    Some (Some ml_array_var, cleanups)

(* [convert_out_scalar ~ctx ~_idx ~var_name p] converts a scalar out-parameter from C to OCaml.
   Strips pointer suffix from the type (e.g., "GObject*" -> "GObject") and uses type mapping
   for conversion via nullable_c_to_ml_expr. Returns an optional OCaml value expression,
   or None if no type mapping is found for the parameter type. *)
let convert_out_scalar ~ctx ~_idx ~var_name (p : gir_param) =
  let base_gir_type =
    p.param_type.c_type
    |> Option.map (fun c_type ->
      let stripped = C_stub_helpers.base_c_type_of c_type in
      if String.equal stripped c_type then p.param_type
      else { p.param_type with c_type = Some stripped })
    |> Option.value ~default:p.param_type
  in
  Type_mappings.find_type_mapping_for_gir_type ~ctx base_gir_type
  |> Option.map (fun mapping ->
    C_stub_helpers.nullable_c_to_ml_expr ~ctx ~var:var_name
      ~gir_type:base_gir_type ~mapping ~direction:p.direction ())

(* [process_out_param_conversion ~ctx ~out_array_length_map ~out_array_conversions_buf
                               ~parameters (p, idx)] processes a single out or inout
     parameter for conversion to OCaml. In-direction parameters return None without processing.
     Out and InOut parameters generate conversion code and return the OCaml value expression.
     For arrays, uses array conversion logic; for scalars, uses scalar conversion.
     Returns a tuple of (optional OCaml value expression, cleanup code list). *)
let process_out_param_conversion ~ctx ~out_array_length_map
    ~out_array_conversions_buf ~parameters (p, idx) =
  match p.direction with
  | In -> (None, [])
  | Out | InOut -> (
      let var_name = var_name_for_direction p.direction idx in
      match p.param_type.array with
      | Some array_info ->
          let result, cleanups =
            convert_out_array ~ctx ~out_array_length_map
              ~out_array_conversions_buf ~parameters ~idx
              ~var_name p array_info
            |> Option.value ~default:(None, [])
          in
          (result, cleanups)
      | None ->
          let result = convert_out_scalar ~ctx ~_idx:idx ~var_name p in
          (result, []))

(* [generate_ref_sink_stmt ~transfer_ownership mapping] generates a ref_sink statement
   for GObject types. Returns a newline + g_object_ref_sink call for TransferNone/Floating
   transfer modes (to ensure proper reference counting). Returns empty string for
   TransferFull/TransferContainer (already owned) or if not a GObject type. *)
let generate_ref_sink_stmt ~transfer_ownership mapping =
  mapping.layer2_class
  |> Option.map (fun _ ->
         match transfer_ownership with
         | Types.TransferNone | Types.TransferFloating ->
             "\nif (result) g_object_ref_sink(result);"
         | Types.TransferFull | Types.TransferContainer -> "")
  |> Option.value ~default:""

(* [handle_void_return ~c_name ~args ~out_array_conv_code ~out_array_cleanup_list]
   generates the C call, return statement, and cleanup list for void return functions.
   If out_array_conv_code is non-empty, inserts it after the C call. Returns a tuple of
   (c_call_code, return_statement, cleanup_list). *)
let handle_void_return ~c_name ~args ~out_array_conv_code ~out_conversions ~out_array_cleanup_list =
  let c_call_with_conv =
    if String.length out_array_conv_code > 0 then
      sprintf "%s(%s);\n%s" c_name args out_array_conv_code
    else sprintf "%s(%s);" c_name args
  in
  (c_call_with_conv, C_stub_helpers.build_return_statement ~throws:false None out_conversions, out_array_cleanup_list)

(* [handle_array_return ~ctx ~meth ~c_name ~args ~out_array_conv_code ~ret_type
                       ~out_conversions ~out_array_cleanup_list] handles array return types.
   Generates C call with result variable, extracts element C type from array info, converts
   C array to OCaml using generate_array_c_to_ml, and builds return statement with out-parameter
   conversions. Collects all cleanup code (both out-array and return-array cleanup).
   Returns tuple of (c_call_code, return_conversion_statement, cleanup_list). *)
let handle_array_return ~ctx ~(meth : gir_method) ~c_name ~args ~out_array_conv_code ~ret_type
    ~out_conversions ~out_array_cleanup_list =
  let array_info =
    meth.return_type.array
    |> option_get_exn ~message:"handle_array_return: meth.return_type.array is None - this is a bug in GIR metadata"
  in
  let element_c_type = get_element_c_type ~fallback:ret_type array_info in
  let length_expr = None in
  let conv_code, ml_array_var, array_cleanup =
    C_stub_helpers.generate_array_c_to_ml ~ctx ~var:"result" ~array_info
      ~length_expr ~element_c_type
      ~transfer_ownership:meth.return_type.transfer_ownership
  in
  let c_call_base = sprintf "%s result = %s(%s);" ret_type c_name args in
  let c_call =
    if String.length out_array_conv_code > 0 then
      sprintf "%s\n%s    %s" c_call_base out_array_conv_code conv_code
    else sprintf "%s\n    %s" c_call_base conv_code
  in
  let ret_conv =
    C_stub_helpers.build_return_statement ~throws:meth.throws
      (Some ml_array_var) out_conversions
  in
  let additional_cleanups =
    out_array_cleanup_list
    @ (if String.length array_cleanup > 0 then [ array_cleanup ] else [])
  in
  (c_call, ret_conv, additional_cleanups)

(* [handle_scalar_return ~ctx ~meth ~c_name ~args ~out_array_conv_code ~ret_type
                       ~mapping ~out_conversions ~out_array_cleanup_list] handles scalar return types.
   Generates C call with result variable, converts result from C to OCaml via nullable_c_to_ml_expr,
   adds ref_sink statement if return type is a GObject (to handle Floating transfer semantics),
   and builds return statement with out-parameter conversions. Appends out-array conversion code
   after C call if present. Returns tuple of (c_call_code, return_conversion_statement, cleanup_list). *)
let handle_scalar_return ~ctx ~(meth : gir_method) ~c_name ~args ~out_array_conv_code ~ret_type
    ~mapping ~out_conversions ~out_array_cleanup_list =
  let ml_result =
    C_stub_helpers.nullable_c_to_ml_expr ~ctx ~var:"result"
      ~gir_type:meth.return_type ~mapping ()
  in
  let ref_sink_stmt =
    generate_ref_sink_stmt ~transfer_ownership:meth.return_type.transfer_ownership
      mapping
  in
  let c_call_base =
    sprintf "%s result = %s(%s);%s" ret_type c_name args ref_sink_stmt
  in
  let c_call =
    if String.length out_array_conv_code > 0 then
      sprintf "%s\n%s" c_call_base out_array_conv_code
    else c_call_base
  in
  (c_call,
   C_stub_helpers.build_return_statement ~throws:meth.throws
     (Some ml_result) out_conversions,
   out_array_cleanup_list)

(* [handle_non_void_return ~ctx ~meth ~c_name ~args ~ret_type ~out_array_conv_code
                           ~out_conversions ~out_array_cleanup_list] handles non-void return types.
   Dispatches to array or scalar handlers based on whether return type has array info.
   Raises failwith if no type mapping found for the return type. *)
let handle_non_void_return ~ctx ~(meth : gir_method) ~c_name ~args ~ret_type
    ~out_array_conv_code ~out_conversions ~out_array_cleanup_list =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx meth.return_type with
  | Some mapping -> (
      match meth.return_type.array with
      | Some _array_info ->
          handle_array_return ~ctx ~meth ~c_name ~args ~out_array_conv_code
            ~ret_type ~out_conversions ~out_array_cleanup_list
      | None ->
          handle_scalar_return ~ctx ~meth ~c_name ~args ~out_array_conv_code
            ~ret_type ~mapping ~out_conversions ~out_array_cleanup_list)
  | None ->
      (* No type mapping found - fail with clear error *)
      failwith
        (sprintf
           "No type mapping found for return type: name='%s' c_type='%s' \
            in method %s. This indicates missing type information in the \
            context or GIR metadata."
           meth.return_type.name
           (Option.value meth.return_type.c_type ~default:"<none>")
           meth.c_identifier)

(* [build_return_conversion ~ctx ~meth ~c_name ~args ~ret_type ~out_array_conv_code
                             ~out_conversions ~out_array_cleanup_list] builds the complete return
   conversion for a method. Dispatches to void, array, or scalar handlers based on return type.
   If no type mapping found for non-void return, raises failwith with diagnostic error message.
   Returns tuple of (c_call_code, return_conversion_statement, cleanup_list). *)
let build_return_conversion ~ctx ~(meth : gir_method) ~c_name ~args ~ret_type
    ~out_array_conv_code ~out_conversions ~out_array_cleanup_list =
  match ret_type with
  | Some "void" | None -> handle_void_return ~c_name ~args ~out_array_conv_code ~out_conversions ~out_array_cleanup_list
  | Some ret_type ->
      handle_non_void_return ~ctx ~meth ~c_name ~args ~ret_type
        ~out_array_conv_code ~out_conversions ~out_array_cleanup_list

(* [compute_in_param_indices parameters] counts non-Out parameters to get OCaml indices.
    Returns a list of (param, original_index) pairs for all In and InOut parameters. *)
let compute_in_param_indices (parameters : gir_param list) =
  List.fold_left
    ~f:(fun (idx, acc) (p : gir_param) ->
      match p.direction with
      | Out -> (idx, acc)
      | _ -> (idx + 1, (p, idx) :: acc))
    ~init:(0, []) parameters
  |> snd |> List.rev

(* [build_param_to_ocaml_map parameters] builds a map from parameter index to OCaml index
    for non-Out parameters. Returns a list of (param_idx, ocaml_idx) pairs. *)
let build_param_to_ocaml_map (parameters : gir_param list) =
  List.fold_left
    ~f:(fun (param_idx, ocaml_idx, acc) param ->
      match param.direction with
      | Out -> (param_idx + 1, ocaml_idx, acc)
      | _ -> (param_idx + 1, ocaml_idx + 1, (param_idx, ocaml_idx) :: acc))
    ~init:(0, 0, []) parameters
  |> fun (_, _, acc) -> List.rev acc

(* [extract_length_mappings in_param_indices param_to_ocaml_map]
    For each array param with a length index, maps the length param's OCaml idx to the length var.
    Returns a list of (length_ocaml_idx, length_var_name) pairs. *)
let extract_length_mappings in_param_indices param_to_ocaml_map =
  List.filter_map
    ~f:(fun (p, ocaml_idx) ->
      let* ai = p.param_type.array in
      let* length_idx = ai.length in
      (* Find the OCaml arg index for the length parameter by lookup *)
      let _, length_ocaml_idx = List.find ~f:(fun (idx, _) -> idx = length_idx) param_to_ocaml_map in
      let arg_name = sprintf "arg%d" (ocaml_idx + 1) in
      Some (length_ocaml_idx, arg_name ^ "_length"))
    in_param_indices

(* [build_length_param_map ~meth] builds a map from OCaml argument index to length variable name
    for array parameters. For each array parameter with a length parameter index, computes the
    corresponding OCaml argument index and maps it to a length variable name. This allows length
    parameters to be substituted with computed array lengths instead of passed as separate arguments.
    Only processes non-Out parameters (those visible in OCaml signature).
    Returns a list of (ocaml_idx, length_var_name) pairs. *)
let build_length_param_map ~(meth : gir_method) =
  let in_param_indices = compute_in_param_indices meth.parameters in
  let param_to_ocaml_map = build_param_to_ocaml_map meth.parameters in
  extract_length_mappings in_param_indices param_to_ocaml_map

(* [build_out_array_length_map parameters] builds a map from array parameter index to its length
   parameter index for out/inout direction parameters. For each Out or InOut parameter with array type,
   extracts the length parameter index from array_info and creates a mapping. Used to look up which
   parameter holds the array length when converting out-parameter arrays from C to OCaml.
   Returns a list of (array_param_idx, length_param_idx) pairs. *)
let build_out_array_length_map parameters =
  List.fold_left
    ~f:(fun acc (p, idx) ->
      match (p.direction, p.param_type.array) with
      | (Out | InOut), Some array_info ->
          array_info.length
          |> Option.map (fun length_idx -> (idx, length_idx) :: acc)
          |> Option.value ~default:acc
      | _ -> acc)
    ~init:[]
    (List.mapi ~f:(fun i p -> (p, i)) parameters)

(* [generate_multi_param_function ~ml_name ~params ~param_names body_code]
   generates both native and bytecode C wrapper variants for functions with >5 parameters.
   This eliminates code duplication between generate_c_constructor and generate_c_method.
   Takes the function name, C parameter declarations, parameter names, and body code.
   Returns the combined native + bytecode function code as a string. *)
let generate_multi_param_function ~ml_name ~params ~param_names body_code =
  let param_count = List.length param_names in
  let first_five = List.filteri ~f:(fun i _ -> i < 5) param_names in
  let rest = List.filteri ~f:(fun i _ -> i >= 5) param_names in

  let native_func =
    sprintf
      "\n\
       CAMLexport CAMLprim value %s_native(%s)\n\
       {\n\
       CAMLparam5(%s);\n\
       CAMLxparam%d(%s);\n\
       %s\
       }\n"
      ml_name
      (String.concat ~sep:", " params)
      (String.concat ~sep:", " first_five)
      (param_count - 5)
      (String.concat ~sep:", " rest)
      body_code
  in

  let bytecode_func =
    sprintf
      "\n\
       CAMLexport CAMLprim value %s_bytecode(value * argv, int argn)\n\
       {\n\
       return %s_native(%s);\n\
       }\n"
      ml_name ml_name
      (String.concat ~sep:", "
         (List.mapi ~f:(fun i _ -> sprintf "argv[%d]" i) param_names))
  in

  native_func ^ bytecode_func

(* [build_method_params ~ctx ~meth] processes method parameters to build C declarations,
   arguments, and cleanup code. Handles in/out/inout directions, array conversions,
   and nullable type conversions. Returns a tuple of (out_decls, c_args, param_cleanups). *)
let build_method_params ~ctx ~(meth : gir_method) =
  let length_param_map = build_length_param_map ~meth in

  let init_acc =
    {
      C_stub_helpers.ocaml_idx = 0;
      decls = Buffer.create 128;
      args = [];
      cleanups = [];
    }
  in
  let process_method_param ~ctx ~length_param_map param_index acc p =
    let tm =
      Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type
    in
    let c_type_str = get_c_type_str ~ctx p.param_type in
    let base_type = C_stub_helpers.base_c_type_of c_type_str in
    let new_acc =
      match p.direction with
      | Out -> handle_out_param ~param_index ~base_type ~acc p
      | InOut ->
          handle_inout_param ~ctx ~param_index ~base_type ~acc ~tm p
      | In -> handle_in_param ~ctx ~acc ~length_param_map ~base_type ~tm p
    in
    (new_acc, ())
  in
  let final_acc, _ =
    C_stub_helpers.fold_mapi meth.parameters ~init:init_acc
      ~f:(process_method_param ~ctx ~length_param_map)
  in
  (Buffer.contents final_acc.decls, final_acc.args, final_acc.cleanups)

(* [build_method_call ~meth ~c_name ~c_args] builds the C function call code.
   Returns the complete C call string with any necessary conversion code. *)
let build_method_call ~(meth : gir_method) ~c_name ~c_args =
  let args =
    String.concat ~sep:", " c_args ^ if meth.throws then ", &error" else ""
  in
  sprintf "%s(%s);" c_name args

(* [build_method_return ~ctx ~meth ~c_name ~c_args] handles return value conversion
   from C to OCaml. Generates conversion code for out-parameters and return values.
   Returns a tuple of (c_call_code, return_conversion_statement, cleanup_list). *)
let build_method_return ~ctx ~(meth : gir_method) ~c_name ~c_args =
  let ret_type = meth.return_type.c_type in
  let out_array_length_map = build_out_array_length_map meth.parameters in
  let out_array_conversions_buf = Buffer.create 256 in

  (* Collect out parameter conversions using rev_map for results and concat for cleanups *)
  let params_with_idx = List.mapi ~f:(fun i p -> (p, i)) meth.parameters in
  let results_rev, cleanups_rev =
    List.fold_left
      ~f:(fun (results_rev, cleanups_rev) (p, idx) ->
        let result, new_cleanups =
          process_out_param_conversion ~ctx ~out_array_length_map
            ~out_array_conversions_buf ~parameters:meth.parameters (p, idx)
        in
        match result with
        | Some r -> (r :: results_rev, List.rev_append new_cleanups cleanups_rev)
        | None -> (results_rev, List.rev_append new_cleanups cleanups_rev))
      ~init:([], [])
      params_with_idx
  in
  let out_conversions = List.rev results_rev in
  let out_array_cleanup_list = List.rev cleanups_rev in
   let out_array_conv_code = Buffer.contents out_array_conversions_buf in

   let c_call_code, ret_conv, return_cleanups =
     let args_str =
       String.concat ~sep:", " c_args ^ if meth.throws then ", &error" else ""
     in
     build_return_conversion ~ctx ~meth ~c_name ~args:args_str ~ret_type
       ~out_array_conv_code ~out_conversions ~out_array_cleanup_list
   in
   (c_call_code, ret_conv, return_cleanups)

(* [generate_c_method ~ctx ~c_type meth class_name] generates a C wrapper function for a GIR method.
    Takes self parameter (instance) and processes in/out/inout parameter conversions to/from OCaml.
    Handles C method invocation with proper argument passing, return value conversion (void/array/scalar),
    and post-call cleanup code. Uses length parameter maps for array parameter handling. Supports
    error handling if method throws GError. Generates both native and bytecode (multi-arg) variants
    when parameter count exceeds 5. Returns the complete C function code as a string. *)
let generate_c_method ~ctx ~c_type (meth : gir_method) class_name =
  let c_name = meth.c_identifier in
  let ml_name = Utils.ml_method_name ~class_name meth in
  let in_params =
    List.filter
      ~f:(fun p -> match p.direction with Out -> false | _ -> true)
      meth.parameters
  in
  let param_count = 1 + List.length in_params in
  let params =
    "value self"
    :: List.mapi ~f:(fun i _ -> sprintf "value arg%d" (i + 1)) in_params
  in
  let param_names =
    "self" :: List.mapi ~f:(fun i _ -> sprintf "arg%d" (i + 1)) in_params
  in

  let type_val_macro = sprintf "%s_val" c_type in
  let self_cast = sprintf "%s(self)" type_val_macro in

  (* Build C call - handle nullable parameters *)
  let out_decls, c_args, param_cleanups =
    build_method_params ~ctx ~meth
  in
  (* Add self to c_args *)
  let c_args = self_cast :: c_args in

  (* Build return conversion *)
  let locals = Buffer.create 256 in
  if meth.throws then Buffer.add_string locals "GError *error = NULL;\n";
  Buffer.add_string locals out_decls;
  let locals = Buffer.contents locals in
  let c_call, ret_conv, return_cleanups =
    build_method_return ~ctx ~meth ~c_name ~c_args
  in

  (* Emit cleanup code for arrays (both parameter and return cleanups) *)
  let all_cleanups = param_cleanups @ return_cleanups in
  let cleanup_section =
    if List.length all_cleanups > 0 then
      "\n    " ^ String.concat ~sep:"\n    " all_cleanups
    else ""
  in

  (* For functions with >5 parameters, generate both bytecode and native variants *)
  if param_count > 5 then
    let body_code =
      sprintf "%s\n%s%s\n%s"
        locals c_call cleanup_section ret_conv
    in
    generate_multi_param_function ~ml_name ~params ~param_names body_code
  else
    sprintf
      "\n\
       CAMLexport CAMLprim value %s(%s)\n\
       {\n\
       CAMLparam%d(%s);\n\
       %s\n\
       %s%s\n\
       %s\n\
       }\n"
      ml_name
      (String.concat ~sep:", " params)
      param_count
      (String.concat ~sep:", " param_names)
      locals c_call cleanup_section ret_conv
