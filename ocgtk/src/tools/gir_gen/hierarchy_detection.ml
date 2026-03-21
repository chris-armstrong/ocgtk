(* Hierarchy Detection and Classification *)

open Containers
open Types

(* Base hierarchy configuration - layer2_module will be computed dynamically *)
let base_hierarchy_definitions =
  [
    (WidgetHierarchy, "Widget", "widget", "as_widget");
    ( EventControllerHierarchy,
      "EventController",
      "event_controller",
      "as_event_controller" );
    (CellRendererHierarchy, "CellRenderer", "cell_renderer", "as_cell_renderer");
    ( LayoutManagerHierarchy,
      "LayoutManager",
      "layout_manager",
      "as_layoutmanager" );
    (ExpressionHierarchy, "Expression", "expression", "as_expression");
  ]

(* Build hierarchy definitions with proper module names from context *)
let build_hierarchy_definitions (ctx : generation_context) : hierarchy_info list
    =
  List.map
    (fun (hierarchy, gir_root, class_type_name, accessor_method) ->
      (* Compute the layer1 qualified module name *)
      let layer1_qualified =
        Class_utils.get_qualified_module_name ~ctx gir_root
      in

      (* Compute the layer2 module name (G-prefixed version) *)
      (* For cyclic modules, we need G + CombinedModuleName *)
      (* For non-cyclic, we need G + ClassName *)
      let layer2_module =
        match Hashtbl.find_opt ctx.module_groups gir_root with
        | Some combined_module_name ->
            let simple_module_name = Utils.module_name_of_class gir_root in
            if not (String.equal combined_module_name simple_module_name) then
              (* Cyclic module - use G + CombinedModuleName *)
              "G" ^ combined_module_name
            else
              (* Single module *)
              "G" ^ simple_module_name
        | None -> "G" ^ Utils.module_name_of_class gir_root
      in

      {
        hierarchy;
        gir_root;
        layer2_module;
        class_type_name;
        accessor_method;
        layer1_base_type = layer1_qualified ^ ".t";
        base_conversion_method = layer1_qualified ^ "." ^ accessor_method;
      })
    base_hierarchy_definitions

(* Build parent chain for a class *)
let rec build_parent_chain (ctx : generation_context) (class_name : string) :
    string list =
  let namespace, class_name = Utils.name_to_parts ~ctx class_name in
  let result =
    if String.equal namespace ctx.namespace.namespace_name then
      (* current namespace *)
      let open Option in
      let* cls =
        List.find_opt
          (fun cls -> String.equal cls.class_name class_name)
          ctx.classes
      in
      let* parent = cls.parent in
      Some (parent :: build_parent_chain ctx parent)
    else
      (* external namespace *)
      let open Option in
      let* ncr_namespace = StringMap.find_opt namespace ctx.cross_references in
      let* entity =
        ncr_namespace.ncr_entities |> StringMap.find_opt class_name
      in
      match entity with
      | { cr_type = Crt_Class { parent = Some parent }; _ } ->
          Some (parent :: build_parent_chain ctx parent)
      | { cr_type = Crt_Class { parent = None }; _ } -> Some []
      | _ ->
          failwith
            ("Unexpected entity type as parent of " ^ namespace ^ "."
           ^ class_name)
  in
  result |> Option.value ~default:[]

(* Classify a class by its hierarchy *)
let classify_class (ctx : generation_context) (class_name : string) :
    hierarchy_info =
  (* Default to monomorphic type *)
  (* Compute layer2 module name for non-hierarchy classes *)
  let layer2_module =
    match Hashtbl.find_opt ctx.module_groups class_name with
    | Some combined_module_name ->
        let simple_module_name = Utils.module_name_of_class class_name in
        if not (String.equal combined_module_name simple_module_name) then
          (* Cyclic module - use G + CombinedModuleName *)
          "G" ^ combined_module_name
        else
          (* Single module *)
          "G" ^ simple_module_name
    | None -> "G" ^ Utils.module_name_of_class class_name
  in
  {
    hierarchy = MonomorphicType;
    gir_root = class_name;
    layer2_module;
    class_type_name = Utils.ocaml_class_name class_name ^ "_skel";
    accessor_method = "as_" ^ Utils.ocaml_class_name class_name;
    layer1_base_type =
      Class_utils.get_qualified_module_name ~ctx class_name ^ ".t";
    base_conversion_method =
      Class_utils.get_qualified_module_name ~ctx class_name
      ^ ".as_"
      ^ Utils.to_snake_case class_name;
  }

(* Classify a class by its hierarchy *)
let classify_external_class (ctx : generation_context) (namespace : string)
    (class_name : string) : hierarchy_info option =
  let open Option in
  let* cls = StringMap.find_opt namespace ctx.cross_references in
  let* entity = StringMap.find_opt class_name cls.ncr_entities in
  match entity.cr_type with
  | Crt_Class _ | Crt_Interface | Crt_Record _ ->
      Some
        {
          hierarchy = MonomorphicType;
          gir_root = class_name;
          layer2_module =
            Utils.external_namespace_to_module_name namespace
            ^ "."
            ^ Utils.ocaml_class_name class_name;
          (* TODO: remove field *)
          class_type_name = Utils.ocaml_class_name class_name ^ "_skel";
          accessor_method = "as_" ^ Utils.ocaml_class_name class_name;
          layer1_base_type =
            Utils.external_namespace_to_module_name namespace
            ^ "."
            ^ Utils.module_name_of_class class_name
            ^ ".t";
          base_conversion_method =
            Utils.external_namespace_to_module_name namespace
            ^ "."
            ^ Utils.module_name_of_class class_name
            ^ ".as_"
            ^ Utils.to_snake_case class_name;
        }
  | _ -> None

(* Build hierarchy map for all classes *)
let build_hierarchy_map (ctx : generation_context) :
    (string, hierarchy_info) Hashtbl.t =
  let map = Hashtbl.create 100 in
  List.iter
    (fun cls ->
      let info = classify_class ctx cls.class_name in
      Hashtbl.add map cls.class_name info)
    ctx.classes;
  map

(* Get hierarchy info for a class *)
let get_hierarchy_info (ctx : generation_context) (class_name : string) :
    hierarchy_info option =
  let namespace, class_name = Utils.name_to_parts ~ctx class_name in
  if String.equal namespace ctx.namespace.namespace_name then
    Hashtbl.find_opt ctx.hierarchy_map class_name
  else classify_external_class ctx namespace class_name

(* Check if a class is in a specific hierarchy *)
let is_in_hierarchy (ctx : generation_context) (class_name : string)
    (h : hierarchy_kind) : bool =
  match get_hierarchy_info ctx class_name with
  | Some info -> Types.equal_hierarchy_kind info.hierarchy h
  | None -> false

(* Get the root class name for a hierarchy member *)
let get_hierarchy_root (ctx : generation_context) (class_name : string) :
    string option =
  match get_hierarchy_info ctx class_name with
  | Some info
    when not (Types.equal_hierarchy_kind info.hierarchy MonomorphicType) ->
      Some info.gir_root
  | _ -> None
