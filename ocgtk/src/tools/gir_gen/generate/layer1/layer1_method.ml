(* Layer 1 Method - Method generation for OCaml interfaces *)

open StdLabels
open Printf
open Types
open C_stub_helpers

(** Check if a method should be generated in the interface *)
let should_generate_method ~ctx ~is_record (meth : gir_method) =
  let has_excluded_type =
    Exclude_list.is_excluded_type_name meth.return_type.name
  in
  not
    (Exclude_list.is_variadic_function meth.method_name
    || has_excluded_type
    || Exclude_list.should_skip_method
         ~find_type_mapping:(Type_mappings.find_type_mapping_for_gir_type ~ctx)
         ~enums:ctx.enums ~bitfields:ctx.bitfields meth
    || (is_record && is_copy_or_free meth))

(** Build the OCaml method signature type string *)
let build_method_signature ~ctx ~class_name (meth : gir_method) =
  let param_types =
    List.filter_map
      ~f:(Layer1_helpers.convert_method_param_to_ocaml_type ~ctx ~class_name)
      meth.parameters
  in

  let ret_type_ocaml =
    if Utils.is_void_return_type meth.return_type then "unit"
    else
      Type_resolution.map_gir_type_to_ocaml ~ctx ~class_name
        ~gir_type:meth.return_type ~is_nullable:meth.return_type.nullable
  in

  let out_types =
    List.filter_map
      ~f:(Layer1_helpers.convert_out_param_to_ocaml_type ~ctx ~class_name)
      meth.parameters
  in

  let final_ret_type =
    Layer1_helpers.combine_return_and_out_types ret_type_ocaml out_types
  in
  let final_ret_type =
    if meth.throws then sprintf "(%s, GError.t) result" final_ret_type
    else final_ret_type
  in
  String.concat ~sep:" -> " ([ "t" ] @ param_types @ [ final_ret_type ])

(** Format an external method declaration with bytecode/native support for >5
    parameters *)
let format_method_external ~buf ~ocaml_name ~ml_name ~param_count ~full_type =
  if param_count > 5 then
    bprintf buf "external %s : %s = \"%s_bytecode\" \"%s_native\"\n\n"
      ocaml_name full_type ml_name ml_name
  else bprintf buf "external %s : %s = \"%s\"\n\n" ocaml_name full_type ml_name

(** Generate a single method declaration and write it to the buffer *)
let generate_method_decl ~ctx ~class_name ~c_type ~c_symbol_prefix ~is_record
    ~buf (meth : gir_method) =
  let ml_name = Utils.ml_method_name ~class_name meth in
  let ocaml_name =
    Utils.ocaml_function_name ~class_name ~c_type ?c_symbol_prefix
      meth.method_name
  in
  let in_params =
    List.filter ~f:(fun p -> p.direction <> Out) meth.parameters
  in
  let param_count = 1 + List.length in_params in

  if should_generate_method ~ctx ~is_record meth then begin
    (match meth.doc with
    | Some doc -> bprintf buf "(** %s *)\n" (Utils.sanitize_doc doc)
    | None -> ());

    let full_type = build_method_signature ~ctx ~class_name meth in
    format_method_external ~buf ~ocaml_name ~ml_name ~param_count ~full_type
  end
