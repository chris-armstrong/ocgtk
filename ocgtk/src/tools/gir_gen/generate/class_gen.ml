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

(** Helper: Determine if a parameter is a class type and get its Layer 2 type *)
let get_param_layer2_type ~ctx ~current_layer2_module (param : gir_param) =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx param.param_type with
  | Some { layer2_class = Some _; _ } ->
      (* This is a class type; resolve its Layer 2 type *)
      let gir_type = { param.param_type with nullable = param.nullable || param.param_type.nullable } in
      Class_gen_type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type
  | _ ->
      (* Not a class type; return None *)
      None

(** Helper: Get the accessor name for unwrapping a Layer 2 class parameter *)
let get_accessor_name ~ctx (param : gir_param) =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx param.param_type with
  | Some { layer2_class = Some layer2_class; _ } -> layer2_class.class_layer1_accessor
  | _ -> "as_" ^ (Utils.ocaml_class_name param.param_type.name)

(** Helper: Generate parameter type for constructor wrapper (Layer 2 for classes, Layer 1 otherwise) *)
let get_constructor_param_type ~ctx ~current_layer2_module (param : gir_param) =
  match get_param_layer2_type ~ctx ~current_layer2_module param with
  | Some layer2_type -> layer2_type
  | None -> Layer1.Layer1_helpers.map_constructor_param ~ctx ~class_name:"" param

(** Generate a class module (implementation) *)
let generate_class_module ~ctx ~class_name ~c_type ~parent_chain ~methods ~properties ~signals ~constructors =
  let buf = Buffer.create 2048 in
  let module_names = get_module_names ~ctx class_name in
  let class_snake = sanitize_name class_name in
  let class_type_name = class_snake ^ "_t" in
  let hierarchy_info = Hierarchy_detection.get_hierarchy_info ctx class_name in
  let has_any_signals = List.length signals > 0 in
  let parent_name = match parent_chain with p :: _ -> Some p | [] -> None in

  if has_any_signals then
    bprintf buf "(* Signal class defined in g%s_signals.ml *)\n\n" class_snake;

  (* Class type definition *)
  bprintf buf "class type %s = object\n" class_type_name;

  generate_class_signature_body ~ctx ~buf
    ~layer1_module_name:module_names.layer1
    ~current_layer2_module:module_names.layer2
    ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes:[class_name] ~parent_name ();

  bprintf buf "end\n\n";

  (* Class implementation *)
  bprintf buf "(* High-level class for %s *)\n" class_name;
  bprintf buf "class %s (obj : %s.t) : %s = object (self)\n" class_snake module_names.layer1 class_type_name;

  generate_class_module_body ~ctx ~buf
    ~layer1_module_name:module_names.layer1
    ~current_layer2_module:module_names.layer2
    ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes:[class_name] ~parent_name ();

  bprintf buf "end\n\n";

  (* Constructor wrappers *)
  List.iter constructors ~f:(fun ctor ->
    if Layer1.Layer1_constructor.should_generate_constructor ~ctx ctor then begin
      let ocaml_ctor_name = Utils.ocaml_constructor_name ~class_name ctor in
      let param_names_types_and_info =
        List.map ctor.ctor_parameters ~f:(fun param ->
          let param_name = Utils.ocaml_parameter_name param.param_name in
          let param_type = get_constructor_param_type ~ctx ~current_layer2_module:module_names.layer2 param in
          let is_class = get_param_layer2_type ~ctx ~current_layer2_module:module_names.layer2 param |> Option.is_some in
          (param_name, param_type, is_class, param)
        )
      in

      if List.length param_names_types_and_info = 0 then (
        (* Zero-param constructor *)
        bprintf buf "let %s () : %s =\n" ocaml_ctor_name class_type_name;
        bprintf buf "  new %s (%s.%s ())\n\n" class_snake module_names.layer1 ocaml_ctor_name
      ) else (
        (* Multi-param constructor *)
        let sig_parts = List.map param_names_types_and_info ~f:(fun (name, typ, _, _) ->
          sprintf "(%s : %s)" name typ
        ) in
        let sig_str = String.concat ~sep:" " sig_parts in
        bprintf buf "let %s %s : %s =\n" ocaml_ctor_name sig_str class_type_name;

        (* Generate unwrapping bindings for class parameters *)
        List.iter param_names_types_and_info ~f:(fun (param_name, _, is_class, param) ->
          if is_class then (
            let accessor = get_accessor_name ~ctx param in
            if param.nullable || param.param_type.nullable then
              bprintf buf "  let %s = Option.map (fun c -> c#%s) %s in\n" param_name accessor param_name
            else
              bprintf buf "  let %s = %s#%s in\n" param_name param_name accessor
          )
        );

        let call_parts = List.map param_names_types_and_info ~f:(fun (name, _, _, _) -> name) in
        let call_str = String.concat ~sep:" " call_parts in
        bprintf buf "  new %s (%s.%s %s)\n\n" class_snake module_names.layer1 ocaml_ctor_name call_str
      )
    end
  );

  Buffer.contents buf

