class type switch_t = object
    inherit Gswitch_signals.switch_signals
    method get_active : unit -> bool
    method get_state : unit -> bool
    method set_active : bool -> unit
    method set_state : bool -> unit
    method as_switch : Switch.t
end

class switch : Switch.t -> switch_t

