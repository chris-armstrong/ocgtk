(* Type Resolution - Shared OCaml type resolution utilities
   This module consolidates type resolution logic from class_gen.ml and ml_interface.ml
*)

open StdLabels
open Printf
open Types

(** Resolve a GIR type to its layer 2 class reference.
    Returns the fully qualified type reference if found, or None if no mapping exists.
    If the class is in the current module, returns just the type name. *)
let resolve_layer2_class_ref ~ctx ~current_layer2_module ~(gir_type:gir_type) =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some { layer2_class = Some layer2_class; _ } ->
      let qualified =
        if String.equal current_layer2_module layer2_class.class_module then
          layer2_class.class_type
        else
          layer2_class.class_module ^ "." ^ layer2_class.class_type
      in
      Some qualified
  | _ -> None

(** Resolve a GIR type to its OCaml type string.
    Returns the OCaml type representation with proper nullable handling.
    Returns None if no type mapping exists. *)
let resolve_ocaml_type ~ctx ~current_layer2_module ~(gir_type : gir_type) =
  (match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some { layer2_class = Some layer2_class; _ } ->
      let qualified =
        if String.equal current_layer2_module layer2_class.class_module then
          layer2_class.class_type
        else
          layer2_class.class_module ^ "." ^ layer2_class.class_type
      in
      Some qualified
  | Some mapping -> Some mapping.ocaml_type
  | None -> None)
  |> Option.map (fun base ->
       if gir_type.nullable then
         base ^ " option"
       else
         base)

(** Simplify type references when they refer to the current module's type.
    Converts patterns like "CurrentModule.t" or "CurrentModule.t option" to "t" or "t option".
    Handles common type wrappers like "option", "array", and combinations. *)
let simplify_self_reference ~class_name ~ocaml_type =
  let current_module = Utils.module_name_of_class class_name in
  let self_type = current_module ^ ".t" in
  if ocaml_type = self_type then
    "t"
  else
    (* Handle patterns like "Module.t array", "Module.t option", "Module.t array option", etc. *)
    Re.replace (Re.compile (Re.str self_type)) ~all:true ~f:(fun _ -> "t") ocaml_type

(** Map a GIR type to its OCaml representation with self-reference simplification.
    Returns "unit" for unknown types with a warning to stderr.
    Simplifies type references to remove redundant module prefixes. *)
let map_gir_type_to_ocaml ~ctx ~class_name ~gir_type ~is_nullable =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some mapping ->
      let simplified_type = simplify_self_reference ~class_name ~ocaml_type:mapping.ocaml_type in
      if is_nullable then
        sprintf "%s option" simplified_type
      else
        simplified_type
  | None ->
      eprintf "Warning: Unknown type: name=%s type=%s\n"
        gir_type.name gir_type.name;
      "unit"

(** Wrap a result type with GError.t if the function throws.
    Converts: "unit" -> "(unit, GError.t) result" *)
let wrap_result_if_throws ~base_type ~throws =
  if throws then
    sprintf "(%s, GError.t) result" base_type
  else
    base_type