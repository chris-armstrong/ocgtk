class flow_box_child : Flow_box_child.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gflow_box_child_signals.flow_box_child_signals
    method changed : unit -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_index : unit -> int
    method is_selected : unit -> bool
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_flow_box_child : Flow_box_child.t
  end

