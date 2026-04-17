class type flow_box_child_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit Gflow_box_child_signals.flow_box_child_signals
  method changed : unit -> unit

  method get_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_index : unit -> int
  method is_selected : unit -> bool

  method set_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method as_flow_box_child : Flow_box_child.t
end

class flow_box_child : Flow_box_child.t -> flow_box_child_t

val new_ : unit -> flow_box_child_t
