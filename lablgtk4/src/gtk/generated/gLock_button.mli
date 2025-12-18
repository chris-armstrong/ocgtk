class lock_button : Lock_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method text_lock : string
    method set_text_lock : string -> unit
    method text_unlock : string
    method set_text_unlock : string -> unit
    method tooltip_lock : string
    method set_tooltip_lock : string -> unit
    method tooltip_not_authorized : string
    method set_tooltip_not_authorized : string -> unit
    method tooltip_unlock : string
    method set_tooltip_unlock : string -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_lock_button : Lock_button.t
  end

