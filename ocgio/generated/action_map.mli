class type action_map_t = object
  method add_action : Action.action_t -> unit
  method lookup_action : string -> Action.action_t option
  method remove_action : string -> unit
  method remove_action_entries : Raw.Action_entry.t array -> int -> unit
  method as_action_map : Raw.Action_map.t
end

class action_map : Raw.Action_map.t -> action_map_t
