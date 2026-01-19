(* C Stub Code Generation - Constructor Support *)

open Printf
open Containers
open StdLabels
open Types

module Log =
  (val Logs.src_log
         (Logs.Src.create "gir_gen.c_stub_constructor"
            ~doc:"C stub code generation for constructor support"))

(* [generate_constructor_error_decl ~throws] generates error declaration if constructor throws.
   Returns "GError *error = NULL;\n    " if throws=true, otherwise returns empty string. *)
let generate_constructor_error_decl ~throws =
  if throws then "GError *error = NULL;\n    " else ""

(* [generate_constructor_return_stmt ~throws ~val_macro ~var_name] generates return statement
   based on throws flag. If throws=true, generates conditional return handling error.
   Otherwise generates simple CAMLreturn with converted value. *)
let generate_constructor_return_stmt ~throws ~val_macro ~var_name =
  if throws then
    sprintf
      "if (error == NULL) CAMLreturn(Res_Ok(%s(%s))); else \
       CAMLreturn(Res_Error(Val_GError(error)));"
      val_macro var_name
  else sprintf "CAMLreturn(%s(%s));" val_macro var_name

(* [generate_constructor_c_call_args ~ctx ~class_name ~constructor ctor_parameters] builds C call arguments
   with nullable handling. For each parameter, looks up type mapping and generates
   appropriate conversion expression. Returns list of C argument expressions. *)
let generate_constructor_c_call_args ~ctx ~class_name ~constructor:(constructor : gir_constructor) ctor_parameters =
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
      | None ->
          (* No type mapping found - fail with clear error at compile time *)
          failwith
            (sprintf
               "No type mapping found for constructor parameter %d: name='%s' c_type='%s' \
                in constructor %s of class %s. This indicates missing type information in the \
                context or GIR metadata."
               (i + 1)
               p.param_type.name
               (Option.value p.param_type.c_type ~default:"<none>")
               constructor.c_identifier
               class_name))
     ctor_parameters

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

(* [build_constructor_params ctor_parameters] builds C parameter declarations and names.
   Returns tuple of (param_count, params_list, param_names_list).
   Handles the zero-parameter case with a unit parameter. *)
let build_constructor_params ctor_parameters =
  match List.length ctor_parameters with
  | 0 -> (1, [ "value unit" ], [ "unit" ])
  | n ->
      let params =
        List.mapi ~f:(fun i _ -> sprintf "value arg%d" (i + 1)) ctor_parameters
      in
      let param_names =
        List.mapi ~f:(fun i _ -> sprintf "arg%d" (i + 1)) ctor_parameters
      in
      (n, params, param_names)

(* [build_constructor_call c_args throws] constructs the C function call argument string.
   Combines converted C arguments with optional error parameter for throwing constructors.
   Returns the complete argument list as a comma-separated string. *)
let build_constructor_call c_args throws =
  let base_args = String.concat ~sep:", " c_args in
  if throws then String.concat ~sep:", " [ base_args; "&error" ] else base_args

(* [build_constructor_return ~c_type ~class_name ctor param_count params param_names c_call_args ref_sink_stmt val_macro var_name]
    generates the complete C constructor function including error handling and return logic.
    Handles both the >5 parameter case (using generate_multi_param_function) and the normal case.
    Returns the complete C function code as a string. *)
let build_constructor_return ~c_type ~class_name (ctor : gir_constructor) param_count params param_names c_call_args ref_sink_stmt val_macro var_name =
  let c_name = ctor.c_identifier in
  let throws = ctor.throws in
  let error_decl = generate_constructor_error_decl ~throws in
  let return_stmt = generate_constructor_return_stmt ~throws ~val_macro ~var_name in

  if param_count > 5 then
    let body_code =
      sprintf "%s%s *%s = %s(%s);%s\n%s"
        error_decl c_type var_name c_name c_call_args ref_sink_stmt return_stmt
    in
    generate_multi_param_function ~ml_name:(Utils.ml_constructor_name ~class_name ~constructor:ctor)
      ~params ~param_names body_code
  else
    sprintf
      "\n\
       CAMLexport CAMLprim value %s(%s)\n\
       {\n\
       CAMLparam%d(%s);\n\
       %s%s *%s = %s(%s);%s\n\
       %s\n\
       }\n"
      (Utils.ml_constructor_name ~class_name ~constructor:ctor)
      (String.concat ~sep:", " params)
      param_count
      (String.concat ~sep:", " param_names)
      error_decl c_type var_name c_name c_call_args ref_sink_stmt return_stmt

(* [generate_c_constructor ~ctx ~c_type ~class_name ctor] generates a C wrapper function
   for a GIR constructor. Handles parameter conversion from OCaml to C types, C constructor
   invocation, ref_sink for GObject types (to handle Floating transfer semantics), and
   conversion of result to OCaml. Supports error handling if constructor throws. Generates
   both native and bytecode (multi-arg) variants when parameter count exceeds 5. Returns
   the complete C function code as a string. *)
let generate_c_constructor ~ctx ~c_type ~class_name (ctor : gir_constructor) =
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

  (* Build C parameter declarations and names *)
  let param_count, params, param_names = build_constructor_params ctor.ctor_parameters in

  (* Build C call arguments - handle nullable parameters *)
  let c_args = generate_constructor_c_call_args ~ctx ~class_name ~constructor:ctor ctor.ctor_parameters in

  (* Build constructor call string with error parameter if needed *)
  let c_call_args = build_constructor_call c_args ctor.throws in

  (* Build the complete constructor function with return handling *)
  build_constructor_return ~c_type ~class_name ctor param_count params param_names
    c_call_args ref_sink_stmt val_macro var_name
