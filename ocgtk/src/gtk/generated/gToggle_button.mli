class toggle_button : Toggle_button.t ->
  object
    inherit Gtoggle_button_signals.toggle_button_signals
    method get_active : unit -> bool
    method set_active : bool -> unit
    method set_group : <as_toggle_button: Toggle_button.t; ..> option -> unit
    method toggled : unit -> unit
    method as_toggle_button : Toggle_button.t
  end