(** Generate a class signature *)
let generate_class_signature ~ctx ~class_name ~c_type ~parent_chain ~methods ~properties ~signals ~constructors =
  let buf = Buffer.create 1024 in
  let module_names = get_module_names ~ctx class_name in
  let class_snake = sanitize_name class_name in
  let class_type_name = class_snake ^ "_t" in
  let hierarchy_info = Hierarchy_detection.get_hierarchy_info ctx class_name in
  let parent_name = match parent_chain with p :: _ -> Some p | [] -> None in

  (* Class type definition *)
  bprintf buf "class type %s = object\n" class_type_name;

  generate_class_signature_body ~ctx ~buf
    ~layer1_module_name:module_names.layer1
    ~current_layer2_module:module_names.layer2
    ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes:[class_name] ~parent_name ();

  bprintf buf "end\n\n";

  (* Class declaration referencing the class type *)
  bprintf buf "class %s : %s.t -> %s\n\n" class_snake module_names.layer1 class_type_name;

  (* Constructor wrappers *)
  List.iter constructors ~f:(fun ctor ->
    if Layer1.Layer1_constructor.should_generate_constructor ~ctx ctor then begin
      let ocaml_ctor_name = Utils.ocaml_constructor_name ~class_name ctor in
      let param_types =
        List.map ctor.ctor_parameters ~f:(fun param ->
          get_constructor_param_type ~ctx ~current_layer2_module:module_names.layer2 param
        )
      in

      if List.length param_types = 0 then (
        (* Zero-param constructor *)
        bprintf buf "val %s : unit -> %s\n" ocaml_ctor_name class_type_name
      ) else (
        (* Multi-param constructor *)
        let sig_parts = List.map param_types ~f:(fun typ ->
          sprintf "%s -> " typ
        ) in
        let sig_str = String.concat ~sep:"" sig_parts in
        bprintf buf "val %s : %s%s\n" ocaml_ctor_name sig_str class_type_name
      )
    end
  );

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
    let parent_chain = parent_chain_for_entity entity.name in
    let parent_name = match parent_chain with p :: _ -> Some p | [] -> None in
    let module_name = Class_utils.get_qualified_module_name ~ctx entity.name in
    let class_snake = sanitize_name entity.name in
    let hierarchy_info = Hierarchy_detection.get_hierarchy_info ctx entity.name in
    generate_entity ~buf ~i ~class_snake ~module_name ~current_layer2_module
      ~class_name:entity.name ~c_type:entity.c_type
      ~methods:entity.methods ~properties:entity.properties ~signals:entity.signals
      ~hierarchy_info ~same_cluster_classes ~parent_name;
  ) sorted_entities;

  Buffer.contents buf

