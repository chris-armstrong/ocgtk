(* Method conflict detection for class generation *)

open StdLabels
open Printf
open Types

module StringSet = Common.StringSet
type module_names = Common.module_names
type property_filters = Common.property_filters

(* Helper to sanitize class/enum names *)
let sanitize_name s =
  s |> String.map ~f:(function '-' -> '_' | c -> c) |> Utils.to_snake_case |> Utils.sanitize_identifier

(* Helper to get OCaml method name for a method *)
let ocaml_method_name ~class_name ~c_type (meth : gir_method) =
  Utils.ocaml_method_name ~class_name ~c_type meth.method_name |> sanitize_name

(* Helper to get method signature for comparison *)
let method_signature_for_comparison (meth : gir_method) : string =
  (* Create a comparable signature from parameter types *)
  let param_sig =
    List.map meth.parameters ~f:(fun p -> p.param_type.name)
    |> String.concat ~sep:","
  in
  sprintf "%s(%s)->%s" meth.method_name param_sig meth.return_type.name

(* Get all methods from a class *)
let get_class_methods ~ctx class_name : gir_method list =
  match List.find_opt ~f:(fun cls -> cls.class_name = class_name) ctx.classes with
  | Some cls -> cls.methods
  | None -> []

(* Helper: Get parent name from class if it exists *)
let get_parent_name_opt ~ctx class_name : string option =
  match List.find_opt ~f:(fun cls -> cls.class_name = class_name) ctx.classes with
  | None -> None
  | Some cls -> cls.parent

(* Build parent chain for a class *)
let rec build_parent_chain ~ctx class_name : string list =
  match get_parent_name_opt ~ctx class_name with
  | None -> []
  | Some parent -> parent :: build_parent_chain ~ctx parent

(* Get all methods from parent chain *)
let get_parent_methods ~ctx ~parent_chain : (string * gir_method) list =
  List.concat_map parent_chain ~f:(fun parent_name ->
    let methods = get_class_methods ~ctx parent_name in
    List.map methods ~f:(fun meth -> (parent_name, meth))
  )

(* Check if two methods have conflicting signatures *)
let methods_have_signature_conflict ~ctx:_ ~class_name ~c_type meth1 meth2 =
  let name1 = ocaml_method_name ~class_name ~c_type meth1 in
  let name2 = ocaml_method_name ~class_name ~c_type meth2 in

  (* Same name but different signatures *)
  if String.equal name1 name2 then
    let sig1 = method_signature_for_comparison meth1 in
    let sig2 = method_signature_for_comparison meth2 in
    not (String.equal sig1 sig2)
  else
    false

(* Helper: Check a single parent method for conflict *)
let check_parent_conflict ~ctx ~class_name ~c_type child_meth acc (_parent_name, parent_meth) =
  if methods_have_signature_conflict ~ctx ~class_name ~c_type child_meth parent_meth then
    let ocaml_name = ocaml_method_name ~class_name ~c_type child_meth in
    StringSet.add ocaml_name acc
  else
    acc

(* Helper: Process all parent methods for one child method *)
let process_child_against_parents ~ctx ~class_name ~c_type parent_methods acc child_meth =
  List.fold_left parent_methods ~init:acc ~f:(check_parent_conflict ~ctx ~class_name ~c_type child_meth)

(* Detect which methods conflict with parent methods *)
let detect_method_conflicts ~ctx ~class_name ~c_type ~methods : StringSet.t =
  let parent_chain = build_parent_chain ~ctx class_name in
  let parent_methods = get_parent_methods ~ctx ~parent_chain in
  List.fold_left ~init:StringSet.empty ~f:(process_child_against_parents ~ctx ~class_name ~c_type parent_methods) methods