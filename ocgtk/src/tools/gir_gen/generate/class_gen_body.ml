(* Class body generation (Step 3) - orchestrators *)

[@@@warning "-32"]

open StdLabels
open Printf
open Types

(* Use Common.StringSet for type compatibility across all modules *)
module StringSet = Common.StringSet

(* Include the signal name functions from Class_gen_helpers *)
let get_signal_module_name = Class_gen_helpers.get_signal_module_name
let signal_class_name = Class_gen_helpers.signal_class_name

(** Generate a class section (methods or properties) by applying generator to
    each item *)
let generate_section ~buf ~items_seen ~items ~generator_fn ~add_newline =
  let items_seen, () =
    List.fold_left items ~init:(items_seen, ()) ~f:(fun (items_seen, ()) item ->
        let chunk, items_seen = generator_fn items_seen item in
        Buffer.add_string buf chunk;
        if add_newline && chunk <> "" then Buffer.add_char buf '\n';
        (items_seen, ()))
  in
  items_seen

(** Generate the body of a class module (implementation) *)
let generate_class_module_body ~ctx ~buf ~layer1_module_name
    ~current_layer2_module ~class_name ~class_snake ~c_type ~methods ~properties
    ~signals ~same_cluster_classes ~parent_name () =
  let has_any_signals = List.length signals > 0 in
  let property_filters =
    Class_gen_helpers.get_property_filters ~ctx ~class_name ~methods properties
  in

  (* Detect method conflicts with parent classes *)
  let conflicting_methods =
    Class_gen_conflict_detection.detect_method_conflicts ~ctx ~class_name
      ~c_type ~methods
  in

  (* Parent class inheritance — skip if parent is in the same cyclic cluster *)
  (match
     Class_gen_helpers.resolve_parent_gir_type ~same_cluster_classes
       ~parent_name
   with
  | Some gir_type -> (
      match
        Class_gen_type_resolution.resolve_layer2_class_name ~ctx
          ~current_layer2_module ~gir_type
      with
      | Some parent_class_name ->
          let parent_l1 =
            if String.contains gir_type.name '.' then
              (* Cross-namespace parent: use type mapping for qualified L1 path *)
              match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
              | Some tm ->
                  (* ocaml_type is e.g. "Ocgtk_gio.Gio.Wrappers.Application.t" — strip ".t" *)
                  let ot = tm.ocaml_type in
                  if Filename.check_suffix ot ".t" then
                    String.sub ot ~pos:0 ~len:(String.length ot - 2)
                  else ot
              | None -> Class_utils.get_qualified_module_name ~ctx gir_type.name
            else
              Class_utils.get_qualified_module_name ~ctx gir_type.name
          in
          bprintf buf "  inherit %s (obj :> %s.t)\n" parent_class_name
            parent_l1
      | None -> ())
  | None -> ());

  (* Signal handlers via inherit *)
  if has_any_signals then begin
    let signal_module = get_signal_module_name class_snake in
    bprintf buf "  inherit %s.%s obj\n" signal_module
      (signal_class_name class_name)
  end;

  bprintf buf "\n";

  (* Pre-populate seen with inherited method names to suppress conflicts *)
  let inherited_names =
    Class_gen_conflict_detection.collect_inherited_method_names ~ctx ~class_name
  in
  let seen = inherited_names in
  (* Methods *)
  let seen =
    let generate seen m =
      Class_gen_method.generate_method_wrappers ~ctx
        ~property_method_names:property_filters.method_names
        ~property_base_names:property_filters.base_names
        ~module_name:layer1_module_name ~class_name ~c_type ~seen
        ~current_layer2_module ~same_cluster_classes ~conflicting_methods m
    in
    generate_section ~buf ~items_seen:seen ~items:methods ~generator_fn:generate
      ~add_newline:true
  in
  (* Properties *)
  let seen =
    let generate seen prop =
      Class_gen_property.generate_property_methods ~ctx ~class_name ~methods
        ~module_name:layer1_module_name ~current_layer2_module ~seen
        ~same_cluster_classes prop
    in
    generate_section ~buf ~items_seen:seen ~items:properties
      ~generator_fn:generate ~add_newline:true
  in
  ignore seen;

  (* Converter methods — skip if parent already provides the same accessor *)
  let self_accessor = Utils.ocaml_class_name class_name in
  let parent_provides_accessor = match parent_name with
    | Some p ->
        let parent_accessor = Utils.ocaml_class_name (Utils.normalize_class_name p) in
        String.equal self_accessor parent_accessor
    | None -> false
  in
  if not parent_provides_accessor then
    Class_gen_converter.generate_class_converter_method_impl ~class_name buf