(** Generate combined class modules for cyclic dependencies *)
let generate_combined_class_module ~ctx ~combined_module_name ~entities ~parent_chain_for_entity =
  let buf = Buffer.create 4096 in
  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n(* Combined classes for cyclic dependencies *)\n";

  (* Pass 1: class type definitions *)
  let generate_class_type ~buf ~i ~class_snake ~module_name:_ ~current_layer2_module
      ~class_name ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes ~parent_name =
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
      ~hierarchy_info ~same_cluster_classes ~parent_name ();

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
      ~class_name ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes ~parent_name =
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
      ~hierarchy_info ~same_cluster_classes ~parent_name ();

    bprintf buf "end\n"
  in

  let classes_text =
    generate_combined_entities ~ctx ~combined_module_name ~entities ~parent_chain_for_entity
      ~header_text:"" ~generate_entity:generate_class_impl
  in
  Buffer.add_string buf classes_text;

  (* Constructor wrappers for each entity *)
  let current_layer2_module = "G" ^ combined_module_name in
  List.iter entities ~f:(fun entity ->
    let class_snake = sanitize_name entity.name in
    let class_type_name = class_snake ^ "_t" in
    let module_name = Class_utils.get_qualified_module_name ~ctx entity.name in
    List.iter entity.constructors ~f:(fun ctor ->
      if Layer1.Layer1_constructor.should_generate_constructor ~ctx ctor then begin
        let ocaml_ctor_name = Utils.ocaml_constructor_name ~class_name:entity.name ctor in
        let param_names_types_and_info =
          List.map ctor.ctor_parameters ~f:(fun param ->
            let param_name = Utils.ocaml_parameter_name param.param_name in
            let param_type = get_constructor_param_type ~ctx ~current_layer2_module param in
            let is_class = get_param_layer2_type ~ctx ~current_layer2_module param |> Option.is_some in
            (param_name, param_type, is_class, param)
          )
        in

        if List.length param_names_types_and_info = 0 then (
          (* Zero-param constructor *)
          bprintf buf "let %s () : %s =\n" ocaml_ctor_name class_type_name;
          bprintf buf "  new %s (%s.%s ())\n\n" class_snake module_name ocaml_ctor_name
        ) else (
          (* Multi-param constructor *)
          let sig_parts = List.map param_names_types_and_info ~f:(fun (name, typ, _, _) ->
            sprintf "(%s : %s)" name typ
          ) in
          let sig_str = String.concat ~sep:" " sig_parts in
          bprintf buf "let %s %s : %s =\n" ocaml_ctor_name sig_str class_type_name;

          (* Generate unwrapping bindings for class parameters *)
          List.iter param_names_types_and_info ~f:(fun (param_name, _, is_class, param) ->
            if is_class then (
              let accessor = get_accessor_name ~ctx param in
              if param.nullable || param.param_type.nullable then
                bprintf buf "  let %s = Option.map (fun c -> c#%s) %s in\n" param_name accessor param_name
              else
                bprintf buf "  let %s = %s#%s in\n" param_name param_name accessor
            )
          );

          let call_parts = List.map param_names_types_and_info ~f:(fun (name, _, _, _) -> name) in
          let call_str = String.concat ~sep:" " call_parts in
          bprintf buf "  new %s (%s.%s %s)\n\n" class_snake module_name ocaml_ctor_name call_str
        )
      end
    )
  );

  Buffer.contents buf

(** Generate combined class signatures for cyclic dependencies *)
let generate_combined_class_signature ~ctx ~combined_module_name ~entities ~parent_chain_for_entity =
  let buf = Buffer.create 4096 in

  (* Pass 1: class type definitions *)
  let generate_class_type ~buf ~i ~class_snake ~module_name:_ ~current_layer2_module
      ~class_name ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes ~parent_name =
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
      ~hierarchy_info ~same_cluster_classes ~parent_name ();

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
      ~class_name:_ ~c_type:_ ~methods:_ ~properties:_ ~signals:_ ~hierarchy_info:_ ~same_cluster_classes:_ ~parent_name:_ =
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

  (* Constructor wrappers for each entity *)
  let current_layer2_module = "G" ^ combined_module_name in
  List.iter entities ~f:(fun entity ->
    let class_snake = sanitize_name entity.name in
    let class_type_name = class_snake ^ "_t" in
    List.iter entity.constructors ~f:(fun ctor ->
      if Layer1.Layer1_constructor.should_generate_constructor ~ctx ctor then begin
        let ocaml_ctor_name = Utils.ocaml_constructor_name ~class_name:entity.name ctor in
        let param_types =
          List.map ctor.ctor_parameters ~f:(fun param ->
            get_constructor_param_type ~ctx ~current_layer2_module param
          )
        in

        if List.length param_types = 0 then (
          (* Zero-param constructor *)
          bprintf buf "val %s : unit -> %s\n" ocaml_ctor_name class_type_name
        ) else (
          (* Multi-param constructor *)
          let sig_parts = List.map param_types ~f:(fun typ ->
            sprintf "%s -> " typ
          ) in
          let sig_str = String.concat ~sep:"" sig_parts in
          bprintf buf "val %s : %s%s\n" ocaml_ctor_name sig_str class_type_name
        )
      end
    )
  );

  Buffer.contents buf

