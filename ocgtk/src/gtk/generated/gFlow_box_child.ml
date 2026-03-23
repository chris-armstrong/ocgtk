(* Signal class defined in gflow_box_child_signals.ml *)

class type flow_box_child_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gflow_box_child_signals.flow_box_child_signals
    method changed : unit -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_index : unit -> int
    method is_selected : unit -> bool
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method as_flow_box_child : Flow_box_child.t
end

(* High-level class for FlowBoxChild *)
class flow_box_child (obj : Flow_box_child.t) : flow_box_child_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gflow_box_child_signals.flow_box_child_signals obj

  method changed : unit -> unit =
    fun () ->
      (Flow_box_child.changed obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Flow_box_child.get_child obj)

  method get_index : unit -> int =
    fun () ->
      (Flow_box_child.get_index obj)

  method is_selected : unit -> bool =
    fun () ->
      (Flow_box_child.is_selected obj)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Flow_box_child.set_child obj child)

    method as_flow_box_child = obj
end

let new_ () : flow_box_child_t =
  new flow_box_child (Flow_box_child.new_ ())

