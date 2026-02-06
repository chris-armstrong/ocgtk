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

(** Generate a class section (methods or properties) by applying generator to each item *)
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
let generate_class_module_body ~ctx ~buf ~layer1_module_name ~current_layer2_module ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes () =
  let has_any_signals = List.length signals > 0 in
  let property_filters = Class_gen_helpers.get_property_filters ~ctx ~class_name ~methods properties in

  (* Detect method conflicts with parent classes *)
  let conflicting_methods = Class_gen_conflict_detection.detect_method_conflicts ~ctx ~class_name ~c_type ~methods in

  (* Inheritance *)
  Option.iter (fun hier_info ->
    if not (String.equal hier_info.gir_root class_name) then
      bprintf buf "  inherit %s.%s (%s.%s obj)\n" hier_info.layer2_module hier_info.class_type_name layer1_module_name hier_info.accessor_method
  ) hierarchy_info;

  (* Signal handlers via inherit *)
  if has_any_signals then begin
    let signal_module = get_signal_module_name class_snake in
    bprintf buf "  inherit %s.%s obj\n" signal_module (signal_class_name class_name)
  end;

  bprintf buf "\n";

  let seen = StringSet.empty in
  (* Methods *)
  let seen =
    let generate seen m =
      Class_gen_method.generate_method_wrappers ~ctx ~property_method_names:property_filters.method_names ~property_base_names:property_filters.base_names ~module_name:layer1_module_name ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods m
    in
    generate_section ~buf ~items_seen:seen ~items:methods ~generator_fn:generate ~add_newline:true
  in
  (* Properties *)
  let seen =
    let generate seen prop =
      Class_gen_property.generate_property_methods ~ctx ~class_name ~methods ~module_name:layer1_module_name ~current_layer2_module ~seen ~same_cluster_classes prop
    in
    generate_section ~buf ~items_seen:seen ~items:properties ~generator_fn:generate ~add_newline:true
  in
  ignore seen;

  (* Converter methods *)
  Option.iter (fun hier_info -> Class_gen_converter.generate_hierarchy_converter_method_impl ~ctx ~class_name ~hierarchy_info:hier_info buf) hierarchy_info;
  Class_gen_converter.generate_class_converter_method_impl ~class_name buf

(** Generate the body of a class signature *)
let generate_class_signature_body ~ctx ~buf ~layer1_module_name:_ ~current_layer2_module ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes () =
  let has_any_signals = List.length signals > 0 in
  let property_filters = Class_gen_helpers.get_property_filters ~ctx ~class_name ~methods properties in

  (* Detect method conflicts with parent classes *)
  let conflicting_methods = Class_gen_conflict_detection.detect_method_conflicts ~ctx ~class_name ~c_type ~methods in

  (* Inheritance *)
  Option.iter (fun hier_info ->
    if not (String.equal hier_info.gir_root class_name) then
      bprintf buf "    inherit %s.%s\n" hier_info.layer2_module hier_info.class_type_name
  ) hierarchy_info;

  (* Signal handlers via inherit *)
  if has_any_signals then begin
    let signal_module = get_signal_module_name class_snake in
    bprintf buf "    inherit %s.%s\n" signal_module (signal_class_name class_name)
  end;

  let seen = StringSet.empty in
  (* Methods *)
  let _seen =
    let generate seen meth =
      if Filtering.should_skip_method_binding ~ctx meth then ("", seen)
      else
        let chunk, seen = Class_gen_method.generate_method_signatures ~ctx ~property_method_names:property_filters.method_names ~property_base_names:property_filters.base_names ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods meth in
        (chunk, seen)
    in
    generate_section ~buf ~items_seen:seen ~items:methods ~generator_fn:generate ~add_newline:false
  in

  (* Properties *)
  let _ =
    let generate seen prop =
      if Filtering.should_generate_property ~ctx ~class_name ~methods prop then
        let chunk, seen = Class_gen_property.generate_property_signatures ~ctx ~methods ~class_name ~seen ~current_layer2_module ~same_cluster_classes prop in
        (chunk, seen)
      else
        ("", seen)
    in
    generate_section ~buf ~items_seen:seen ~items:properties ~generator_fn:generate ~add_newline:false
  in

  (* Converter methods *)
  Option.iter (fun hier_info -> Class_gen_converter.generate_hierarchy_converter_method_sig ~hierarchy_info:hier_info ~class_name buf) hierarchy_info;
  Class_gen_converter.generate_class_converter_method_sig ~ctx ~class_name buf