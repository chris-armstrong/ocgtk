class widget_paintable : Widget_paintable.t ->
  object
    method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method set_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method as_widget_paintable : Widget_paintable.t
  end

