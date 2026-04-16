class type viewport_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GScrollable.scrollable_t

  method get_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_scroll_to_focus : unit -> bool

  method scroll_to :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    Scroll_info.t option ->
    unit

  method set_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_scroll_to_focus : bool -> unit
  method as_viewport : Viewport.t
end

class viewport : Viewport.t -> viewport_t

val new_ :
  GAdjustment.adjustment_t option ->
  GAdjustment.adjustment_t option ->
  viewport_t
