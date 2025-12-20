class action_map : Action_map.t ->
  object
    method remove_action : string -> unit
    method as_action_map : Action_map.t
  end

