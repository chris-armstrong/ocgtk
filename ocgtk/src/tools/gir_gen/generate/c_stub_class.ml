(* C Stub Code Generation - Class/Interface Support *)

open Printf
open Containers
open StdLabels
open Types

(* Helper to get C type string from a gir_type, falling back to type mapping *)
let get_c_type_str ~ctx (gir_type : gir_type) =
  match gir_type.c_type with
  | Some c_type -> c_type
  | None ->
      Option.bind (Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type)
        (fun tm -> Some tm.c_type)
      |> Option.value ~default:"void"

(* Helper to get element C type from array info *)
let get_element_c_type ~fallback (array_info : gir_array) =
  array_info.element_type.c_type |> Option.value ~default:fallback

(* Generate variable name based on parameter direction and index *)
let var_name_for_direction direction idx =
  match direction with
  | Out -> sprintf "out%d" (idx + 1)
  | InOut -> sprintf "inout%d" (idx + 1)
  | In -> sprintf "arg%d" (idx + 1)

(* Handle Out parameter - generates declaration and returns updated accumulator *)
let handle_out_param ~param_index ~base_type ~acc (p : gir_param) =
  let var_name = sprintf "out%d" (param_index + 1) in
  let is_array = Option.is_some p.param_type.array in
  (* Out-parameter array: declare as pointer; regular: declare as value *)
  if is_array then
    bprintf acc.C_stub_helpers.decls "%s* %s = NULL;\n" base_type var_name
  else bprintf acc.C_stub_helpers.decls "%s %s;\n" base_type var_name;
  { acc with C_stub_helpers.args = acc.C_stub_helpers.args @ [ sprintf "&%s" var_name ] }

(* Handle InOut parameter - generates declaration with init and returns updated accumulator *)
let handle_inout_param ~_ctx ~param_index ~base_type ~acc ~tm (p : gir_param) =
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

(* Handle In parameter with array type *)
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

(* Handle In parameter (scalar or array) *)
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
      (* Check if this is a length parameter for another array *)
      let arg_expr =
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
      in
      {
        C_stub_helpers.ocaml_idx;
        decls = acc.decls;
        args = acc.args @ [ arg_expr ];
        cleanups = acc.cleanups;
      }

(* Strip pointer suffix from C type string if present *)
let strip_pointer_suffix c_type =
  if
    String.length c_type > 0
    && String.equal
         (String.sub c_type ~pos:(String.length c_type - 1) ~len:1)
         "*"
  then String.sub c_type ~pos:0 ~len:(String.length c_type - 1)
  else c_type

(* Convert out-parameter array to ML value *)
let convert_out_array ~ctx ~out_array_length_map ~out_array_conversions_buf
    ~out_array_cleanups ~parameters ~idx ~var_name (p : gir_param)
    (array_info : gir_array) =
  let element_c_type =
    match array_info.element_type.c_type with
    | Some ct -> ct
    | None ->
        Option.bind
          (Type_mappings.find_type_mapping_for_gir_type ~ctx
             array_info.element_type)
          (fun tm -> Some tm.c_type)
        |> Option.value ~default:"void"
  in
  let length_expr =
    Option.bind (List.assoc_opt idx out_array_length_map)
      (fun length_idx ->
        Option.bind (List.nth_opt parameters length_idx)
          (fun param -> Some (var_name_for_direction param.direction length_idx)))
  in
  Option.bind
    (Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type)
    (fun _mapping ->
      let conv_code, ml_array_var, cleanup_code =
        C_stub_helpers.generate_array_c_to_ml ~ctx ~var:var_name ~array_info
          ~length_expr ~element_c_type
          ~transfer_ownership:p.param_type.transfer_ownership
      in
      bprintf out_array_conversions_buf "    %s\n" conv_code;
      if String.length cleanup_code > 0 then
        out_array_cleanups := !out_array_cleanups @ [ cleanup_code ];
      Some ml_array_var)

(* Convert scalar out-parameter to ML value *)
let convert_out_scalar ~ctx ~_idx ~var_name (p : gir_param) =
  let base_gir_type =
    Option.bind p.param_type.c_type (fun c_type ->
      let stripped = strip_pointer_suffix c_type in
      if String.equal stripped c_type then Some p.param_type
      else Some { p.param_type with c_type = Some stripped })
    |> Option.value ~default:p.param_type
  in
  Option.bind (Type_mappings.find_type_mapping_for_gir_type ~ctx base_gir_type)
    (fun mapping ->
      Some
        (C_stub_helpers.nullable_c_to_ml_expr ~ctx ~var:var_name
           ~gir_type:base_gir_type ~mapping ~direction:p.direction ()))

