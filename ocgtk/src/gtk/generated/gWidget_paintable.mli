class type widget_paintable_t = object
    method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method set_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method as_widget_paintable : Widget_paintable.t
end

class widget_paintable : Widget_paintable.t -> widget_paintable_t

val new_ : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> widget_paintable_t
