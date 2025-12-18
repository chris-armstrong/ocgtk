class toggle_button : Toggle_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gtoggle_button_signals.toggle_button_signals
    method get_active : unit -> bool
    method set_active : bool -> unit
    method set_group : <as_toggle_button: Toggle_button.t; ..> option -> unit
    method toggled : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_toggle_button : Toggle_button.t
  end

