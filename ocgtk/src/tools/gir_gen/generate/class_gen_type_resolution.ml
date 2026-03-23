(* Class-specific type resolution functions
   This module contains layer 2 type resolution: resolve_ocaml_type, resolve_layer2_class_ref,
   and class_gen-specific logic for polymorphic types and structural types.
 *)

[@@@warning "-32-33"]

open StdLabels
open Printf
open Types

(* Use Class_gen_helpers for shared functions
   Note: open StdLabels is needed here despite Class_gen_helpers having it,
   because opens don't propagate through include *)
include Class_gen_helpers

(** Resolve a GIR type to its layer 2 class type reference (with _t suffix).
    Returns the fully qualified type reference if found, or None if no mapping
    exists. If the class is in the current module, returns just the type name.
*)
let resolve_layer2_class_ref ~ctx ~current_layer2_module ~(gir_type : gir_type)
    =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some { layer2_class = Some layer2_class; _ } ->
      let qualified =
        if String.equal current_layer2_module layer2_class.class_module then
          layer2_class.class_type
        else layer2_class.class_module ^ "." ^ layer2_class.class_type
      in
      Some qualified
  | _ -> None

(** Like resolve_layer2_class_ref but returns the class name (without _t
    suffix), for use in [new] expressions. *)
let resolve_layer2_class_name ~ctx ~current_layer2_module ~(gir_type : gir_type)
    =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some { layer2_class = Some layer2_class; _ } ->
      (* Strip the _t suffix to get the class name *)
      let class_name =
        let ct = layer2_class.class_type in
        if Filename.check_suffix ct "_t" then
          String.sub ct ~pos:0 ~len:(String.length ct - 2)
        else ct
      in
      let qualified =
        if String.equal current_layer2_module layer2_class.class_module then
          class_name
        else layer2_class.class_module ^ "." ^ class_name
      in
      Some qualified
  | _ -> None

(** Resolve a GIR type to its OCaml type string. Returns the OCaml type
    representation with proper nullable handling. Returns None if no type
    mapping exists. *)
let resolve_ocaml_type ~ctx ~current_layer2_module ~(gir_type : gir_type) =
  (match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
    | Some { layer2_class = Some layer2_class; _ } ->
        let qualified =
          if String.equal current_layer2_module layer2_class.class_module then
            layer2_class.class_type
          else layer2_class.class_module ^ "." ^ layer2_class.class_type
        in
        Some qualified
    | Some mapping -> Some mapping.ocaml_type
    | None -> None)
  |> Option.map (fun base ->
      if gir_type.nullable then base ^ " option" else base)

let map_param_sig ~ctx ~same_cluster_classes:_ ~current_layer2_module p =
  (* Regular type *)
  let gir_type =
    { p.param_type with nullable = p.nullable || p.param_type.nullable }
  in
  resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type |> Option.get

(* No longer needed - class types are used directly without # prefix.
   Kept as identity function for API compatibility. *)
let convert_to_partial_object_type ~ctx:_ ~current_layer2_module:_
    ~same_cluster_classes:_ ~param_info:_ type_str =
  type_str
