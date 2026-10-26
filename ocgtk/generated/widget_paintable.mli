class type widget_paintable_t = object
  inherit Ocgdk.Paintable.paintable_t

  method get_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method set_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method as_widget_paintable : Raw.Widget_paintable.t
end

class widget_paintable : Raw.Widget_paintable.t -> widget_paintable_t

val new_ :
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .widget_t
  option ->
  widget_paintable_t