(* Process a single out/inout parameter for return conversion *)
let process_out_param_conversion ~ctx ~out_array_length_map
    ~out_array_conversions_buf ~out_array_cleanups ~parameters (p, idx) =
  match p.direction with
  | In -> None
  | Out | InOut -> (
      let var_name = var_name_for_direction p.direction idx in
      match p.param_type.array with
      | Some array_info ->
          convert_out_array ~ctx ~out_array_length_map
            ~out_array_conversions_buf ~out_array_cleanups ~parameters ~idx
            ~var_name p array_info
      | None -> convert_out_scalar ~ctx ~_idx:idx ~var_name p)

(* Generate ref_sink statement for GObject types based on transfer-ownership *)
let generate_ref_sink_stmt ~transfer_ownership mapping =
  mapping.layer2_class
  |> Option.map (fun _ ->
         match transfer_ownership with
         | Types.TransferNone | Types.TransferFloating ->
             "\nif (result) g_object_ref_sink(result);"
         | Types.TransferFull | Types.TransferContainer -> "")
  |> Option.value ~default:""

(* Handle void return type *)
let handle_void_return ~c_name ~args ~out_array_conv_code ~out_array_cleanup_list =
  let c_call_with_conv =
    if String.length out_array_conv_code > 0 then
      sprintf "%s(%s);\n%s" c_name args out_array_conv_code
    else sprintf "%s(%s);" c_name args
  in
  (c_call_with_conv, C_stub_helpers.build_return_statement ~throws:false None [], out_array_cleanup_list)

(* Handle array return type *)
let handle_array_return ~ctx ~(meth : gir_method) ~c_name ~args ~out_array_conv_code ~ret_type
    ~out_conversions ~out_array_cleanup_list =
  let array_info =
    match meth.return_type.array with
    | Some ai -> ai
    | None -> failwith "Array return type without array info"
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

(* Handle scalar return type *)
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

(* Build return conversion for a method *)
let build_return_conversion ~ctx ~(meth : gir_method) ~c_name ~args ~ret_type
    ~out_array_conv_code ~out_conversions ~out_array_cleanup_list =
  match ret_type with
  | Some "void" | None -> handle_void_return ~c_name ~args ~out_array_conv_code ~out_array_cleanup_list
  | Some ret_type -> (
      match
        Type_mappings.find_type_mapping_for_gir_type ~ctx meth.return_type
      with
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
               meth.c_identifier))

(* Build a map from OCaml arg index to length variable name for array parameters.
   This is used to substitute length parameters with computed array lengths. *)
