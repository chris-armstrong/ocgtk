class signal_action : Signal_action.t ->
  object
    method signal_name : string
    method as_signal_action : Signal_action.t
  end

