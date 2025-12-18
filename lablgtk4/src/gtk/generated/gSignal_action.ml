(* High-level class for SignalAction *)
class signal_action (obj : Signal_action.t) = object (self)

  method signal_name = Signal_action.get_signal_name obj

    method as_signal_action = obj
end

