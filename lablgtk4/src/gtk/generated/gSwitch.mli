class switch : Switch.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gswitch_signals.switch_signals
    method get_active : unit -> bool
    method get_state : unit -> bool
    method set_active : bool -> unit
    method set_state : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_switch : Switch.t
  end

