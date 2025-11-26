(* Shared filtering helpers for GIR generators *)

open StdLabels
open Types

module StringSet = Set.Make (String)

let sanitize_property_name name =
  name |> String.map ~f:(function '-' -> '_' | c -> c) |> Utils.to_snake_case

let ocaml_method_name ~class_name (meth : gir_method) =
  let class_snake = Utils.to_snake_case class_name in
  meth.c_identifier
  |> Str.global_replace (Str.regexp (Printf.sprintf "gtk_%s_" class_snake)) ""
  |> Utils.to_snake_case

let has_simple_type ~classes ~enums ~bitfields (gir_type : gir_type) =
  let is_excluded =
    Exclude_list.is_excluded_type_name gir_type.name
    || Exclude_list.is_excluded_type_name gir_type.c_type
  in
  not is_excluded
  &&
  match Type_mappings.find_type_mapping ~enums ~bitfields ~classes gir_type.c_type with
  | Some _ -> true
  | None -> false

let should_generate_property ~classes ~enums ~bitfields (prop : gir_property) =
  has_simple_type ~classes ~enums ~bitfields prop.prop_type

let property_method_names ~classes ~enums ~bitfields (properties : gir_property list) =
  let names, _ =
    List.fold_left properties ~init:([], StringSet.empty)
      ~f:(fun (acc, seen) (prop : gir_property) ->
        if not (should_generate_property ~classes ~enums ~bitfields prop) then
          (acc, seen)
        else
        let prop_snake = sanitize_property_name prop.prop_name in
        let acc, seen =
          if prop.readable && not (StringSet.mem ("get_" ^ prop_snake) seen) then
            (("get_" ^ prop_snake) :: acc, StringSet.add ("get_" ^ prop_snake) seen)
          else
            (acc, seen)
        in
        let acc, seen =
          if prop.writable && not prop.construct_only && not (StringSet.mem ("set_" ^ prop_snake) seen) then
            (("set_" ^ prop_snake) :: acc, StringSet.add ("set_" ^ prop_snake) seen)
          else
            (acc, seen)
        in
        (acc, seen))
  in
  names

let property_base_names ~classes ~enums ~bitfields (properties : gir_property list) =
  properties
  |> List.filter ~f:(fun prop -> should_generate_property ~classes ~enums ~bitfields prop)
  |> List.map ~f:(fun (prop : gir_property) -> sanitize_property_name prop.prop_name)

let method_has_excluded_type (meth : gir_method) =
  Exclude_list.is_excluded_type_name meth.return_type.name
  || Exclude_list.is_excluded_type_name meth.return_type.c_type
  || List.exists meth.parameters ~f:(fun p ->
         Exclude_list.is_excluded_type_name p.param_type.name
         || Exclude_list.is_excluded_type_name p.param_type.c_type)

let should_skip_method_binding
    ~classes ~enums ~bitfields ~property_method_names ~property_base_names ~class_name (meth : gir_method) =
  let ocaml_name = ocaml_method_name ~class_name meth in
  let has_unknown_type =
    Exclude_list.should_skip_method
      ~find_type_mapping:(Type_mappings.find_type_mapping ~enums ~bitfields ~classes)
      ~enums ~bitfields meth
  in
  let has_excluded_type = method_has_excluded_type meth in
  let is_variadic =
    List.exists meth.parameters ~f:(fun p -> p.varargs)
    || Exclude_list.is_variadic_function meth.c_identifier
  in
  let base_name =
    if String.length ocaml_name > 4 && String.sub ocaml_name ~pos:0 ~len:4 = "get_" then
      Some (String.sub ocaml_name ~pos:4 ~len:(String.length ocaml_name - 4))
    else if String.length ocaml_name > 4 && String.sub ocaml_name ~pos:0 ~len:4 = "set_" then
      Some (String.sub ocaml_name ~pos:4 ~len:(String.length ocaml_name - 4))
    else
      None
  in
  let duplicates_property =
    List.mem ocaml_name ~set:property_method_names ||
    match base_name with
    | Some base -> List.mem base ~set:property_base_names
    | None -> false
  in
  let attr_matches_property opt =
    match opt with
    | Some prop -> List.mem (sanitize_property_name prop) ~set:property_base_names
    | None -> false
  in
  let marked_property = attr_matches_property meth.get_property || attr_matches_property meth.set_property in
  is_variadic || duplicates_property || marked_property || has_excluded_type || has_unknown_type
