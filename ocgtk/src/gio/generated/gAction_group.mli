class type action_group_t = object
  inherit Gaction_group_signals.action_group_signals
  method action_added : string -> unit
  method action_enabled_changed : string -> bool -> unit
  method action_removed : string -> unit
  method action_state_changed : string -> Gvariant.t -> unit
  method activate_action : string -> Gvariant.t option -> unit
  method change_action_state : string -> Gvariant.t -> unit
  method get_action_enabled : string -> bool
  method get_action_parameter_type : string -> Gvariant_type.t option
  method get_action_state : string -> Gvariant.t option
  method get_action_state_hint : string -> Gvariant.t option
  method get_action_state_type : string -> Gvariant_type.t option
  method has_action : string -> bool
  method list_actions : unit -> string array
  method as_action_group : Action_group.t
end

class action_group : Action_group.t -> action_group_t
