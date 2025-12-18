class password_entry : Password_entry.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gpassword_entry_signals.password_entry_signals
    method get_show_peek_icon : unit -> bool
    method set_show_peek_icon : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_password_entry : Password_entry.t
  end

