class simple_action_group : Simple_action_group.t ->
  object
    method lookup : string -> GAction.action
    method remove : string -> unit
    method as_simple_action_group : Simple_action_group.t
  end

