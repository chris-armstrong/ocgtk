(* Hierarchy Detection and Classification *)

open Types

(* Hierarchy configuration *)
let hierarchy_definitions = [
  {
    hierarchy = WidgetHierarchy;
    gir_root = "Widget";
    layer2_module = "GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget";
    class_type_name = "widget_skel";
    accessor_method = "as_widget";
    layer1_base_type = "Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t";
    base_conversion_method = "Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.as_widget"
  };
  {
    hierarchy = EventControllerHierarchy;
    gir_root = "EventController";
    layer2_module = "GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget";
    class_type_name = "controller_skel";
    accessor_method = "as_event_controller";
    layer1_base_type = "Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t";
    base_conversion_method = "Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.as_event_controller"
  };
  {
    hierarchy = CellRendererHierarchy;
    gir_root = "CellRenderer";
    layer2_module = "GCell_renderer";
    class_type_name = "cell_renderer_skel";
    accessor_method = "as_cell_renderer";
    layer1_base_type = "Cell_renderer.t";
    base_conversion_method = "Cell_renderer.as_event_controller"
  };
  {
    hierarchy = LayoutManagerHierarchy;
    gir_root = "LayoutManager";
    layer2_module = "GLayout";
    class_type_name = "layout_manager_skel";
    accessor_method = "as_layoutmanager";
    layer1_base_type = "Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t";
    base_conversion_method = "Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.as_layout_manager"
  };
  {
    hierarchy = ExpressionHierarchy;
    gir_root = "Expression";
    layer2_module = "GExpression";
    class_type_name = "expression_skel";
    accessor_method = "as_expression";
    layer1_base_type = "Expression.t";
    base_conversion_method = "Expression.as_expression"
  };
]

(* Build parent chain for a class *)
let rec build_parent_chain (ctx : generation_context) (class_name : string) : string list =
  let open List in
  match find_opt (fun cls -> cls.class_name = class_name) ctx.classes with
  | None -> []
  | Some cls ->
      match cls.parent with
      | None -> []
      | Some parent -> parent :: build_parent_chain ctx parent

(* Classify a class by its hierarchy *)
let classify_class (ctx : generation_context) (class_name : string) : hierarchy_info =
  let parent_chain = build_parent_chain ctx class_name in
  let all_ancestors = class_name :: parent_chain in

  (* Check each hierarchy definition *)
  let rec find_hierarchy = function
    | [] ->
        (* Default to monomorphic type *)
        {
          hierarchy = MonomorphicType;
          gir_root = class_name;
          layer2_module = "G" ^ class_name;
          class_type_name = String.lowercase_ascii class_name ^ "_skel";
          accessor_method = "as_" ^ String.lowercase_ascii class_name;
          layer1_base_type = (Class_utils.get_qualified_module_name ~ctx class_name) ^ ".t";
          base_conversion_method = (Class_utils.get_qualified_module_name ~ctx class_name) ^ ".as_" ^ Utils.to_snake_case class_name;
        }
    | hdef :: rest ->
        if List.mem hdef.gir_root all_ancestors then
          hdef
        else
          find_hierarchy rest
  in
  find_hierarchy hierarchy_definitions

(* Build hierarchy map for all classes *)
let build_hierarchy_map (ctx : generation_context) : (string, hierarchy_info) Hashtbl.t =
  let map = Hashtbl.create 100 in
  List.iter (fun cls ->
    let info = classify_class ctx cls.class_name in
    Hashtbl.add map cls.class_name info
  ) ctx.classes;
  map

(* Get hierarchy info for a class *)
let get_hierarchy_info (ctx : generation_context) (class_name : string) : hierarchy_info option =
  Hashtbl.find_opt ctx.hierarchy_map class_name

(* Check if a class is in a specific hierarchy *)
let is_in_hierarchy (ctx : generation_context) (class_name : string) (h : hierarchy_kind) : bool =
  match get_hierarchy_info ctx class_name with
  | Some info -> info.hierarchy = h
  | None -> false

(* Get the root class name for a hierarchy member *)
let get_hierarchy_root (ctx : generation_context) (class_name : string) : string option =
  match get_hierarchy_info ctx class_name with
  | Some info when info.hierarchy <> MonomorphicType -> Some info.gir_root
  | _ -> None
