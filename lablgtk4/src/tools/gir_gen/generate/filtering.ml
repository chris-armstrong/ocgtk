(* Shared filtering helpers for GIR generators *)

open StdLabels
open Types
module StringSet = Set.Make (String)

module Log = (val Logs.src_log (Logs.Src.create "gir_gen.filtering" ~doc:"Shared filtering helpers for GIR generators"))

let has_simple_type ~ctx (gir_type : gir_type) =
  let is_excluded = Exclude_list.is_excluded_type_name gir_type.name in
  (not is_excluded)
  &&
  match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some _ ->
      Logs.debug (fun m -> m "has_simple_type: %s -> true\n" gir_type.name);
      true
  | None -> false

let property_exclude_list = [ ("IconPaintable", "is-symbolic") ]

let should_generate_property ~ctx ~class_name ~methods (prop : gir_property) =
  if
    List.exists
      ~f:(fun (test_class_name, test_property_name) ->
        String.equal prop.prop_name test_property_name
        && String.equal class_name test_class_name)
      property_exclude_list
  then false
  else
    let matches_method =
      List.exists
        ~f:(fun m ->
          m.set_property
          |> Option.map (String.equal prop.prop_name)
          |> Option.value ~default:false
          || m.get_property
             |> Option.map (String.equal prop.prop_name)
             |> Option.value ~default:false)
        methods
    in
    Log.debug (fun m -> m "matches method %s=%b\n" prop.prop_name matches_method);
    (not matches_method) && has_simple_type ~ctx prop.prop_type

let property_method_names ~ctx ~class_name ~methods
    (properties : gir_property list) =
  let names, _ =
    List.fold_left properties ~init:([], StringSet.empty)
      ~f:(fun (acc, seen) (prop : gir_property) ->
        if not (should_generate_property ~ctx ~class_name ~methods prop) then
          (acc, seen)
        else
          let prop_snake = Utils.sanitize_property_name prop.prop_name in
          let acc, seen =
            if prop.readable && not (StringSet.mem ("get_" ^ prop_snake) seen)
            then
              ( ("get_" ^ prop_snake) :: acc,
                StringSet.add ("get_" ^ prop_snake) seen )
            else (acc, seen)
          in
          let acc, seen =
            if
              prop.writable && (not prop.construct_only)
              && not (StringSet.mem ("set_" ^ prop_snake) seen)
            then
              ( ("set_" ^ prop_snake) :: acc,
                StringSet.add ("set_" ^ prop_snake) seen )
            else (acc, seen)
          in
          (acc, seen))
  in
  names

let property_base_names ~ctx ~class_name ~methods
    (properties : gir_property list) =
  properties
  |> List.filter ~f:(fun prop ->
      should_generate_property ~ctx ~class_name ~methods prop)
  |> List.map ~f:(fun (prop : gir_property) ->
      Utils.sanitize_property_name prop.prop_name)

let method_has_excluded_type (meth : gir_method) =
  Exclude_list.is_excluded_type_name meth.return_type.name
  || List.exists meth.parameters ~f:(fun p ->
      Exclude_list.is_excluded_type_name p.param_type.name)

let should_skip_method_binding ~ctx (meth : gir_method) =
  let is_excluded_function =
    Exclude_list.is_excluded_function meth.c_identifier
  in
  let has_unknown_type =
    Exclude_list.should_skip_method
      ~find_type_mapping:(Type_mappings.find_type_mapping_for_gir_type ~ctx)
      ~enums:ctx.enums ~bitfields:ctx.bitfields meth
  in
  let has_excluded_type = method_has_excluded_type meth in
  let is_variadic =
    List.exists meth.parameters ~f:(fun p -> p.varargs)
    || Exclude_list.is_variadic_function meth.c_identifier
  in

  Logs.debug (fun m -> m "should_skip_method_name: %s -> %b %b %b %b\n"
    meth.c_identifier is_variadic has_excluded_type has_unknown_type
    is_excluded_function);

  is_variadic || has_excluded_type || has_unknown_type || is_excluded_function

let constructor_has_varargs (ctor : gir_constructor) =
  List.exists ctor.ctor_parameters ~f:(fun p -> p.varargs)
