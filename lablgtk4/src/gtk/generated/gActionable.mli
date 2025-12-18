class actionable : Actionable.t ->
  object
    method action_name : string
    method set_action_name : string -> unit
    method set_detailed_action_name : string -> unit
    method as_actionable : Actionable.t
  end

