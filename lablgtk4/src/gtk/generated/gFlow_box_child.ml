(* Signal class defined in gflow_box_child_signals.ml *)

(* High-level class for FlowBoxChild *)
class flow_box_child (obj : Flow_box_child.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Flow_box_child.as_widget obj)
  inherit Gflow_box_child_signals.flow_box_child_signals obj

  method changed : unit -> unit = fun () -> (Flow_box_child.changed obj )

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Flow_box_child.get_child obj )

  method get_index : unit -> int = fun () -> (Flow_box_child.get_index obj )

  method is_selected : unit -> bool = fun () -> (Flow_box_child.is_selected obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Flow_box_child.set_child obj child)

  method as_widget = (Flow_box_child.as_widget obj)
    method as_flow_box_child = obj
end

