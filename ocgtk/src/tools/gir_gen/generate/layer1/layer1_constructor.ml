(* Layer 1 Constructor - Constructor generation for OCaml interfaces *)

open StdLabels
open Printf
open Types

(** Build constructor signature string from parameters *)
let build_constructor_signature ~ctx ~class_name ctor =
  let param_types =
    List.map
      ~f:(Layer1_helpers.map_constructor_param ~ctx ~class_name)
      ctor.ctor_parameters
  in
  (* Generate signature: param1 -> param2 -> ... -> t *)
  if List.length param_types = 0 then "unit -> t"
  else String.concat ~sep:" -> " (param_types @ [ "t" ])

(** Format constructor external declaration with bytecode/native support *)
let format_constructor_external ~ocaml_ctor_name ~signature ~ml_name ctor =
  let param_count =
    if List.length ctor.ctor_parameters = 0 then 1
    else List.length ctor.ctor_parameters
  in
  if param_count > 5 then
    sprintf "external %s : %s = \"%s_bytecode\" \"%s_native\"\n\n"
      ocaml_ctor_name signature ml_name ml_name
  else sprintf "external %s : %s = \"%s\"\n\n" ocaml_ctor_name signature ml_name

(** Check if a constructor should be generated in the interface *)
let should_generate_constructor ~ctx (ctor : gir_constructor) =
  let has_cross_namespace_type =
    Filtering.constructor_has_cross_namespace_types ~ctx ctor
  in
  (not ctor.throws) && not has_cross_namespace_type

(** Generate a single constructor declaration and write it to the buffer *)
let generate_constructor_decl ~ctx ~class_name ~buf (ctor : gir_constructor) =
  bprintf buf "(** Create a new %s *)\n" class_name;
  let ml_name = Utils.ml_constructor_name ~class_name ~constructor:ctor in
  let ocaml_ctor_name = Utils.ocaml_constructor_name ~class_name ctor in

  let signature = build_constructor_signature ~ctx ~class_name ctor in
  let decl =
    format_constructor_external ~ocaml_ctor_name ~signature ~ml_name ctor
  in
  bprintf buf "%s" decl