(** Generate the body of a class signature *)
let generate_class_signature_body ~ctx ~buf ~layer1_module_name:_
    ~current_layer2_module ~class_name ~class_snake ~c_type ~methods ~properties
    ~signals ~same_cluster_classes ~parent_name () =
  let has_any_signals = List.length signals > 0 in
  let property_filters =
    Class_gen_helpers.get_property_filters ~ctx ~class_name ~methods properties
  in

  (* Detect method conflicts with parent classes *)
  let conflicting_methods =
    Class_gen_conflict_detection.detect_method_conflicts ~ctx ~class_name
      ~c_type ~methods
  in

  (* Parent class inheritance — skip if parent is in the same cyclic cluster *)
  (match
     Class_gen_helpers.resolve_parent_gir_type ~same_cluster_classes
       ~parent_name
   with
  | Some gir_type -> (
      match
        Class_gen_type_resolution.resolve_layer2_class_ref ~ctx
          ~current_layer2_module ~gir_type
      with
      | Some parent_class_type ->
          bprintf buf "    inherit %s\n" parent_class_type
      | None -> ())
  | None -> ());

  (* Signal handlers via inherit *)
  if has_any_signals then begin
    let signal_module = get_signal_module_name class_snake in
    bprintf buf "    inherit %s.%s\n" signal_module
      (signal_class_name class_name)
  end;

  (* Pre-populate seen with inherited method names to suppress conflicts *)
  let inherited_names =
    Class_gen_conflict_detection.collect_inherited_method_names ~ctx ~class_name
  in
  let seen = inherited_names in
  (* Methods *)
  let _seen =
    let generate seen meth =
      if Filtering.should_skip_method_binding ~ctx meth then ("", seen)
      else
        let chunk, seen =
          Class_gen_method.generate_method_signatures ~ctx
            ~property_method_names:property_filters.method_names
            ~property_base_names:property_filters.base_names ~class_name ~c_type
            ~seen ~current_layer2_module ~same_cluster_classes
            ~conflicting_methods meth
        in
        (chunk, seen)
    in
    generate_section ~buf ~items_seen:seen ~items:methods ~generator_fn:generate
      ~add_newline:false
  in

  (* Properties *)
  let _ =
    let generate seen prop =
      if Filtering.should_generate_property ~ctx ~class_name ~methods prop then
        let chunk, seen =
          Class_gen_property.generate_property_signatures ~ctx ~methods
            ~class_name ~seen ~current_layer2_module ~same_cluster_classes prop
        in
        (chunk, seen)
      else ("", seen)
    in
    generate_section ~buf ~items_seen:seen ~items:properties
      ~generator_fn:generate ~add_newline:false
  in

  (* Converter methods — skip if parent already provides the same accessor *)
  let self_accessor = Utils.ocaml_class_name class_name in
  let parent_provides_accessor =
    match parent_name with
    | Some p ->
        String.equal self_accessor
          (Utils.ocaml_class_name (Utils.normalize_class_name p))
    | None -> false
  in
  if not parent_provides_accessor then
    Class_gen_converter.generate_class_converter_method_sig ~ctx ~class_name buf

