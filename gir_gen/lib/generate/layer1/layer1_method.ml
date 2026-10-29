(* Layer 1 Method - Method generation for OCaml interfaces *)

open StdLabels
open Gen_buffer
open Types

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
      Layer1_helpers.map_gir_type_to_ocaml ~ctx ~class_name
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
    if meth.throws then Fmt.str "(%s, GError.t) result" final_ret_type
    else final_ret_type
  in
  String.concat ~sep:" -> " ([ "t" ] @ param_types @ [ final_ret_type ])

(** Format an external method declaration with bytecode/native support for >5
    parameters *)
let format_method_external ~buf ~ocaml_name ~ml_name ~param_count ~full_type =
  bprintf buf "%s"
    (Layer1_helpers.format_external ~ocaml_name ~signature:full_type ~ml_name
       ~param_count)

(** Generate a single method declaration and write it to the buffer. The caller
    selects the methods ({!Emitted_members.l1_methods}). *)
let generate_method_decl ~ctx ~class_name ~c_type ~c_symbol_prefix ~buf
    (meth : gir_method) =
  let ml_name = Utils.ml_method_name ~class_name meth in
  let ocaml_name =
    Utils.ocaml_function_name ~class_name ~c_type ?c_symbol_prefix
      meth.method_name
  in
  let in_params =
    List.filter
      ~f:(fun p -> Gir_type_pred.Gir_direction.is_in p.direction)
      meth.parameters
  in
  let param_count = 1 + List.length in_params in
  let doc =
    Doc_emit.item_doc ~indent:""
      ~ret_shape:(Doc_translate.ret_shape_of_throws meth.throws)
      ~refs:(Doc_resolve.env_of_ctx ctx)
      ~context:Doc_translate.Member meth.doc
  in
  bprintf buf "%s" (Doc_emit.before_item doc);

  let full_type = build_method_signature ~ctx ~class_name meth in
  format_method_external ~buf ~ocaml_name ~ml_name ~param_count ~full_type;
  bprintf buf "%s" (Doc_emit.after_item doc)
