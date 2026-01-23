class action_map : Action_map.t ->
  object
    method lookup_action : string -> GAction.action option
    method remove_action : string -> unit
    method remove_action_entries : Action_entry.t array -> int -> unit
    method as_action_map : Action_map.t
  end

