class actionable : Actionable.t ->
  object
    method get_action_name : unit -> string option
    method set_action_name : string option -> unit
    method set_detailed_action_name : string -> unit
    method as_actionable : Actionable.t
  end

