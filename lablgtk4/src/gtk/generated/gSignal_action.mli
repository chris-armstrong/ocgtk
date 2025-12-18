class signal_action : Signal_action.t ->
  object
    method get_signal_name : unit -> string
    method as_signal_action : Signal_action.t
  end

