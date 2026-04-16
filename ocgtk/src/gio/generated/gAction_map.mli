class type action_map_t = object
  method add_action : GAction.action_t -> unit
  method lookup_action : string -> GAction.action_t option
  method remove_action : string -> unit
  method remove_action_entries : Action_entry.t array -> int -> unit
  method as_action_map : Action_map.t
end

class action_map : Action_map.t -> action_map_t
