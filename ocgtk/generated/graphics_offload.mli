class type graphics_offload_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_black_background : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_enabled : unit -> Enums.graphicsoffloadenabled
  method set_black_background : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_enabled : Enums.graphicsoffloadenabled -> unit
  method as_graphics_offload : Raw.Graphics_offload.t
end

class graphics_offload : Raw.Graphics_offload.t -> graphics_offload_t

val new_ :
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .widget_t
  option ->
  graphics_offload_t
