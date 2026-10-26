class type viewport_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Scrollable.scrollable_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_scroll_to_focus : unit -> bool

  method scroll_to :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Raw.Scroll_info.t option ->
    unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_scroll_to_focus : bool -> unit
  method as_viewport : Raw.Viewport.t
end

class viewport : Raw.Viewport.t -> viewport_t

val new_ :
  Adjustment.adjustment_t option -> Adjustment.adjustment_t option -> viewport_t
