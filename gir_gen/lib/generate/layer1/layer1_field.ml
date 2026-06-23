(* Layer 1 Field - Record field accessor external declarations for OCaml interfaces
 *
 * This module generates OCaml [external] declarations for record field getters,
 * setters, and the synthetic [make] constructor.  It consumes pre-computed
 * [field_info] values from [Field_analysis]; all type resolution and C
 * conversion-pattern selection lives there.
 *
 * Each getter generates:
 *   external get_<field> : t -> <ocaml_type> = "<c_getter_name>"
 *
 * Each setter generates:
 *   external set_<field> : t -> <ocaml_type> -> unit = "<c_setter_name>"
 *
 * The make constructor generates:
 *   external make : <param_types> -> t = "<c_make_name>"
 *   (with bytecode/native entry points for >5 parameters) *)

open Printf
open Containers
open StdLabels

(* ------------------------------------------------------------------ *)
(*  Getter external declarations                                      *)
(* ------------------------------------------------------------------ *)

(** Generate a single field getter external declaration. *)
let generate_field_getter_decl ~buf (field_info : Field_analysis.field_info) : unit =
  let ocaml_name = "get_" ^ field_info.field_name in
  bprintf buf "external %s : t -> %s = \"%s\"\n\n" ocaml_name field_info.ocaml_type
    field_info.getter_c_name

(** Generate all field getter external declarations. *)
let generate_field_getters ~buf (fields : Field_analysis.field_info list) : unit
    =
  List.iter fields ~f:(fun field_info -> generate_field_getter_decl ~buf field_info)

(* ------------------------------------------------------------------ *)
(*  Setter external declarations                                      *)
(* ------------------------------------------------------------------ *)

(** Generate a single field setter external declaration. *)
let generate_field_setter_decl ~buf (field_info : Field_analysis.field_info) : unit =
  let ocaml_name = "set_" ^ field_info.field_name in
  bprintf buf "external %s : t -> %s -> unit = \"%s\"\n\n" ocaml_name
    field_info.ocaml_type field_info.setter_c_name

(** Generate all field setter external declarations. *)
let generate_field_setters ~buf (fields : Field_analysis.field_info list) : unit
    =
  List.iter fields ~f:(fun field_info -> generate_field_setter_decl ~buf field_info)

(* ------------------------------------------------------------------ *)
(*  Make constructor external declaration                             *)
(* ------------------------------------------------------------------ *)

(** Generate the [make] constructor external declaration.
    The make function takes all writable fields as parameters and returns [t].
    For 0 writable fields, generates: [external make : unit -> t]
    For 1-5 writable fields, generates a simple [external].
    For >5 writable fields, generates bytecode/native entry points. *)
let generate_field_make_decl ~buf (fields : Field_analysis.field_info list) :
    unit =
  (* Filter to only writable fields (those with non-empty make assignment) *)
  let writable_fields =
    List.filter fields ~f:(fun (field_info : Field_analysis.field_info) ->
        String.length field_info.c_make_assignment > 0)
  in

  match writable_fields with
  | [] ->
      (* Zero writable fields — unit -> t *)
      bprintf buf "external make : unit -> t = \"%s\"\n\n"
        (List.hd fields).make_c_name
  | first_writable :: _ ->
      let param_types =
        List.map writable_fields ~f:(fun (field_info : Field_analysis.field_info) ->
            field_info.ocaml_type)
      in
      let param_count = List.length param_types in
      let full_type =
        String.concat ~sep:" -> " (param_types @ [ "t" ])
      in
      let make_c_name = first_writable.make_c_name in
      if param_count > 5 then
        bprintf buf "external make : %s = \"%s_bytecode\" \"%s_native\"\n\n"
          full_type make_c_name make_c_name
      else
        bprintf buf "external make : %s = \"%s\"\n\n" full_type make_c_name
