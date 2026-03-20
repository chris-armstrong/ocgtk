(* High-level class generation (Step 3) - Main orchestration module *)

[@@@warning "-32"]

open StdLabels
open Printf
open Types

(* Re-export Common module and helper functions *)
include Common

(* Re-export all helpers for convenience *)
include Class_gen_helpers
include Class_gen_conflict_detection
include Class_gen_property
include Class_gen_converter
include Class_gen_method
include Class_gen_body

(** Generate a class module (implementation) *)
let generate_class_module ~ctx ~class_name ~c_type ~parent_chain:_ ~methods ~properties ~signals =
  let buf = Buffer.create 2048 in
  let module_names = get_module_names ~ctx class_name in
  let class_snake = sanitize_name class_name in
  let class_type_name = class_snake ^ "_t" in
  let hierarchy_info = Hierarchy_detection.get_hierarchy_info ctx class_name in
  let has_any_signals = List.length signals > 0 in

  if has_any_signals then
    bprintf buf "(* Signal class defined in g%s_signals.ml *)\n\n" class_snake;

  (* Class type definition *)
  bprintf buf "class type %s = object\n" class_type_name;

  generate_class_signature_body ~ctx ~buf
    ~layer1_module_name:module_names.layer1
    ~current_layer2_module:module_names.layer2
    ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes:[class_name] ();

  bprintf buf "end\n\n";

  (* Class implementation *)
  bprintf buf "(* High-level class for %s *)\n" class_name;
  bprintf buf "class %s (obj : %s.t) : %s = object (self)\n" class_snake module_names.layer1 class_type_name;

  generate_class_module_body ~ctx ~buf
    ~layer1_module_name:module_names.layer1
    ~current_layer2_module:module_names.layer2
    ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes:[class_name] ();

  bprintf buf "end\n\n";
  Buffer.contents buf

(** Generate a class signature *)
let generate_class_signature ~ctx ~class_name ~c_type ~parent_chain:_ ~methods ~properties ~signals =
  let buf = Buffer.create 1024 in
  let module_names = get_module_names ~ctx class_name in
  let class_snake = sanitize_name class_name in
  let class_type_name = class_snake ^ "_t" in
  let hierarchy_info = Hierarchy_detection.get_hierarchy_info ctx class_name in

  (* Class type definition *)
  bprintf buf "class type %s = object\n" class_type_name;

  generate_class_signature_body ~ctx ~buf
    ~layer1_module_name:module_names.layer1
    ~current_layer2_module:module_names.layer2
    ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes:[class_name] ();

  bprintf buf "end\n\n";

  (* Class declaration referencing the class type *)
  bprintf buf "class %s : %s.t -> %s\n\n" class_snake module_names.layer1 class_type_name;
  Buffer.contents buf

(** Common helper for generating combined class entities (both impl and sig) *)
let generate_combined_entities ~ctx ~combined_module_name ~entities ~parent_chain_for_entity
    ~header_text ~generate_entity =
  let buf = Buffer.create 4096 in
  bprintf buf "%s\n" header_text;

  let current_layer2_module = "G" ^ combined_module_name in
  let sorted_entities = List.sort ~cmp:(fun e1 e2 -> String.compare e1.name e2.name) entities in
  let same_cluster_classes = List.map sorted_entities ~f:(fun e -> e.name) in

  List.iteri ~f:(fun i entity ->
    let _parent_chain = parent_chain_for_entity entity.name in
    let module_name = Class_utils.get_qualified_module_name ~ctx entity.name in
    let class_snake = sanitize_name entity.name in
    let hierarchy_info = Hierarchy_detection.get_hierarchy_info ctx entity.name in
    generate_entity ~buf ~i ~class_snake ~module_name ~current_layer2_module
      ~class_name:entity.name ~c_type:entity.c_type
      ~methods:entity.methods ~properties:entity.properties ~signals:entity.signals
      ~hierarchy_info ~same_cluster_classes;
  ) sorted_entities;

  Buffer.contents buf

