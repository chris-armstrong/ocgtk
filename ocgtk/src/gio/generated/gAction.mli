class action : Action.t ->
  object
    method get_enabled : unit -> bool
    method get_name : unit -> string
    method as_action : Action.t
  end

