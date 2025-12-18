class volume_button : Volume_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method use_symbolic : bool
    method set_use_symbolic : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_volume_button : Volume_button.t
  end