(** Generate combined class modules for cyclic dependencies *)
let generate_combined_class_module ~ctx ~combined_module_name ~entities ~parent_chain_for_entity =
  let buf = Buffer.create 4096 in
  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n(* Combined classes for cyclic dependencies *)\n";

  (* Pass 1: class type definitions *)
  let generate_class_type ~buf ~i ~class_snake ~module_name:_ ~current_layer2_module
      ~class_name ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes =
    let class_type_name = class_snake ^ "_t" in
    if i = 0 then
      bprintf buf "class type %s = object\n" class_type_name
    else
      bprintf buf "\nand %s = object\n" class_type_name;

    generate_class_signature_body ~ctx ~buf
      ~layer1_module_name:(Class_utils.get_qualified_module_name ~ctx class_name)
      ~current_layer2_module
      ~class_name ~class_snake ~c_type
      ~methods ~properties ~signals
      ~hierarchy_info ~same_cluster_classes ();

    bprintf buf "end\n"
  in

  let class_types_text =
    generate_combined_entities ~ctx ~combined_module_name ~entities ~parent_chain_for_entity
      ~header_text:"" ~generate_entity:generate_class_type
  in
  Buffer.add_string buf class_types_text;
  bprintf buf "\n";

  (* Pass 2: class implementations *)
  let generate_class_impl ~buf ~i ~class_snake ~module_name ~current_layer2_module
      ~class_name ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes =
    let class_type_name = class_snake ^ "_t" in
    let has_any_signals = List.length signals > 0 in
    if has_any_signals then
      bprintf buf "(* Signal class defined in g%s_signals.ml *)\n\n" class_snake;

    if i = 0 then
      bprintf buf "class %s (obj : %s.t) : %s = object (self)\n" class_snake module_name class_type_name
    else
      bprintf buf "\nand %s (obj : %s.t) : %s = object (self)\n" class_snake module_name class_type_name;

    generate_class_module_body ~ctx ~buf
      ~layer1_module_name:module_name
      ~current_layer2_module
      ~class_name ~class_snake ~c_type
      ~methods ~properties ~signals
      ~hierarchy_info ~same_cluster_classes ();

    bprintf buf "end\n"
  in

  let classes_text =
    generate_combined_entities ~ctx ~combined_module_name ~entities ~parent_chain_for_entity
      ~header_text:"" ~generate_entity:generate_class_impl
  in
  Buffer.add_string buf classes_text;
  Buffer.contents buf

(** Generate combined class signatures for cyclic dependencies *)
let generate_combined_class_signature ~ctx ~combined_module_name ~entities ~parent_chain_for_entity =
  let buf = Buffer.create 4096 in

  (* Pass 1: class type definitions *)
  let generate_class_type ~buf ~i ~class_snake ~module_name:_ ~current_layer2_module
      ~class_name ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes =
    let class_type_name = class_snake ^ "_t" in
    if i = 0 then
      bprintf buf "class type %s = object\n" class_type_name
    else
      bprintf buf "\nand %s = object\n" class_type_name;

    generate_class_signature_body ~ctx ~buf
      ~layer1_module_name:(Class_utils.get_qualified_module_name ~ctx class_name)
      ~current_layer2_module
      ~class_name ~class_snake ~c_type
      ~methods ~properties ~signals
      ~hierarchy_info ~same_cluster_classes ();

    bprintf buf "end\n"
  in

  let class_types_text =
    generate_combined_entities ~ctx ~combined_module_name ~entities ~parent_chain_for_entity
      ~header_text:"" ~generate_entity:generate_class_type
  in
  Buffer.add_string buf class_types_text;
  bprintf buf "\n";

  (* Pass 2: class declarations referencing class types *)
  let generate_class_decl ~buf ~i ~class_snake ~module_name ~current_layer2_module:_
      ~class_name:_ ~c_type:_ ~methods:_ ~properties:_ ~signals:_ ~hierarchy_info:_ ~same_cluster_classes:_ =
    let class_type_name = class_snake ^ "_t" in
    if i = 0 then
      bprintf buf "class %s : %s.t -> %s\n" class_snake module_name class_type_name
    else
      bprintf buf "\nand %s : %s.t -> %s\n" class_snake module_name class_type_name
  in

  let class_decls_text =
    generate_combined_entities ~ctx ~combined_module_name ~entities ~parent_chain_for_entity
      ~header_text:"" ~generate_entity:generate_class_decl
  in
  Buffer.add_string buf class_decls_text;
  Buffer.contents buf