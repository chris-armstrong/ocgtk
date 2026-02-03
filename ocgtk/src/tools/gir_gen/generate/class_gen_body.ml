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
  let seen, () =
    List.fold_left methods ~init:(seen, ()) ~f:(fun (seen, ()) m ->
      let chunk, seen = Class_gen_method.generate_method_wrappers ~ctx ~property_method_names:property_filters.method_names ~property_base_names:property_filters.base_names ~module_name:layer1_module_name ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods m in
      Buffer.add_string buf chunk;
      if chunk <> "" then Buffer.add_char buf '\n';
      (seen, ()))
  in
  (* Properties *)
  let seen, () =
    List.fold_left properties ~init:(seen, ()) ~f:(fun (seen, ()) prop ->
      let chunk, seen = Class_gen_property.generate_property_methods ~ctx ~class_name ~methods ~module_name:layer1_module_name ~current_layer2_module ~seen ~same_cluster_classes prop in
      Buffer.add_string buf chunk;
      if chunk <> "" then Buffer.add_char buf '\n';
      (seen, ()))
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
  let _seen, () =
    List.fold_left methods ~init:(seen, ()) ~f:(fun (seen, ()) meth ->
      if Filtering.should_skip_method_binding ~ctx meth then (seen, ())
      else
        let chunk, seen = Class_gen_method.generate_method_signatures ~ctx ~property_method_names:property_filters.method_names ~property_base_names:property_filters.base_names ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods meth in
        Buffer.add_string buf chunk;
      (seen, ()))
  in

  (* Properties *)
  let _, () =
    List.fold_left properties ~init:(seen, ()) ~f:(fun (seen, ()) prop ->
      if Filtering.should_generate_property ~ctx ~class_name ~methods prop then begin
        let chunk, _ = Class_gen_property.generate_property_signatures ~ctx ~methods ~class_name ~seen ~current_layer2_module ~same_cluster_classes prop in
        Buffer.add_string buf chunk;
      end;
      (seen, ()))
  in

  (* Converter methods *)
  Option.iter (fun hier_info -> Class_gen_converter.generate_hierarchy_converter_method_sig ~hierarchy_info:hier_info ~class_name buf) hierarchy_info;
  Class_gen_converter.generate_class_converter_method_sig ~ctx ~class_name buf