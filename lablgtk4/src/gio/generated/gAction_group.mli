class action_group : Action_group.t ->
  object
    inherit Gaction_group_signals.action_group_signals
    method action_added : string -> unit
    method action_enabled_changed : string -> bool -> unit
    method action_removed : string -> unit
    method get_action_enabled : string -> bool
    method has_action : string -> bool
    method as_action_group : Action_group.t
  end

