class type simple_action_group_t = object
    method lookup : string -> GAction.action_t
    method remove : string -> unit
    method as_simple_action_group : Simple_action_group.t
end

class simple_action_group : Simple_action_group.t -> simple_action_group_t

