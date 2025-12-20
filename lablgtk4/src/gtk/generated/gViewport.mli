class viewport : Viewport.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_scroll_to_focus : unit -> bool
    method scroll_to : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> Scroll_info.t option -> unit
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_scroll_to_focus : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_viewport : Viewport.t
  end

