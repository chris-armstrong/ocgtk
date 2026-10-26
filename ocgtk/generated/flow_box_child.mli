class type flow_box_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method changed : unit -> unit

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_index : unit -> int
  method is_selected : unit -> bool

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method as_flow_box_child : Raw.Flow_box_child.t
end

class flow_box_child : Raw.Flow_box_child.t -> flow_box_child_t

val new_ : unit -> flow_box_child_t
