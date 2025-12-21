class simple_action : Simple_action.t ->
  object
    inherit Gsimple_action_signals.simple_action_signals
    method set_enabled : bool -> unit
    method name : string
    method as_simple_action : Simple_action.t
  end

