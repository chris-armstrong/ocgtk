class named_action : Named_action.t ->
  object
    method action_name : string
    method as_named_action : Named_action.t
  end

