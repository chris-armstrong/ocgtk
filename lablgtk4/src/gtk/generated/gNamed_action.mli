class named_action : Named_action.t ->
  object
    method get_action_name : unit -> string
    method as_named_action : Named_action.t
  end