(** Generate cyclic shim module (implementation) *)
let generate_cyclic_shim_module ~ctx ~entity ~combined_module_name ~g_combined_module_name =
  let buf = Buffer.create 512 in

  (* Get the layer 1 module name for this entity *)
  let layer1_module_name = Utils.module_name_of_class entity.name in

  (* Generate the entity's lowercase name (e.g., "window" from "Window") *)
  let entity_snake = sanitize_name entity.name in

  (* Use the shim module as current_layer2_module so sibling types in the same
     cycle get qualified through the combined module, not left unqualified *)
  let current_layer2_module = "G" ^ Utils.module_name_of_class entity.name in

  (* Build constructor wrapper functions *)
  let generate_constructor_wrapper buf ctor =
    let ocaml_ctor_name = Utils.ocaml_constructor_name ~class_name:entity.name ctor in
    (* Build parameter list and info *)
    let param_info =
      List.map ctor.ctor_parameters ~f:(fun param ->
          let param_name = Utils.ocaml_parameter_name param.param_name in
          let param_type = get_constructor_param_type ~ctx ~current_layer2_module param in
          let is_class = get_param_layer2_type ~ctx ~current_layer2_module param |> Option.is_some in
          (param_name, param_type, is_class, param)
      )
    in
    let param_strs =
      List.map param_info ~f:(fun (param_name, param_type, _, _) ->
          sprintf "(%s : %s)" param_name param_type)
    in
    let params =
      if List.length param_strs = 0 then "()"
      else String.concat ~sep:" " param_strs
    in
    let args =
      if List.length param_info = 0 then " ()"
      else
        let arg_names =
          List.map param_info ~f:(fun (name, _, _, _) -> name)
        in
        " " ^ String.concat ~sep:" " arg_names
    in
    bprintf buf "\nlet %s %s : %s_t =\n" ocaml_ctor_name params entity_snake;

    (* Generate unwrapping bindings for class parameters *)
    List.iter param_info ~f:(fun (param_name, _, is_class, param) ->
      if is_class then (
        let accessor = get_accessor_name ~ctx param in
        if param.nullable || param.param_type.nullable then
          bprintf buf "  let %s = Option.map (fun c -> c#%s) %s in\n" param_name accessor param_name
        else
          bprintf buf "  let %s = %s#%s in\n" param_name param_name accessor
      )
    );

    bprintf buf "  new %s\n" entity_snake;
    bprintf buf "    (%s.%s.%s%s)\n" combined_module_name layer1_module_name
      ocaml_ctor_name args
  in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* Shim module for %s from cyclic group %s *)\n\n"
    entity.name combined_module_name;
  bprintf buf "class type %s_t = %s.%s_t\n\n" entity_snake
    g_combined_module_name entity_snake;
  bprintf buf "class %s = %s.%s\n" entity_snake g_combined_module_name
    entity_snake;

  (* Generate constructor wrappers *)
  List.iter entity.constructors ~f:(fun ctor ->
      if Layer1.Layer1_constructor.should_generate_constructor ~ctx ctor then
        generate_constructor_wrapper buf ctor);

  Buffer.contents buf

(** Generate cyclic shim signature *)
let generate_cyclic_shim_signature ~ctx ~entity ~combined_module_name ~g_combined_module_name =
  let buf = Buffer.create 512 in

  (* Get the layer 1 module name for this entity *)
  let layer1_module_name = Utils.module_name_of_class entity.name in

  (* Generate the entity's lowercase name (e.g., "window" from "Window") *)
  let entity_snake = sanitize_name entity.name in

  (* Use the shim module as current_layer2_module so sibling types get qualified *)
  let current_layer2_module = "G" ^ Utils.module_name_of_class entity.name in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* Shim module for %s from cyclic group %s *)\n\n"
    entity.name combined_module_name;
  bprintf buf "class type %s_t = %s.%s_t\n\n" entity_snake
    g_combined_module_name entity_snake;
  bprintf buf "class %s : %s.%s.t -> %s_t\n" entity_snake
    combined_module_name layer1_module_name entity_snake;

  (* Generate constructor wrapper signatures *)
  List.iter entity.constructors ~f:(fun ctor ->
      if Layer1.Layer1_constructor.should_generate_constructor ~ctx ctor then begin
        let ocaml_ctor_name = Utils.ocaml_constructor_name ~class_name:entity.name ctor in
        let param_strs =
          List.map ctor.ctor_parameters ~f:(fun param ->
              get_constructor_param_type ~ctx ~current_layer2_module param)
        in
        let signature =
          if List.length param_strs = 0 then "unit -> " ^ entity_snake ^ "_t"
          else String.concat ~sep:" -> " (param_strs @ [ entity_snake ^ "_t" ])
        in
        bprintf buf "\nval %s : %s" ocaml_ctor_name signature
      end);
  bprintf buf "\n";

  Buffer.contents buf