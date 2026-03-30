class type remote_action_group_t = object
    method activate_action_full : string -> Gvariant.t option -> Gvariant.t -> unit
    method change_action_state_full : string -> Gvariant.t -> Gvariant.t -> unit
    method as_remote_action_group : Remote_action_group.t
end

class remote_action_group : Remote_action_group.t -> remote_action_group_t