let build_length_param_map ~(meth : gir_method) =
  (* Count non-Out parameters to get OCaml indices *)
  let in_param_indices =
    List.fold_left
      ~f:(fun (idx, acc) (p : gir_param) ->
        match p.direction with
        | Out -> (idx, acc)
        | _ -> (idx + 1, (p, idx) :: acc))
      ~init:(0, []) meth.parameters
    |> snd |> List.rev
  in
  (* For each array param with a length index, map the length param's OCaml idx to the length var *)
  List.filter_map
    ~f:(fun (p, ocaml_idx) ->
      Option.bind (Option.bind p.param_type.array (fun ai -> ai.length))
        (fun length_idx ->
          (* Find which OCaml arg index corresponds to the length parameter *)
          let length_ocaml_idx = ref None in
          let current_idx = ref 0 in
          List.iteri meth.parameters ~f:(fun param_idx param ->
              match param.direction with
              | Out -> ()
              | _ ->
                  if param_idx = length_idx then
                    length_ocaml_idx := Some !current_idx;
                  current_idx := !current_idx + 1);
          Option.bind !length_ocaml_idx (fun len_idx ->
            let arg_name = sprintf "arg%d" (ocaml_idx + 1) in
            Some (len_idx, arg_name ^ "_length"))))
    in_param_indices

(* Build a map from array parameter index to its length parameter index *)
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

let generate_c_constructor ~ctx ~c_type ~class_name (ctor : gir_constructor) =
  let c_name = ctor.c_identifier in
  let ml_name = Utils.ml_constructor_name ~class_name ~constructor:ctor in

  let val_macro = sprintf "Val_%s" c_type in
  let var_name = "obj" in

  (* Check if this is a GObject constructor - for GObjects, always ref_sink *)
  let ref_sink_stmt =
    (* Try to look up the type mapping for the constructor's return type *)
    let dummy_gir_type =
      {
        name = c_type;
        c_type = Some (c_type ^ "*");
        nullable = false;
        transfer_ownership = Types.TransferNone;
        array = None;
      }
    in
    match Type_mappings.find_type_mapping_for_gir_type ~ctx dummy_gir_type with
    | Some mapping when Option.is_some mapping.layer2_class ->
        (* This is a GObject type (class or interface) - always need ref_sink for constructors *)
        sprintf "\nif (%s) g_object_ref_sink(%s);" var_name var_name
    | _ -> ""
  in

  (* Generate parameters *)
  let param_count, params, param_names =
    match List.length ctor.ctor_parameters with
    | 0 -> (1, [ "value unit" ], [ "unit" ])
    | n ->
        let params =
          List.mapi
            ~f:(fun i _ -> sprintf "value arg%d" (i + 1))
            ctor.ctor_parameters
        in
        let param_names =
          List.mapi ~f:(fun i _ -> sprintf "arg%d" (i + 1)) ctor.ctor_parameters
        in
        (n, params, param_names)
  in

  (* Build C call arguments - handle nullable parameters *)
  let c_args =
    List.mapi
      ~f:(fun i p ->
        match Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type with
        | Some mapping ->
            let param_type =
              {
                p.param_type with
                nullable = p.nullable || p.param_type.nullable;
              }
            in
            C_stub_helpers.nullable_ml_to_c_expr
              ~var:(sprintf "arg%d" (i + 1))
              ~gir_type:param_type ~mapping
        | None -> sprintf "arg%d" (i + 1))
      ctor.ctor_parameters
  in

  (* Append error parameter if constructor throws *)
  let c_call_args =
    String.concat ~sep:", " (c_args @ if ctor.throws then [ "&error" ] else [])
  in

  (* Handle >5 parameters with bytecode/native variants *)
  if param_count > 5 then begin
    let first_five = List.filteri ~f:(fun i _ -> i < 5) param_names in
    let rest = List.filteri ~f:(fun i _ -> i >= 5) param_names in

    let error_decl =
      if ctor.throws then "GError *error = NULL;\n    " else ""
    in
    let return_stmt =
      if ctor.throws then
        sprintf
          "if (error == NULL) CAMLreturn(Res_Ok(%s(%s))); else \
           CAMLreturn(Res_Error(Val_GError(error)));"
          val_macro var_name
      else sprintf "CAMLreturn(%s(%s));" val_macro var_name
    in

    let native_func =
      sprintf
        "\n\
         CAMLexport CAMLprim value %s_native(%s)\n\
         {\n\
         CAMLparam5(%s);\n\
         CAMLxparam%d(%s);\n\
         %s%s *%s = %s(%s);%s\n\
         %s\n\
         }\n"
        ml_name
        (String.concat ~sep:", " params)
        (String.concat ~sep:", " first_five)
        (param_count - 5)
        (String.concat ~sep:", " rest)
        error_decl c_type var_name c_name c_call_args ref_sink_stmt return_stmt
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
  end
  else begin
    let error_decl =
      if ctor.throws then "GError *error = NULL;\n    " else ""
    in
    let return_stmt =
      if ctor.throws then
        sprintf
          "if (error == NULL) CAMLreturn(Res_Ok(%s(%s))); else \
           CAMLreturn(Res_Error(Val_GError(error)));"
          val_macro var_name
      else sprintf "CAMLreturn(%s(%s));" val_macro var_name
    in

    sprintf
      "\n\
       CAMLexport CAMLprim value %s(%s)\n\
       {\n\
       CAMLparam%d(%s);\n\
       %s%s *%s = %s(%s);%s\n\
       %s\n\
       }\n"
      ml_name
      (String.concat ~sep:", " params)
      param_count
      (String.concat ~sep:", " param_names)
      error_decl c_type var_name c_name c_call_args ref_sink_stmt return_stmt
  end

(* Helper: Build mapping of array parameter indices to their length parameter variables *)
let build_length_param_map ~(meth : gir_method) =
  let find_in_param_index target_idx =
    let count = ref (-1) in
    List.iteri meth.parameters ~f:(fun idx param ->
        match param.direction with
        | Out -> ()
        | _ ->
            count := !count + 1;
            if idx = target_idx then ());
    if !count >= 0 then Some !count else None
  in
  let array_ocaml_idx p =
    let count = ref (-1) in
    List.iter meth.parameters ~f:(fun param ->
        match param.direction with
        | Out -> ()
        | _ ->
            count := !count + 1;
            if Stdlib.( == ) param p then ());
    if !count >= 0 then Some !count else None
  in
  List.fold_left
    ~f:(fun acc (p : gir_param) ->
      match p.param_type.array with
      | Some array_info -> (
          match array_info.length with
          | Some length_idx -> (
              match find_in_param_index length_idx with
              | Some in_param_idx -> (
                  match array_ocaml_idx p with
                  | Some idx ->
                      let arg_name = sprintf "arg%d" (idx + 1) in
                      let length_var = arg_name ^ "_length" in
                      (in_param_idx, length_var) :: acc
                  | None -> acc)
              | None -> acc)
          | None -> acc)
      | None -> acc)
    ~init:[] meth.parameters

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
    (* Build map: OCaml arg index -> length variable name for array length params *)
    let length_param_map = build_length_param_map ~meth in

    let init_acc =
      {
        C_stub_helpers.ocaml_idx = 0;
        decls = Buffer.create 128;
        args = [];
        cleanups = [];
      }
    in
    let final_acc, _ =
      C_stub_helpers.fold_mapi meth.parameters ~init:init_acc
        ~f:(fun param_index (acc : C_stub_helpers.param_acc) (p : gir_param) ->
          let tm =
            Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type
          in
          let c_type_str = get_c_type_str ~ctx p.param_type in
          let base_type = C_stub_helpers.base_c_type_of c_type_str in
          let new_acc =
            match p.direction with
            | Out -> handle_out_param ~param_index ~base_type ~acc p
            | InOut ->
                handle_inout_param ~_ctx:ctx ~param_index ~base_type ~acc ~tm p
            | In -> handle_in_param ~ctx ~acc ~length_param_map ~base_type ~tm p
          in
          (new_acc, ()))
    in
    ( Buffer.contents final_acc.decls,
      self_cast :: final_acc.args,
      final_acc.cleanups )
  in

  (* Build return conversion *)
  let ret_type = meth.return_type.c_type in
  let locals = Buffer.create 256 in
  if meth.throws then Buffer.add_string locals "GError *error = NULL;\n";
  Buffer.add_string locals out_decls;
  let locals = Buffer.contents locals in
  let c_call, ret_conv, return_cleanups =
    let args =
      String.concat ~sep:", " c_args ^ if meth.throws then ", &error" else ""
    in

    (* Build map of out-parameter array lengths *)
    let out_array_length_map = build_out_array_length_map meth.parameters in

    (* Generate conversion code and cleanup for out-parameter arrays *)
    let out_array_conversions_buf = Buffer.create 256 in
    let out_array_cleanups = ref [] in

    let out_conversions =
      List.filter_map
        ~f:
          (process_out_param_conversion ~ctx ~out_array_length_map
             ~out_array_conversions_buf ~out_array_cleanups
             ~parameters:meth.parameters)
        (List.mapi ~f:(fun i p -> (p, i)) meth.parameters)
    in

    (* Get out-array conversion code and cleanups *)
    let out_array_conv_code = Buffer.contents out_array_conversions_buf in
    let out_array_cleanup_list = !out_array_cleanups in

    build_return_conversion ~ctx ~meth ~c_name ~args ~ret_type
      ~out_array_conv_code ~out_conversions ~out_array_cleanup_list
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
    let first_five = List.filteri ~f:(fun i _ -> i < 5) param_names in
    let rest = List.filteri ~f:(fun i _ -> i >= 5) param_names in

    let native_func =
      sprintf
        "\n\
         CAMLexport CAMLprim value %s_native(%s)\n\
         {\n\
         CAMLparam5(%s);\n\
         CAMLxparam%d(%s);\n\
         %s\n\
         %s%s\n\
         %s\n\
         }\n"
        ml_name
        (String.concat ~sep:", " params)
        (String.concat ~sep:", " first_five)
        (param_count - 5)
        (String.concat ~sep:", " rest)
        locals c_call cleanup_section ret_conv
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

(* Default type mapping for when no mapping is found *)
let default_type_mapping =
  {
    ocaml_type = "unit";
    c_to_ml = "Val_unit";
    ml_to_c = "Unit_val";
    needs_copy = false;
    layer2_class = None;
    c_type = "void";
  }

let generate_c_property_getter ~ctx ~c_type (prop : gir_property) class_name =
  let ml_name = Utils.ml_property_name ~class_name prop in

  (* Determine property type mapping *)
  let type_info =
    Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type
    |> Option.value ~default:default_type_mapping
  in

  let ml_prop_value =
    C_stub_helpers.nullable_c_to_ml_expr ~ctx ~var:"prop_value"
      ~gir_type:prop.prop_type ~mapping:type_info ()
  in
  let prop_info = C_stub_helpers.analyze_property_type ~ctx prop.prop_type in
  let c_cast = sprintf "%s_val" c_type in
  let c_type_name = get_c_type_str ~ctx prop.prop_type in
  let prop_pointer = if prop_info.stack_allocated then "" else "*" in
  let prop_decl = sprintf "    %s %sprop_value;\n" c_type_name prop_pointer in
  let gvalue_assignment =
    C_stub_helpers.generate_gvalue_getter_assignment ~ml_name ~prop ~c_type_name
      ~prop_info
  in
  sprintf
    "\n\
     CAMLexport CAMLprim value %s(value self)\n\
     {\n\
     CAMLparam1(self);\n\
     CAMLlocal1(result);\n\
     %s *obj = (%s *)%s(self);\n\
     %sGParamSpec *pspec = \
     g_object_class_find_property(G_OBJECT_GET_CLASS(obj), \"%s\");\n\
     if (pspec == NULL) caml_failwith(\"%s: property '%s' not found\");\n\
     GValue prop_gvalue = G_VALUE_INIT;\n\
     g_value_init(&prop_gvalue, pspec->value_type);\n\
     g_object_get_property(G_OBJECT(obj), \"%s\", &prop_gvalue);\n\
     %s\n\
     result = %s;\n\
     g_value_unset(&prop_gvalue);\n\
     CAMLreturn(result);\n\
     }\n"
    ml_name c_type c_type c_cast prop_decl prop.prop_name ml_name prop.prop_name
    prop.prop_name gvalue_assignment ml_prop_value

let generate_c_property_setter ~ctx ~c_type (prop : gir_property) class_name =
  let prop_name_cleaned =
    String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name
  in
  let prop_snake = Utils.to_snake_case prop_name_cleaned in
  let class_snake = Utils.to_snake_case class_name in
  let ml_name = sprintf "ml_gtk_%s_set_%s" class_snake prop_snake in

  let prop_info = C_stub_helpers.analyze_property_type ~ctx prop.prop_type in

  (* Determine property type mapping *)
  let type_info =
    Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type
    |> Option.value ~default:default_type_mapping
  in

  let c_value_expr =
    C_stub_helpers.nullable_ml_to_c_expr ~var:"new_value"
      ~gir_type:prop.prop_type ~mapping:type_info
  in

  (* Check if prop is a string type for const string declaration *)
  let is_string_type =
    Option.bind prop.prop_type.c_type (fun ct ->
      Some (List.exists ~f:(fun s -> String.equal s ct)
        [ "gchar*"; "gchararray"; "utf8"; "const gchar*"; "const char*" ]))
    |> Option.value ~default:false
  in
  let value_declaration =
    if is_string_type then
      sprintf "    ML_DECL_CONST_STRING(c_value, %s);\n" c_value_expr
    else
      let pointer_prefix = if prop_info.stack_allocated then "" else "*" in
      sprintf "    %s %sc_value = %s;\n" type_info.c_type pointer_prefix
        c_value_expr
  in

  let c_cast = sprintf "%s_val" c_type in
  let setter_assignment =
    C_stub_helpers.generate_gvalue_setter_assignment ~ml_name ~prop ~prop_info
  in

  sprintf
    "\n\
     CAMLexport CAMLprim value %s(value self, value new_value)\n\
     {\n\
     CAMLparam2(self, new_value);\n\
     %s *obj = (%s *)%s(self);\n\
     %sGParamSpec *pspec = \
     g_object_class_find_property(G_OBJECT_GET_CLASS(obj), \"%s\");\n\
     if (pspec == NULL) caml_failwith(\"%s: property '%s' not found\");\n\
     GValue prop_gvalue = G_VALUE_INIT;\n\
     g_value_init(&prop_gvalue, pspec->value_type);\n\
     %sg_object_set_property(G_OBJECT(obj), \"%s\", &prop_gvalue);\n\
     g_value_unset(&prop_gvalue);\n\
     CAMLreturn(Val_unit);\n\
     }\n"
    ml_name c_type c_type c_cast value_declaration prop.prop_name ml_name
    prop.prop_name setter_assignment prop.prop_name

(* Generate complete C file for a single class/interface *)
let generate_class_c_code ~ctx ~c_type class_name constructors methods
    properties =
  let buf = Buffer.create 4096 in

  (* Add header *)
  Buffer.add_string buf
    (C_stub_helpers.generate_c_file_header ~ctx ~class_name
       ~external_enums:ctx.external_enums
       ~external_bitfields:ctx.external_bitfields ());

  (* Note: Record-specific conversions are generated in generate_record_c_code, not here *)

  (* Constructors - skip those that throw GError, are variadic, have cross-namespace types, or have array params *)
  List.iter
    ~f:(fun ctor ->
      if
        (not ctor.throws)
        && (not (Filtering.constructor_has_varargs ctor))
        && (not (Filtering.constructor_has_cross_namespace_types ~ctx ctor))
        && not (Filtering.constructor_has_array_params ctor)
      then
        Buffer.add_string buf
          (generate_c_constructor ~ctx ~c_type ~class_name ctor))
    constructors;

  (* Generate methods, skip duplicates *)
  List.iter
    ~f:(fun (meth : gir_method) ->
      let should_skip = Filtering.should_skip_method_binding ~ctx meth in
      if not should_skip then
        Buffer.add_string buf (generate_c_method ~ctx ~c_type meth class_name))
    (List.rev methods);

  (* Generate property getters and setters *)
  List.iter
    ~f:(fun (prop : gir_property) ->
      if Filtering.should_generate_property ~ctx ~class_name ~methods prop then begin
        if prop.readable then
          Buffer.add_string buf
            (generate_c_property_getter ~ctx ~c_type prop class_name);
        if prop.writable && not prop.construct_only then
          Buffer.add_string buf
            (generate_c_property_setter ~ctx ~c_type prop class_name)
      end)
    properties;

  Buffer.contents buf

let generate_forward_decls ~classes ~interfaces =
  let buf = Buffer.create 2048 in
  let seen = Hashtbl.create 97 in

  Buffer.add_string buf "/* Class-specific conversion macros (shared) */\n";
  List.iter
    ~f:(fun (cls : gir_class) ->
      if not (Hashtbl.mem seen cls.c_type) then begin
        Hashtbl.add seen cls.c_type ();
        bprintf buf "#ifndef Val_%s\n" cls.c_type;
        bprintf buf "#define %s_val(val) ((%s*)ml_gobject_ext_of_val(val))\n"
          cls.c_type cls.c_type;
        bprintf buf
          "#define Val_%s(obj) ((value)(ml_gobject_val_of_ext(obj)))\n"
          cls.c_type;
        bprintf buf "#endif /* Val_%s */\n\n" cls.c_type
      end)
    classes;
  (* Add interface conversion macros *)
  Buffer.add_string buf "/* Interface-specific conversion macros (shared) */\n";
  List.iter
    ~f:(fun (intf : gir_interface) ->
      if not (Hashtbl.mem seen intf.c_type) then begin
        Hashtbl.add seen intf.c_type ();
        bprintf buf "#ifndef Val_%s\n" intf.c_type;
        bprintf buf "#define %s_val(val) ((%s*)ml_gobject_ext_of_val(val))\n"
          intf.c_type intf.c_type;
        bprintf buf
          "#define Val_%s(obj) ((value)(ml_gobject_val_of_ext(obj)))\n"
          intf.c_type;
        bprintf buf "#endif /* Val_%s */\n\n" intf.c_type
      end)
    interfaces;

  Buffer.contents buf
