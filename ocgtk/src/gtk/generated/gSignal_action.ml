class type signal_action_t = object
    method get_signal_name : unit -> string
    method as_signal_action : Signal_action.t
end

(* High-level class for SignalAction *)
class signal_action (obj : Signal_action.t) : signal_action_t = object (self)

  method get_signal_name : unit -> string =
    fun () ->
      (Signal_action.get_signal_name obj)

    method as_signal_action = obj
end

