class type toggle_button_t = object
    inherit Gtoggle_button_signals.toggle_button_signals
    method get_active : unit -> bool
    method set_active : bool -> unit
    method set_group : toggle_button_t option -> unit
    method toggled : unit -> unit
    method as_toggle_button : Toggle_button.t
end

class toggle_button : Toggle_button.t -> toggle_button_t

