class type simple_action_group_t = object
    inherit GAction_group.action_group_t
    inherit GAction_map.action_map_t
    method lookup : string -> GAction.action_t
    method remove : string -> unit
    method as_simple_action_group : Simple_action_group.t
end

class simple_action_group : Simple_action_group.t -> simple_action_group_t

val new_ : unit -> simple_action_group_t
