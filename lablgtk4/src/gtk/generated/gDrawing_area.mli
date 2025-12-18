class drawing_area : Drawing_area.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gdrawing_area_signals.drawing_area_signals
    method content_height : int
    method set_content_height : int -> unit
    method content_width : int
    method set_content_width : int -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_drawing_area : Drawing_area.t
  end

